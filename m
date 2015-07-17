From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the regmap tree with the sound-asoc
 tree
Date: Fri, 17 Jul 2015 13:06:41 +1000
Message-ID: <20150717130641.2a1754cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33829 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751335AbbGQDGo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 23:06:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nariman Poushin <nariman@opensource.wolfsonmicro.com>

Hi Mark,

Today's linux-next merge of the regmap tree got conflicts in:

  sound/soc/codecs/da7210.c
  sound/soc/codecs/rt5651.c
  sound/soc/codecs/wm8993.c

between commit:

  c418a84a8c8f ("ASoC: Constify reg_default tables")

from the sound-asoc tree and commit:

  8019ff6cfc04 ("regmap: Use reg_sequence for multi_reg_write / register_patch")

from the regmap tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc sound/soc/codecs/da7210.c
index 457ed82d3e10,bf0fb3d4df22..000000000000
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@@ -1182,7 -1182,7 +1182,7 @@@ static struct snd_soc_codec_driver soc_
  
  #if IS_ENABLED(CONFIG_I2C)
  
- static const struct reg_default da7210_regmap_i2c_patch[] = {
 -static struct reg_sequence da7210_regmap_i2c_patch[] = {
++static const struct reg_sequence da7210_regmap_i2c_patch[] = {
  
  	/* System controller master disable */
  	{ DA7210_STARTUP1, 0x00 },
@@@ -1268,7 -1269,7 +1268,7 @@@ static struct i2c_driver da7210_i2c_dri
  
  #if defined(CONFIG_SPI_MASTER)
  
- static const struct reg_default da7210_regmap_spi_patch[] = {
 -static struct reg_sequence da7210_regmap_spi_patch[] = {
++static const struct reg_sequence da7210_regmap_spi_patch[] = {
  	/* Dummy read to give two pulses over nCS for SPI */
  	{ DA7210_AUX2, 0x00 },
  	{ DA7210_AUX2, 0x00 },
diff --cc sound/soc/codecs/rt5651.c
index 2c9eb8983042,db9b8667f136..000000000000
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@@ -46,7 -46,7 +46,7 @@@ static const struct regmap_range_cfg rt
  	  .window_len = 0x1, },
  };
  
- static const struct reg_default init_list[] = {
 -static struct reg_sequence init_list[] = {
++static const struct reg_sequence init_list[] = {
  	{RT5651_PR_BASE + 0x3d,	0x3e00},
  };
  
diff --cc sound/soc/codecs/wm8993.c
index 9638accb74b9,52ec64d8502d..000000000000
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@@ -1595,7 -1595,7 +1595,7 @@@ static int wm8993_resume(struct snd_soc
  #endif
  
  /* Tune DC servo configuration */
- static const struct reg_default wm8993_regmap_patch[] = {
 -static struct reg_sequence wm8993_regmap_patch[] = {
++static const struct reg_sequence wm8993_regmap_patch[] = {
  	{ 0x44, 3 },
  	{ 0x56, 3 },
  	{ 0x44, 0 },
