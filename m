From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Tue, 26 Aug 2008 14:06:58 +1000
Message-ID: <20080826140658.316d9727.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51057 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750719AbYHZEHE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 00:07:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

Hi Bart,

Today's linux-next build (x86_64_allmodconfig) failed like this:

ERROR: "ide_floppy_ioctl" [drivers/ide/ide-floppy_mod.ko] undefined!

Introduced by commit 487a606ecd39be80655bddc7f8d14bfdf48bf682
("ide-floppy: move all ioctl handling to ide-floppy_ioctl.c").

I added the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 26 Aug 2008 14:04:59 +1000
Subject: [PATCH] ide: fix for idefloppy_ioctl name change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ide/ide-floppy_ioctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ide/ide-floppy_ioctl.c b/drivers/ide/ide-floppy_ioctl.c
index 1fc4050..a3a7a08 100644
--- a/drivers/ide/ide-floppy_ioctl.c
+++ b/drivers/ide/ide-floppy_ioctl.c
@@ -260,7 +260,7 @@ static int ide_floppy_format_ioctl(ide_drive_t *drive, struct file *file,
 	}
 }
 
-int idefloppy_ioctl(struct inode *inode, struct file *file,
+int ide_floppy_ioctl(struct inode *inode, struct file *file,
 		    unsigned int cmd, unsigned long arg)
 {
 	struct block_device *bdev = inode->i_bdev;
-- 
1.5.6.5
