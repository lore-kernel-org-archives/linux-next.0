From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 2/2] Staging: cpc-usb: fix printk format warnings
Date: Thu, 21 May 2009 15:44:46 +0400
Message-ID: <1242906286-7066-2-git-send-email-a.beregalov@gmail.com>
References: <1242906286-7066-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f222.google.com ([209.85.218.222]:37485 "EHLO
	mail-bw0-f222.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752636AbZEULpz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2009 07:45:55 -0400
In-Reply-To: <1242906286-7066-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

Fix this warnings:
cpc-usb_drv.c:478: warning: format '%d' expects type 'int',
	but argument 4 has type 'size_t'
cpc-usb_drv.c:1034: warning: format '%d' expects type 'int',
	but argument 3 has type 'long unsigned int'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/staging/cpc-usb/cpc-usb_drv.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/cpc-usb/cpc-usb_drv.c b/drivers/staging/cpc-usb/cpc-usb_drv.c
index d337a97..8e312c7 100644
--- a/drivers/staging/cpc-usb/cpc-usb_drv.c
+++ b/drivers/staging/cpc-usb/cpc-usb_drv.c
@@ -475,7 +475,7 @@ static ssize_t cpcusb_write(struct file *file, const char *buffer,
 	unsigned char type = 0;
 	CPC_MSG_T *info = NULL;
 
-	dbg("%s - entered minor %d, count = %d, present = %d",
+	dbg("%s - entered minor %d, count = %zu, present = %d",
 	    __func__, card->minor, count, card->present);
 
 	if (count > sizeof(CPC_MSG_T))
@@ -1031,7 +1031,7 @@ static int cpcusb_probe(struct usb_interface *interface,
 		retval = -ENOMEM;
 		goto error;
 	}
-	info("Allocated memory for %d messages (%d kbytes)",
+	info("Allocated memory for %d messages (%lu kbytes)",
 	     CPC_MSG_BUF_CNT, (sizeof(CPC_MSG_T) * CPC_MSG_BUF_CNT) / 1000);
 	memset(chan->buf, 0, sizeof(CPC_MSG_T) * CPC_MSG_BUF_CNT);
 
-- 
1.6.3.1
