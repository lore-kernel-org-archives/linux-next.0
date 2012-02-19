From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH] i740fb: fix compile error when CONFIG_MTRR is not selected
Date: Sun, 19 Feb 2012 21:33:31 +0000
Message-ID: <1329687211-6545-1-git-send-email-FlorianSchandinat@gmx.de>
References: <20120216162900.e2dd164732084f48e5b239f0@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:49523 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755162Ab2BSVMo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Feb 2012 16:12:44 -0500
In-Reply-To: <20120216162900.e2dd164732084f48e5b239f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Ondrej Zary <linux@rainbow-software.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Signed-off-by: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
---
 drivers/video/i740fb.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/i740fb.c b/drivers/video/i740fb.c
index 8be0302..fe574d8 100644
--- a/drivers/video/i740fb.c
+++ b/drivers/video/i740fb.c
@@ -1179,9 +1179,9 @@ static void __devexit i740fb_remove(struct pci_dev *dev)
 	struct fb_info *info = pci_get_drvdata(dev);
 
 	if (info) {
-#ifdef CONFIG_MTRR
 		struct i740fb_par *par = info->par;
 
+#ifdef CONFIG_MTRR
 		if (par->mtrr_reg >= 0) {
 			mtrr_del(par->mtrr_reg, 0, 0);
 			par->mtrr_reg = -1;
-- 
1.7.2.5
