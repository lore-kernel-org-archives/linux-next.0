From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Mon, 29 Feb 2016 14:51:22 +1100
Message-ID: <20160229145122.71636c6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52024 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754359AbcB2Dv2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Feb 2016 22:51:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/regulator/tps65086-regulator.c:194:9: error: implicit declaration of function 'regmap_write_bits' [-Werror=implicit-function-declaration]
   ret = regmap_write_bits(config->regmap,
         ^

Caused by commit

  23b92e4cf5fd ("regmap: remove regmap_write_bits()")

from the sound-asoc & regmap trees.

I am not sure why this is suddenly exposed by the mfd tree, but grep
would have been useful when the regmap tree patch was applied.

I have reverted that regmap commit for today.

-- 
Cheers,
Stephen Rothwell
