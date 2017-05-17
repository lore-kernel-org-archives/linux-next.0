From: Jeff Layton <jlayton@poochiereds.net>
Subject: Re: linux-next: build failure after merge of the file-locks tree
Date: Tue, 16 May 2017 21:10:03 -0400
Message-ID: <1494983403.21644.8.camel@poochiereds.net>
References: <20170517102752.3bd4da91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170517102752.3bd4da91@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, 2017-05-17 at 10:27 +1000, Stephen Rothwell wrote:
> Hi Jeff,
> 
> After merging the file-locks tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> fs/fcntl.c: In function 'SYSC_fcntl64':
> fs/fcntl.c:414:30: error: 'argp' undeclared (first use in this function)
>    if (copy_from_user(&flock, argp, sizeof(flock)))
>                               ^
> fs/fcntl.c:414:30: note: each undeclared identifier is reported only once for each function it appears in
> fs/fcntl.c:416:23: error: 'filp' undeclared (first use in this function)
>    err = fcntl_getlk64(filp, cmd, &flock);
>                        ^
> 
> Caused by commit
> 
>   0416b792294c ("fs/locks: pass kernel struct flock to fcntl_getlk/setlk")
> 
> This build has BITS_PER_LONG == 32.
> 
> I have used the file-locks tree from next-20170516 for today.
> 

I think this patch will probably fix it, but I don't have a 32-bit host
set up to build on just now. I'll go ahead and merge this into the
branch, and will plan to test it tomorrow (hopefully before the next
fetch).

------------------8<------------------

[PATCH] SQUASH: define argp properly in 32-bit fcntl64 syscall handler

...and use the right file pointer.

Signed-off-by: Jeff Layton <jlayton@redhat.com>
---
 fs/fcntl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 9a9b25f12bd4..bbf80344c125 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -391,6 +391,7 @@ SYSCALL_DEFINE3(fcntl, unsigned int, fd, unsigned int, cmd, unsigned long, arg)
 SYSCALL_DEFINE3(fcntl64, unsigned int, fd, unsigned int, cmd,
 		unsigned long, arg)
 {	
+	void __user *argp = (void __user *)arg;
 	struct fd f = fdget_raw(fd);
 	struct flock64 flock;
 	long err = -EBADF;
@@ -413,7 +414,7 @@ SYSCALL_DEFINE3(fcntl64, unsigned int, fd, unsigned int, cmd,
 		err = -EFAULT;
 		if (copy_from_user(&flock, argp, sizeof(flock)))
 			break;
-		err = fcntl_getlk64(filp, cmd, &flock);
+		err = fcntl_getlk64(f.file, cmd, &flock);
 		if (!err && copy_to_user(argp, &flock, sizeof(flock)))
 			err = -EFAULT;
 		break;
-- 
2.9.4
