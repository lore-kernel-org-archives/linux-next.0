From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] sound: fix trivial build error in mpc5200_dma.c
Date: Sat, 25 Feb 2012 16:12:30 -0500
Message-ID: <1330204350-386-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:47280 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752830Ab2BYVNF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Feb 2012 16:13:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: perex@perex.cz, tiwai@suse.de
Cc: timur@freescale.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Add the obvious header to fix this:

sound/soc/fsl/mpc5200_dma.c:301: error: implicit declaration of function 'DMA_BIT_MASK'
sound/soc/fsl/mpc5200_dma.c:301: error: initializer element is not constant

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

---

[seen in linux-next-20120224 tree]

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 33adbf1..9a3f7c5 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <linux/of_platform.h>
 
-- 
1.7.9.1
