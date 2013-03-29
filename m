From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH -next] sound/soc/codecs: Mark snd-soc-wm2200 and snd-soc-wm-adsp as BROKEN
Date: Fri, 29 Mar 2013 10:12:27 -0400
Message-ID: <1364566347-29941-1-git-send-email-peter@hurleysoftware.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout02.c08.mtsvc.net ([205.186.168.190]:60989 "EHLO
	mailout02.c08.mtsvc.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754390Ab3C2Occ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Mar 2013 10:32:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>, Xiong Zhou <jencce.kernel@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

The linux-next tree has failed to build for last 7 days with these
errors:
  MODPOST 2490 modules
  ERROR: "arizona_rate_text" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
  ERROR: "arizona_rate_val" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
  WARNING: modpost: Found 5 section mismatch(es).

Patches submitted by Xiong Zhou <jencce.kernel@gmail.com> to fix this
have been rejected.

Until the author(s) resolve the situation, mark the offenders as BROKEN.

Cc: Xiong Zhou <jencce.kernel@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 sound/soc/codecs/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 18fea10..470b66b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -79,7 +79,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_WM0010 if SPI_MASTER
 	select SND_SOC_WM1250_EV1 if I2C
 	select SND_SOC_WM2000 if I2C
-	select SND_SOC_WM2200 if I2C
+	select SND_SOC_WM2200 if I2C && BROKEN
 	select SND_SOC_WM5100 if I2C
 	select SND_SOC_WM5102 if MFD_WM5102
 	select SND_SOC_WM5110 if MFD_WM5110
@@ -153,6 +153,7 @@ config SND_SOC_WM_HUBS
 
 config SND_SOC_WM_ADSP
 	tristate
+	depends on BROKEN
 	default y if SND_SOC_WM5102=y
 	default y if SND_SOC_WM2200=y
 	default m if SND_SOC_WM5102=m
-- 
1.8.1.2
