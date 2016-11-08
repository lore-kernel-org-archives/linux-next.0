From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 8 Nov 2016 13:47:23 +1100
Message-ID: <20161108134723.3b4fc5d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60811 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751752AbcKHCty (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Nov 2016 21:49:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

sound/soc/sunxi/sun4i-codec.c:1188:2: error: unknown field 'has_reset' specified in initializer
  .has_reset = true,
  ^
sound/soc/sunxi/sun4i-codec.c:1188:15: warning: excess elements in struct initializer
  .has_reset = true,
               ^
sound/soc/sunxi/sun4i-codec.c:1188:15: note: (near initialization for 'sun6i_a31_codec_quirks') 

Caused by commit

  8d9e4c9e993f ("ASoC: sun4i-codec: Add support for A31 playback through headphone output")

I have used the sound-asoc tree from next-20161028 for today.

-- 
Cheers,
Stephen Rothwell
