From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 15 Feb 2018 11:35:03 +1100
Message-ID: <20180215113503.052d5a22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/home/sfr/next/next/sound/soc/soc-core.c: In function 'snd_soc_register_codec':
/home/sfr/next/next/sound/soc/soc-core.c:3818:8: error: too many arguments to function 'snd_soc_register_dais'
  ret = snd_soc_register_dais(&codec->component, dai_drv, num_dai, false);
        ^~~~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/sound/soc/soc-core.c:3114:12: note: declared here
 static int snd_soc_register_dais(struct snd_soc_component *component,
            ^~~~~~~~~~~~~~~~~~~~~   

Caused by commit

  a8768c52c511 ("ASoC: soc-core: remove legacy_dai_naming from snd_soc_register_dais()")

I have used the sound-asoc tree from next-20180214 for today.

-- 
Cheers,
Stephen Rothwell
