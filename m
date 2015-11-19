From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 19 Nov 2015 11:35:28 +1100
Message-ID: <20151119113528.7262d470@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53288 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757338AbbKSAfd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Nov 2015 19:35:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mengdong Lin <mengdong.lin@linux.intel.com>, Harsha Priya <harshapriya.n@intel.com>, Conrad Cooke <conrad.cooke@intel.com>, Naveen M <naveen.m@intel.com>, Sathya Prakash M R <sathya.prakash.m.r@intel.com>, Yong Zhi <yong.zhi@intel.com>, "Fang, Yang A" <yang.a.fang@intel.com>, Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>, Vinod Koul <vinod.koul@intel.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_late_probe':
sound/soc/fsl/fsl-asoc-card.c:420:38: error: 'struct snd_soc_card' has no member named 'rtd'
  struct snd_soc_dai *codec_dai = card->rtd[0].codec_dai;
                                      ^
sound/soc/fsl/fsl-asoc-card.c:427:37: error: 'struct snd_soc_card' has no member named 'rtd'
   struct snd_soc_codec *codec = card->rtd[0].codec;
                                     ^

Caused by commit

  5015920a1732 ("ASoC: Vendor drivers get a link's runtime by snd_soc_get_pcm_runtime()")

sound/soc/intel/boards/skl_nau88l25_ssm4567.c: In function 'skl_get_codec_dai':
sound/soc/intel/boards/skl_nau88l25_ssm4567.c:43:13: error: 'struct snd_soc_card' has no member named 'rtd'
   rtd = card->rtd + i;
             ^

Caused by commit

  a86d505783e4 ("ASoC: Intel: Skylake: Adding nau88l25+ssm4567 machine driver")

I have used the sound-asoc tree from next-20151118 for today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
