From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 8 Jun 2017 13:37:48 +1000
Message-ID: <20170608133748.0a283924@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/soc-topology.c: In function 'soc_tplg_widget_ready':
sound/soc/soc-topology.c:352:42: error: 'struct snd_soc_tplg_ops' has no member named 'widget_ready'
  if (tplg->comp && tplg->ops && tplg->ops->widget_ready)
                                          ^
sound/soc/soc-topology.c:353:19: error: 'struct snd_soc_tplg_ops' has no member named 'widget_ready'
   return tplg->ops->widget_ready(tplg->comp, w, tplg_w);
                   ^
sound/soc/soc-topology.c: In function 'soc_tplg_dai_load':
sound/soc/soc-topology.c:364:10: error: too many arguments to function 'tplg->ops->dai_load'
   return tplg->ops->dai_load(tplg->comp, dai_drv, pcm, dai);
          ^
sound/soc/soc-topology.c: In function 'soc_tplg_dai_create':
sound/soc/soc-topology.c:1722:8: error: too few arguments to function 'soc_tplg_dai_load'
  ret = soc_tplg_dai_load(tplg, dai_drv);
        ^
sound/soc/soc-topology.c:359:12: note: declared here
 static int soc_tplg_dai_load(struct soc_tplg *tplg,
            ^
sound/soc/soc-topology.c: In function 'soc_tplg_dai_config':
sound/soc/soc-topology.c:2205:8: error: too few arguments to function 'soc_tplg_dai_load'
  ret = soc_tplg_dai_load(tplg, dai_drv);
        ^
sound/soc/soc-topology.c:359:12: note: declared here
 static int soc_tplg_dai_load(struct soc_tplg *tplg,
            ^

Caused by commit

  c8597af855f3 ("ASoC: topology: Allow bespoke configuration post widget creation")

Forgotten commit of an include file update?

I have used the sound-asoc tree from next-20170607 for today.

-- 
Cheers,
Stephen Rothwell
