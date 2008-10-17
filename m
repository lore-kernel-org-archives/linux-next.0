From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bdev tree
Date: Fri, 17 Oct 2008 18:35:57 +1100
Message-ID: <20081017183557.f831ab54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45664 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751589AbYJQHlx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 03:41:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

Hi Al,

Today's linux-next merge of the bdev tree got a conflict in
drivers/ide/ide-floppy.c between commits from the ide tree and commit
a55897a7d06734d1ae32124a5e19cb903c33b8e3 ("[PATCH] eliminate use of
->f_flags in block methods") from the bdev tree.

Again you don't need to patch drivers/ide/ide-floppy.c any more, but
drivers/ide/ide-gd.c instead.  Patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/ide/ide-gd.c b/drivers/ide/ide-gd.c
index 5e5090a..c4f31de 100644
--- a/drivers/ide/ide-gd.c
+++ b/drivers/ide/ide-gd.c
@@ -198,7 +198,7 @@ static int ide_gd_open(struct inode *inode, struct file *filp)
 		 * unreadable disk, so that we can get the format capacity
 		 * of the drive or begin the format - Sam
 		 */
-		if (ret && (filp->f_flags & O_NDELAY) == 0) {
+		if (ret && (filp->f_mode & FMODE_NDELAY) == 0) {
 			ret = -EIO;
 			goto out_put_idkp;
 		}
