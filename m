From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: [patch] sound/soc/codec : fix build failure in next-201303225
Date: Mon, 25 Mar 2013 19:59:43 +0800 (CST)
Message-ID: <alpine.DEB.2.02.1303251950440.20514@M2420>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:37475 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756907Ab3CYMNS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Mar 2013 08:13:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, jencce.kernel@gmail.com

From: Xiong Zhou <jencce.kernel@gmail.com>

This patch fixes build failure of next-20130325 (and also next-20130322), 
about sound soc codec modules, based on previous implementation. 
Failing message:

  MODPOST 2490 modules
  ERROR: "arizona_rate_text" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
  ERROR: "arizona_rate_val" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
  WARNING: modpost: Found 5 section mismatch(es).

Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>
---
sound/soc/codecs/arizona.c |    8 ++------
sound/soc/codecs/arizona.h |   10 ++++++++--
2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 26e1579..166db32 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -433,14 +433,10 @@ EXPORT_SYMBOL_GPL(arizona_mixer_values);
 const DECLARE_TLV_DB_SCALE(arizona_mixer_tlv, -3200, 100, 0);
 EXPORT_SYMBOL_GPL(arizona_mixer_tlv);
 
-const char *arizona_rate_text[ARIZONA_RATE_ENUM_SIZE] = {
-	"SYNCCLK rate", "8kHz", "16kHz", "ASYNCCLK rate",
-};
+extern const char *arizona_rate_text[ARIZONA_RATE_ENUM_SIZE];
 EXPORT_SYMBOL_GPL(arizona_rate_text);
 
-const int arizona_rate_val[ARIZONA_RATE_ENUM_SIZE] = {
-	0, 1, 2, 8,
-};
+extern const int arizona_rate_val[ARIZONA_RATE_ENUM_SIZE];
 EXPORT_SYMBOL_GPL(arizona_rate_val);
 
 
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index a754a1c..3e43456 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -181,8 +181,14 @@ extern int arizona_mixer_values[ARIZONA_NUM_MIXER_INPUTS];
 	ARIZONA_MIXER_ROUTES(name, name "R")
 
 #define ARIZONA_RATE_ENUM_SIZE 4
-extern const char *arizona_rate_text[ARIZONA_RATE_ENUM_SIZE];
-extern const int arizona_rate_val[ARIZONA_RATE_ENUM_SIZE];
+
+const char *arizona_rate_text[ARIZONA_RATE_ENUM_SIZE] = {
+	"SYNCCLK rate", "8kHz", "16kHz", "ASYNCCLK rate",
+};
+
+const int arizona_rate_val[ARIZONA_RATE_ENUM_SIZE] = {
+	0, 1, 2, 8,
+};
 
 extern const struct soc_enum arizona_isrc_fsl[];
 
