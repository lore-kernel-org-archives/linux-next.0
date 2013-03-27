From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: [patch v2] sound/soc/codecs : fix build failure for next-20130325
Date: Wed, 27 Mar 2013 21:31:33 +0800 (CST)
Message-ID: <alpine.DEB.2.02.1303272127400.26487@M2420>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

From: Xiong Zhou <jencce.kernel@gmail.com>

This patch fixes build failure of next-20130325 (and also next-20130322), 
about sound soc codec modules. 

I try to fix this by moving arrays to the header last time.

Failing message:

  ERROR: "arizona_rate_text" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
  ERROR: "arizona_rate_val" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
  WARNING: modpost: Found 5 section mismatch(es).

These arrays, "arizona_rate_text" and "arizona_rate_val" are defined in 
arizona.c, while having a declaration in arizona.h which is included by 
wm_adsp.c.

When config MFD_ARIZONA_I2C is not choosed, neither is SND_SOC_ARIZONA.
But, if I2C is choosed at the same time, SND_SOC_WM_ADSP is selected.
So this is the problem. SND_SOC_WM_ADSP depends on SND_SOC_ARIZONA. 

After make SND_SOC_WM_ADSP depends on SND_SOC_ARIZONA:

 ERROR: "wm_adsp1_init" [sound/soc/codecs/snd-soc-wm2200.ko] undefined!
 ERROR: "wm_adsp1_event" [sound/soc/codecs/snd-soc-wm2200.ko] undefined!
 ERROR: "wm_adsp_fw_controls" [sound/soc/codecs/snd-soc-wm2200.ko] undefined!

This is the same like above. So make SND_SOC_WM2200 depends on SND_SOC_ARIZONA
too, and I2C.

Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>
---
sound/soc/codecs/Kconfig |    2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 18fea10..f38af70 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -79,7 +79,6 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_WM0010 if SPI_MASTER
 	select SND_SOC_WM1250_EV1 if I2C
 	select SND_SOC_WM2000 if I2C
-	select SND_SOC_WM2200 if I2C
 	select SND_SOC_WM5100 if I2C
 	select SND_SOC_WM5102 if MFD_WM5102
 	select SND_SOC_WM5110 if MFD_WM5110
@@ -370,6 +369,7 @@ config SND_SOC_WM2000
 	tristate
 
 config SND_SOC_WM2200
+	depends on SND_SOC_ARIZONA && I2C
 	tristate
 
 config SND_SOC_WM5100
