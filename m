From: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] ASoC: wm5110: Use reg_sequence for
	multi_reg_write/register_patch
Date: Fri, 17 Jul 2015 15:11:10 +0100
Message-ID: <20150717141110.GH21939@opensource.wolfsonmicro.com>
References: <20150717143934.4f0ce5d7@canb.auug.org.au> <20150717094436.GC21939@opensource.wolfsonmicro.com> <20150717103450.GJ11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42940 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753187AbbGQOLM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 10:11:12 -0400
Content-Disposition: inline
In-Reply-To: <20150717103450.GJ11162@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Introduced by:
commit 8019ff6cfc04
("regmap: Use reg_sequence for multi_reg_write / register_patch")

Interacting with:
commit d1acd31883d7
("ASoC: wm5110: Add special DRE on/off handling for the headphone path")

Signed-off-by: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
---
 sound/soc/codecs/wm5110.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index df6a998..9756578 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -185,7 +185,7 @@ static int wm5110_sysclk_ev(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static const struct reg_default wm5110_no_dre_left_enable[] = {
+static const struct reg_sequence wm5110_no_dre_left_enable[] = {
 	{ 0x3024, 0xE410 },
 	{ 0x3025, 0x0056 },
 	{ 0x301B, 0x0224 },
@@ -203,7 +203,7 @@ static const struct reg_default wm5110_no_dre_left_enable[] = {
 	{ 0x3039, 0x3080 },
 };
 
-static const struct reg_default wm5110_dre_left_enable[] = {
+static const struct reg_sequence wm5110_dre_left_enable[] = {
 	{ 0x3024, 0x0231 },
 	{ 0x3025, 0x0B00 },
 	{ 0x301B, 0x0227 },
@@ -221,7 +221,7 @@ static const struct reg_default wm5110_dre_left_enable[] = {
 	{ 0x3039, 0x0B00 },
 };
 
-static const struct reg_default wm5110_no_dre_right_enable[] = {
+static const struct reg_sequence wm5110_no_dre_right_enable[] = {
 	{ 0x3074, 0xE414 },
 	{ 0x3075, 0x0056 },
 	{ 0x306B, 0x0224 },
@@ -239,7 +239,7 @@ static const struct reg_default wm5110_no_dre_right_enable[] = {
 	{ 0x3089, 0x3080 },
 };
 
-static const struct reg_default wm5110_dre_right_enable[] = {
+static const struct reg_sequence wm5110_dre_right_enable[] = {
 	{ 0x3074, 0x0231 },
 	{ 0x3075, 0x0B00 },
 	{ 0x306B, 0x0227 },
@@ -263,7 +263,7 @@ static int wm5110_hp_pre_enable(struct snd_soc_dapm_widget *w)
 	struct arizona_priv *priv = snd_soc_codec_get_drvdata(codec);
 	struct arizona *arizona = priv->arizona;
 	unsigned int val = snd_soc_read(codec, ARIZONA_DRE_ENABLE);
-	const struct reg_default *wseq;
+	const struct reg_sequence *wseq;
 	int nregs;
 
 	switch (w->shift) {
@@ -354,7 +354,7 @@ static int wm5110_hp_ev(struct snd_soc_dapm_widget *w,
 
 static int wm5110_clear_pga_volume(struct arizona *arizona, int output)
 {
-	struct reg_default clear_pga = {
+	struct reg_sequence clear_pga = {
 		ARIZONA_OUTPUT_PATH_CONFIG_1L + output * 4, 0x80
 	};
 	int ret;
-- 
2.1.4
