From: MR Swami Reddy <MR.Swami.Redy@ti.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 05 Apr 2012 20:02:42 +0530
Message-ID: <4F7DAD0A.5040401@ti.com>
References: <20120405110339.4f83ac849d3bce2893c2ccf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:57726 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751749Ab2DEOba (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Apr 2012 10:31:30 -0400
Received: from nscmmp3.nsc.com ([10.188.143.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q35EVT37004031
	for <linux-next@vger.kernel.org>; Thu, 5 Apr 2012 09:31:29 -0500
In-Reply-To: <20120405110339.4f83ac849d3bce2893c2ccf8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, "Girdwood, Liam" <lrg@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Reddy, MR Swami" <MR.Swami.Reddy@nsc.com>

Hi,
I tried to reproduce the below mentioned warning messages using:
 - Latest for-next git repo sources  on x86_64 build machine
 - gcc version 4.3.2
 - -Woverflow option used in KBUILD_CFLAGS

But couldn't see the warning messages.

Below is the quick patch to remove the warning messages (and this patch
will be submitted to alsa-devel mailing list soon).

Signed-off-by: M R Swami Reddy <mr.swami.reddy@ti.com>
---
 sound/soc/codecs/lm49453.c  |   13 +-
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 744063d..74409ec 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1178,27 +1178,24 @@ static int lm49453_set_dai_fmt(struct
snd_soc_dai *codec_dai, unsigned int fmt)
 {
        struct snd_soc_codec *codec = codec_dai->codec;

-       int aif_val = 0;
+       u16 aif_val;
        int mode = 0;
        int clk_phase = 0;
        int clk_shift = 0;

        switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
        case SND_SOC_DAIFMT_CBS_CFS:
-               aif_val = ~LM49453_AUDIO_PORT1_BASIC_CLK_MS |
-                       ~LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
+               aif_val = 0;
                break;
        case SND_SOC_DAIFMT_CBS_CFM:
-               aif_val = ~LM49453_AUDIO_PORT1_BASIC_CLK_MS |
-                       LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
+               aif_val = LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
                break;
        case SND_SOC_DAIFMT_CBM_CFS:
-               aif_val = LM49453_AUDIO_PORT1_BASIC_CLK_MS |
-                       ~LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
+               aif_val = LM49453_AUDIO_PORT1_BASIC_CLK_MS;
                break;
        case SND_SOC_DAIFMT_CBM_CFM:
                aif_val = LM49453_AUDIO_PORT1_BASIC_CLK_MS |
-                       LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
+                         LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
                break;
        default:
                return -EINVAL;




On Thursday 05 April 2012 06:33 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> sound/soc/codecs/lm49453.c: In function 'lm49453_set_dai_fmt':
> sound/soc/codecs/lm49453.c:1189:4: warning: overflow in implicit constant conversion [-Woverflow]
> sound/soc/codecs/lm49453.c:1193:4: warning: overflow in implicit constant conversion [-Woverflow]
> sound/soc/codecs/lm49453.c:1197:4: warning: overflow in implicit constant conversion [-Woverflow]
>
> Introduced by commit dbf7a733f5fb (ASoC: Support TI LM49453 Audio driver"").
