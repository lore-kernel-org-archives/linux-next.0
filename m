From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 3 Sep 2008 09:05:58 -0700
Message-ID: <20080903090558.de8510e8.akpm@linux-foundation.org>
References: <20080903161526.636b6d0d.sfr@canb.auug.org.au>
	<20080903063419.GK20055@kernel.dk>
	<20080903000418.aa2434fe.akpm@linux-foundation.org>
	<20080903070723.GL20055@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:47618 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751048AbYICQHP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 12:07:15 -0400
In-Reply-To: <20080903070723.GL20055@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, 3 Sep 2008 09:07:24 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:

> On Wed, Sep 03 2008, Andrew Morton wrote:
> > On Wed, 3 Sep 2008 08:34:21 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
> > 
> > > On Wed, Sep 03 2008, Stephen Rothwell wrote:
> > > > Hi Jens,
> > > > 
> > > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > > > 
> > > > block/genhd.c: In function 'show_partition':
> > > > block/genhd.c:718: error: 'struct hd_struct' has no member named 'private'
> > > > block/genhd.c:719: warning: passing argument 1 of 'seq_puts' from incompatible pointer type
> > > > block/genhd.c:720: error: 'struct hd_struct' has no member named 'private'
> > > > 
> > > > Caused by the merge because commit
> > > > ddef43a843f620c6742a06633739887a901ec06b ("block: restore original
> > > > behavior of /proc/partition when there's no partition") added references
> > > > to the 'private' member.  I removed the offending section of code (see
> > > > below) assuming the fix referred to in the comment has be done in the
> > > > block tree.
> > > 
> > > I'm in the very midst of updating to latest -git, I'll push it out in 5
> > > minutes or so. It'll also solve the two latest conflicts you saw.
> > > 
> > 
> > I get a nasty git reject around disk_seqf_next() from -next-20080902
> > and have yet to find a fix which doesn't oops all over the place. 
> > 
> > Am presently discommoded.  Please let this be fixed in -next-20080903 :(
> 
> I've updated for-2.6.28 (and thus for-next and for-akpm), we also had a
> couple of merge errors that resulted in bad bisect compiles. So I think
> it should be ok now.
> 

It's still oopsing all over the place.

From: Andrew Morton <akpm@linux-foundation.org>

BUG: unable to handle kernel NULL pointer dereference at 00000000
IP: [<c03cb7fb>] klist_next+0xb/0xb0
*pde = 00000000 
Oops: 0000 [#1] SMP 
last sysfs file: 
Dumping ftrace buffer:
   (ftrace buffer empty)
Modules linked in:

Pid: 1262, comm: mount Not tainted (2.6.27-rc5 #6)
EIP: 0060:[<c03cb7fb>] EFLAGS: 00010286 CPU: 0
EIP is at klist_next+0xb/0xb0
EAX: 00000000 EBX: 00000000 ECX: f61d7f2c EDX: f6aa0700
ESI: 00000000 EDI: f6aa0700 EBP: f61d7ef8 ESP: f61d7ee4
 DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
Process mount (pid: 1262, ti=f61d6000 task=f667b6b0 task.ti=f61d6000)
Stack: f61d7f00 fffffff4 00000000 f64b5b40 f6aa0700 f61d7f04 c02d03a7 c03f42dc 
       f61d7f0c c027fcc2 f61d7f48 c01a7e1e 00000400 b7fa6000 f65406d8 f64b5b60 
       00000000 0000003b 00000001 00000000 00000000 00000000 f7012da0 fffffffb 
Call Trace:
 [<c02d03a7>] ? class_dev_iter_next+0x17/0x40
 [<c027fcc2>] ? disk_seqf_next+0x12/0x20
 [<c01a7e1e>] ? seq_read+0x1ee/0x2d0
 [<c01a7c30>] ? seq_read+0x0/0x2d0
 [<c01c4a8c>] ? proc_reg_read+0x5c/0x90
 [<c018f574>] ? vfs_read+0x94/0x150
 [<c028db28>] ? copy_to_user+0x48/0x60
 [<c01c4a30>] ? proc_reg_read+0x0/0x90
 [<c018f96d>] ? sys_read+0x3d/0x70
 [<c010318d>] ? sysenter_do_call+0x12/0x31
 =======================
Code: 55 83 c0 0c 89 e5 ba 90 b9 3c c0 e8 30 d3 eb ff 5d c3 8d b4 26 00 00 00 00 8d bc 27 00 00 00 00 55 89 e5 57 56 89 c6 53 83 ec 08 <8b> 00 8b 7e 04 8b 50 28 89 55 f0 e8 95 30 01 00 85 ff 74 71 8b 
EIP: [<c03cb7fb>] klist_next+0xb/0xb0 SS:ESP 0068:f61d7ee4


Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 block/genhd.c |    2 ++
 1 file changed, 2 insertions(+)

diff -puN block/genhd.c~a block/genhd.c
--- a/block/genhd.c~a
+++ a/block/genhd.c
@@ -674,6 +674,8 @@ static void *disk_seqf_next(struct seq_f
 	struct device *dev;
 
 	(*pos)++;
+	if (seqf->private == NULL)
+		return NULL;
 	dev = class_dev_iter_next(seqf->private);
 	if (dev)
 		return dev_to_disk(dev);
_
