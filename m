From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bdev tree
Date: Fri, 17 Oct 2008 18:29:33 +1100
Message-ID: <20081017182933.172f6f84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45657 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751501AbYJQHls (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 03:41:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

Hi Al,

Today's linux-next merge of the bdev tree got a conflict in
drivers/ide/ide-floppy.c between commit idefloppy_open ("ide-floppy:
factor out generic disk handling code to ide-gd-floppy.c") from the ide
tree and commit 30819ee65ed2e69fab5d5986ae0177795615a7fc ("[PATCH]
introduce fmode_t, do annotations") from the bdev tree.

The former moved the code that the latter modified.  You no longer need
to patch drivers/ide/ide-floppy.c - I think you need to patch
drivers/ide/ide-gd.c instead.  I added the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/ide/ide-gd.c b/drivers/ide/ide-gd.c
index d44898f..5e5090a 100644
--- a/drivers/ide/ide-gd.c
+++ b/drivers/ide/ide-gd.c
@@ -7,6 +7,7 @@
 #include <linux/mutex.h>
 #include <linux/ide.h>
 #include <linux/hdreg.h>
+#include <linux/fs.h>
 
 #if !defined(CONFIG_DEBUG_BLOCK_EXT_DEVT)
 #define IDE_DISK_MINORS		(1 << PARTN_BITS)
@@ -202,7 +203,7 @@ static int ide_gd_open(struct inode *inode, struct file *filp)
 			goto out_put_idkp;
 		}
 
-		if ((drive->dev_flags & IDE_DFLAG_WP) && (filp->f_mode & 2)) {
+		if ((drive->dev_flags & IDE_DFLAG_WP) && (filp->f_mode & FMODE_WRITE)) {
 			ret = -EROFS;
 			goto out_put_idkp;
 		}
