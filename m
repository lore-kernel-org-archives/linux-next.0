From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the regmap tree
Date: Fri, 17 Jul 2015 14:39:34 +1000
Message-ID: <20150717143934.4f0ce5d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53018 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750738AbbGQEjf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 00:39:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Nariman Poushin <nariman@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Hi Mark,

After merging the regmap tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

sound/soc/codecs/wm5110.c: In function 'wm5110_hp_pre_enable':
sound/soc/codecs/wm5110.c:294:9: warning: passing argument 2 of 'regmap_multi_reg_write' from incompatible pointer type
  return regmap_multi_reg_write(arizona->regmap, wseq, nregs);
         ^
In file included from sound/soc/codecs/wm5110.c:19:0:
include/linux/regmap.h:427:5: note: expected 'const struct reg_sequence *' but argument is of type 'const struct reg_default *'
 int regmap_multi_reg_write(struct regmap *map, const struct reg_sequence *regs,
     ^
sound/soc/codecs/wm5110.c: In function 'wm5110_clear_pga_volume':
sound/soc/codecs/wm5110.c:362:8: warning: passing argument 2 of 'regmap_multi_reg_write_bypassed' from incompatible pointer type
  ret = regmap_multi_reg_write_bypassed(arizona->regmap, &clear_pga, 1);
        ^
In file included from sound/soc/codecs/wm5110.c:19:0:
include/linux/regmap.h:429:5: note: expected 'const struct reg_sequence *' but argument is of type 'struct reg_default *'
 int regmap_multi_reg_write_bypassed(struct regmap *map,
     ^
drivers/mfd/wm5110-tables.c: In function 'wm5110_patch':
drivers/mfd/wm5110-tables.c:279:10: warning: passing argument 2 of 'regmap_register_patch' from incompatible pointer type
   return regmap_register_patch(arizona->regmap,
          ^
In file included from include/linux/mfd/arizona/core.h:17:0,
                 from drivers/mfd/wm5110-tables.c:15:
include/linux/regmap.h:469:5: note: expected 'const struct reg_sequence *' but argument is of type 'const struct reg_default *'
 int regmap_register_patch(struct regmap *map, const struct reg_sequence *regs,
     ^
drivers/mfd/wm8998-tables.c: In function 'wm8998_patch':
drivers/mfd/wm8998-tables.c:48:9: warning: passing argument 2 of 'regmap_register_patch' from incompatible pointer type
  return regmap_register_patch(arizona->regmap,
         ^
In file included from include/linux/mfd/arizona/core.h:17:0,
                 from drivers/mfd/wm8998-tables.c:15:
include/linux/regmap.h:469:5: note: expected 'const struct reg_sequence *' but argument is of type 'const struct reg_default *'
 int regmap_register_patch(struct regmap *map, const struct reg_sequence *regs,
     ^

Introduced by commit

  8019ff6cfc04 ("regmap: Use reg_sequence for multi_reg_write / register_patch")

interacting with commit

  561629755a21 ("mfd: arizona: Add support for WM8998 and WM1814")

from the mfd tree and commits

  d1acd31883d7 ("ASoC: wm5110: Add special DRE on/off handling for the headphone path")
  81207880cef2 ("mfd: wm5110: Add register patch for rev E and above")

from the sound-asoc tree.

I may make up a merge fix for these on Monday ... I love API changes :-(
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
