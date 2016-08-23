From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 23 Aug 2016 12:27:14 +1000
Message-ID: <20160823122714.476a246f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37869 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754407AbcHWC1R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Aug 2016 22:27:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Hsu <KCHSU0@nuvoton.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/sound/soc.h:415:0,
                 from sound/soc/codecs/nau8810.c:27:
sound/soc/codecs/nau8810.c:441:3: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
   &nau8810_loopback),
   ^
include/sound/soc-dapm.h:111:19: note: in definition of macro 'SND_SOC_DAPM_SWITCH'
  .kcontrol_news = wcontrols, .num_kcontrols = 1}
                   ^
sound/soc/codecs/nau8810.c:441:3: note: (near initialization for 'nau8810_dapm_widgets[11].kcontrol_news')
   &nau8810_loopback),
   ^
include/sound/soc-dapm.h:111:19: note: in definition of macro 'SND_SOC_DAPM_SWITCH'
  .kcontrol_news = wcontrols, .num_kcontrols = 1}
                   ^

Caused by commit

  b6970b48e384 ("ASoC: nau8810: Add driver for Nuvoton codec chip NAU88C10")

I have used the sound-asoc tree from next-20160822 for today.

-- 
Cheers,
Stephen Rothwell
