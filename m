From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: manual merge of the drbd tree with Linus'
	tree
Date: Tue, 1 Jun 2010 14:13:24 +1000
Message-ID: <20100601141324.edf41f7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Cc: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the drbd tree got a conflict in fs/pipe.c
between commit cc967be54710d97c05229b2e5ba2d00df84ddd64 ("fs: Add missing
mutex_unlock") from Linus' tree and commits
0191f8697bbdfefcd36e7b8dc3eeddfe82893e4b ("pipe: F_SETPIPE_SZ should
return -EPERM for non-root") and b9598db3401282bb27b4aef77e3eee12015f7f29
("pipe: make F_{GET,SET}PIPE_SZ deal with byte sizes") from the drbd tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

diff --cc fs/pipe.c
index db6eaab,bdd3f96..0000000
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@@ -1174,23 -1162,30 +1168,34 @@@ long pipe_fcntl(struct file *file, unsi
  	mutex_lock(&pipe->inode->i_mutex);
  
  	switch (cmd) {
- 	case F_SETPIPE_SZ:
- 		if (!capable(CAP_SYS_ADMIN) && arg > pipe_max_pages) {
- 			ret = -EINVAL;
+ 	case F_SETPIPE_SZ: {
+ 		unsigned long nr_pages;
+ 
+ 		/*
+ 		 * Currently the array must be a power-of-2 size, so adjust
+ 		 * upwards if needed.
+ 		 */
+ 		nr_pages = (arg + PAGE_SIZE - 1) >> PAGE_SHIFT;
+ 		nr_pages = roundup_pow_of_two(nr_pages);
+ 
 -		if (!capable(CAP_SYS_ADMIN) && nr_pages > pipe_max_pages)
 -			return -EPERM;
++		if (!capable(CAP_SYS_ADMIN) && nr_pages > pipe_max_pages) {
++			ret = -EPERM;
 +			goto out;
 +		}
+ 
  		/*
  		 * The pipe needs to be at least 2 pages large to
  		 * guarantee POSIX behaviour.
  		 */
- 		if (arg < 2) {
 -		if (nr_pages < 2)
 -			return -EINVAL;
++		if (nr_pages < 2) {
 +			ret = -EINVAL;
 +			goto out;
 +		}
- 		ret = pipe_set_size(pipe, arg);
+ 		ret = pipe_set_size(pipe, nr_pages);
  		break;
+ 		}
  	case F_GETPIPE_SZ:
- 		ret = pipe->buffers;
+ 		ret = pipe->buffers * PAGE_SIZE;
  		break;
  	default:
  		ret = -EINVAL;
