From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 8 Aug 2016 10:50:14 +1000
Message-ID: <20160808105014.35899b71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40541 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751836AbcHHAuW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Aug 2016 20:50:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig build) failed like this:

sound/soc/generic/simple-card.c: In function 'asoc_simple_card_dai_link_of':
sound/soc/generic/simple-card.c:350:8: error: implicit declaration of function 'asoc_simple_card_parse_clk_cpu' [-Werror=implicit-function-declaration]
  ret = asoc_simple_card_parse_clk_cpu(cpu, dai_link, cpu_dai);
        ^
sound/soc/generic/simple-card.c:354:8: error: implicit declaration of function 'asoc_simple_card_parse_clk_codec' [-Werror=implicit-function-declaration]
  ret = asoc_simple_card_parse_clk_codec(codec, dai_link, codec_dai);
        ^
sound/soc/sh/rcar/rsrc-card.c: In function 'rsrc_card_parse_links':
sound/soc/sh/rcar/rsrc-card.c:193:9: error: implicit declaration of function 'asoc_simple_card_parse_clk_cpu' [-Werror=implicit-function-declaration]
   ret = asoc_simple_card_parse_clk_cpu(np, dai_link, dai_props);
         ^
sound/soc/sh/rcar/rsrc-card.c:232:9: error: implicit declaration of function 'asoc_simple_card_parse_clk_codec' [-Werror=implicit-function-declaration]
   ret = asoc_simple_card_parse_clk_codec(np, dai_link, dai_props);
         ^

Caused by commits

  28abd99b6e40 ("ASoC: simple-card: use asoc_simple_card_parse_clk()")
  c9a235da8a61 ("ASoC: rsrc-card: use asoc_simple_card_parse_clk()")

I have used the sound-asoc tree from next-20160805 for today.

-- 
Cheers,
Stephen Rothwell
