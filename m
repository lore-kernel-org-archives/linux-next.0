From: Dave Chinner <david@fromorbit.com>
Subject: Re: Linux-next parallel cp workload hang
Date: Thu, 19 May 2016 00:17:26 +1000
Message-ID: <20160518141726.GY26977@dastard>
References: <20160518014615.GA5302@ZX.nay.redhat.com>
 <20160518055634.GW26977@dastard>
 <20160518083150.GB6551@dhcp12-144.nay.redhat.com>
 <20160518095409.GX26977@dastard>
 <20160518114617.GC6551@dhcp12-144.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160518114617.GC6551@dhcp12-144.nay.redhat.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Xiong Zhou <xzhou@redhat.com>
Cc: linux-next@vger.kernel.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, May 18, 2016 at 07:46:17PM +0800, Xiong Zhou wrote:
> 
> On Wed, May 18, 2016 at 07:54:09PM +1000, Dave Chinner wrote:
> > On Wed, May 18, 2016 at 04:31:50PM +0800, Xiong Zhou wrote:
> > > Hi,
> > > 
> > > On Wed, May 18, 2016 at 03:56:34PM +1000, Dave Chinner wrote:
> > > > On Wed, May 18, 2016 at 09:46:15AM +0800, Xiong Zhou wrote:
> > > > > Hi,
> > > > > 
> > > > > Parallel cp workload (xfstests generic/273) hangs like blow.
> > > > > It's reproducible with a small chance, less the 1/100 i think.
> > > > > 
> > > > > Have hit this in linux-next 20160504 0506 0510 trees, testing on
> > > > > xfs with loop or block device. Ext4 survived several rounds
> > > > > of testing.
> > > > > 
> > > > > Linux next 20160510 tree hangs within 500 rounds testing several
> > > > > times. The same tree with vfs parallel lookup patchset reverted
> > > > > survived 900 rounds testing. Reverted commits are attached.  > 

Ok, this is trivial to reproduce. Al - I've hit this 9 times out of
ten running it on a 4p VM with a pair of 4GB ram disks using all
the current upstream default mkfs and mount configurations. On the
tenth attempt I got the tracing to capture what I needed to see -
process 7340 was the last xfs_buf_lock_done trace without an unlock
trace, and that process had this trace:

schedule
rwsem_down_read_failed
call_rwsem_down_read_failed
down_read
xfs_ilock
xfs_ilock_data_map_shared
xfs_dir2_leaf_getdents
xfs_readdir
xfs_file_readdir
iterate_dir
SyS_getdents
entry_SYSCALL_64_fastpath

Which means it's holding a buffer lock while trying to get the
ilock(shared). That's never going to end well - I'm now wondering
why lockdep hasn't been all over this lock order inversion....

Essentially, it's a three-process deadlock involving
shared/exclusive barriers and inverted lock orders. It's a
pre-existing problem with buffer mapping lock orders, nothing to do
with with the VFS parallelisation code.

process 1		process 2		process 3
---------		---------		---------
readdir
iolock(shared)
  get_leaf_dents
    iterate entries
       ilock(shared)
       map, lock and read buffer
       iunlock(shared)
       process entries in buffer
       .....
       						readdir
						iolock(shared)
						  get_leaf_dents
						    iterate entries
						      ilock(shared)
						      map, lock buffer
						      <blocks>
       			finish ->iterate_shared
			file_accessed()
			  ->update_time
			    start transaction
			    ilock(excl)
			    <blocks>
	.....
	finishes processing buffer
	get next buffer
	  ilock(shared)
	  <blocks>

And that's the deadlock.

Now I know what the problem is I can say that process 2 - the
transactional timestamp update - is the reason the readdir
operations are blocking like this. And I know why CXFS never hit
this - it doesn't use the VFS paths, so the VFS calls to update
timestamps don't exist during concurrent readdir operations on the
CXFS metadata server. Hence process 2 doesn't exist and no exclusive
barriers are put in amongst the shared locking....

Patch below should fix the deadlock.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


xfs: concurrent readdir hangs on data buffer locks

From: Dave Chinner <dchinner@redhat.com>

There's a three-process deadlock involving shared/exclusive barriers
and inverted lock orders in the directory readdir implementation.
It's a pre-existing problem with lock ordering, exposed by the
VFS parallelisation code.

process 1               process 2               process 3
---------               ---------               ---------
readdir
iolock(shared)
  get_leaf_dents
    iterate entries
       ilock(shared)
       map, lock and read buffer
       iunlock(shared)
       process entries in buffer
       .....
                                                readdir
                                                iolock(shared)
                                                  get_leaf_dents
                                                    iterate entries
                                                      ilock(shared)
                                                      map, lock buffer
                                                      <blocks>
                        finish ->iterate_shared
                        file_accessed()
                          ->update_time
                            start transaction
                            ilock(excl)
                            <blocks>
        .....
        finishes processing buffer
        get next buffer
          ilock(shared)
          <blocks>

And that's the deadlock.

Fix this by dropping the current buffer lock in process 1 before
trying to map the next buffer. This means we keep the lock order of
ilock -> buffer lock intact and hence will allow process 3 to make
progress and drop it's ilock(shared) once it is done.

Reported-by: Xiong Zhou <xzhou@redhat.com>
Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/xfs_dir2_readdir.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_dir2_readdir.c b/fs/xfs/xfs_dir2_readdir.c
index 93b3ab0..21501dc 100644
--- a/fs/xfs/xfs_dir2_readdir.c
+++ b/fs/xfs/xfs_dir2_readdir.c
@@ -273,10 +273,11 @@ xfs_dir2_leaf_readbuf(
 	size_t			bufsize,
 	struct xfs_dir2_leaf_map_info *mip,
 	xfs_dir2_off_t		*curoff,
-	struct xfs_buf		**bpp)
+	struct xfs_buf		**bpp,
+	bool			trim_map)
 {
 	struct xfs_inode	*dp = args->dp;
-	struct xfs_buf		*bp = *bpp;
+	struct xfs_buf		*bp = NULL;
 	struct xfs_bmbt_irec	*map = mip->map;
 	struct blk_plug		plug;
 	int			error = 0;
@@ -286,13 +287,10 @@ xfs_dir2_leaf_readbuf(
 	struct xfs_da_geometry	*geo = args->geo;
 
 	/*
-	 * If we have a buffer, we need to release it and
-	 * take it out of the mapping.
+	 * If the caller just finished processing a buffer, it will tell us
+	 * we need to trim that block out of the mapping now it is done.
 	 */
-
-	if (bp) {
-		xfs_trans_brelse(NULL, bp);
-		bp = NULL;
+	if (trim_map) {
 		mip->map_blocks -= geo->fsbcount;
 		/*
 		 * Loop to get rid of the extents for the
@@ -533,10 +531,17 @@ xfs_dir2_leaf_getdents(
 		 */
 		if (!bp || ptr >= (char *)bp->b_addr + geo->blksize) {
 			int	lock_mode;
+			bool	trim_map = false;
+
+			if (bp) {
+				xfs_trans_brelse(NULL, bp);
+				bp = NULL;
+				trim_map = true;
+			}
 
 			lock_mode = xfs_ilock_data_map_shared(dp);
 			error = xfs_dir2_leaf_readbuf(args, bufsize, map_info,
-						      &curoff, &bp);
+						      &curoff, &bp, trim_map);
 			xfs_iunlock(dp, lock_mode);
 			if (error || !map_info->map_valid)
 				break;
