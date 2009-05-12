From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] viocd: needs to depend on BLOCK
Date: Tue, 12 May 2009 14:20:55 +0400
Message-ID: <1242123655-4104-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.178]:24203 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754433AbZELKsS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2009 06:48:18 -0400
Received: by wa-out-1112.google.com with SMTP id j5so1878401wah.21
        for <linux-next@vger.kernel.org>; Tue, 12 May 2009 03:48:19 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: jens.axboe@oracle.com, linux-next@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error when CONFIG_BLOCK is not set:
drivers/cdrom/viocd.c: In function 'viocd_blk_open':
drivers/cdrom/viocd.c:156: error: dereferencing pointer to incomplete type
drivers/cdrom/viocd.c: In function 'viocd_blk_release':
drivers/cdrom/viocd.c:162: error: dereferencing pointer to incomplete type
drivers/cdrom/viocd.c: In function 'viocd_blk_ioctl':
drivers/cdrom/viocd.c:170: error: dereferencing pointer to incomplete type
drivers/cdrom/viocd.c: In function 'viocd_blk_media_changed':
drivers/cdrom/viocd.c:176: error: dereferencing pointer to incomplete type
...

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 arch/powerpc/platforms/iseries/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/platforms/iseries/Kconfig b/arch/powerpc/platforms/iseries/Kconfig
index 647e877..47a20cf 100644
--- a/arch/powerpc/platforms/iseries/Kconfig
+++ b/arch/powerpc/platforms/iseries/Kconfig
@@ -17,6 +17,7 @@ config VIODASD
 
 config VIOCD
 	tristate "iSeries Virtual I/O CD support"
+	depends on BLOCK
 	select VIOPATH
 	help
 	  If you are running Linux on an IBM iSeries system and you want to
-- 
1.6.3
