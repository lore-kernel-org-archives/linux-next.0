From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Wed, 1 Feb 2017 13:14:08 +1100
Message-ID: <20170201131408.2d735d11@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41389 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750914AbdBACOK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 21:14:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/intel/boards/cht_bsw_rt5645.c: In function 'cht_codec_init':
sound/soc/intel/boards/cht_bsw_rt5645.c:265:22: warning: unused variable 'codec_dai' [-Wunused-variable]
  struct snd_soc_dai *codec_dai = runtime->codec_dai;
                      ^

Introduced by commit

  7bde09dfcf60 ("ASoC: Intel: cht-bsw-rt5645: fix DAI formats")

-- 
Cheers,
Stephen Rothwell
