From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 29 Jun 2017 11:54:00 +1000
Message-ID: <20170629115400.3f52c9aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751666AbdF2ByD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 21:54:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bard Liao <bardliao@realtek.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/rt5670.c: In function 'rt5670_set_codec_sysclk':
sound/soc/codecs/rt5670.c:2448:57: error: 'codec' undeclared (first use in this function)
  struct rt5670_priv *rt5670 = snd_soc_codec_get_drvdata(codec);
                                                         ^
sound/soc/codecs/rt5670.c:2448:57: note: each undeclared identifier is reported only once for each function it appears in
sound/soc/codecs/rt5670.c: At top level:
sound/soc/codecs/rt5670.c:2775:16: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .set_sysclk = rt5670_set_codec_sysclk,
                ^
sound/soc/codecs/rt5670.c:2775:16: note: (near initialization for 'soc_codec_dev_rt5670.set_sysclk')
cc1: some warnings being treated as errors

Caused by commit

  6c28ce3c425e ("ASoC: rt5670: move set_sysclk to codec level")

I have used the sound-asoc tree from next-20170628 for today.

-- 
Cheers,
Stephen Rothwell
