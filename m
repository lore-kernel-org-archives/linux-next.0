From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc tree with the
 sound-current tree
Date: Fri, 25 Aug 2017 12:57:05 +1000
Message-ID: <20170825125705.44de0444@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754220AbdHYC5H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Aug 2017 22:57:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Rini <trini@konsulko.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/codecs/rt5677.c

between commit:

  9ce76511b67b ("ASoC: rt5677: Reintroduce I2C device IDs")

from the sound-current tree and commit:

  ddc9e69b9dc2 ("ASoC: rt5677: Hide platform data in the module sources")

from the sound-asoc tree.

I considered just using the latter version, but in the end did not.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc sound/soc/codecs/rt5677.c
index 6f629278d982,c735590c5a25..000000000000
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@@ -5019,9 -5010,6 +5010,7 @@@ static const struct regmap_config rt567
  };
  
  static const struct i2c_device_id rt5677_i2c_id[] = {
- 	{ "rt5677", RT5677 },
- 	{ "rt5676", RT5676 },
 +	{ "RT5677CE:00", RT5677 },
  	{ }
  };
  MODULE_DEVICE_TABLE(i2c, rt5677_i2c_id);
