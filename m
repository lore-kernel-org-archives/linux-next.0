From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 22 Apr 2016 10:40:11 +0200
Message-ID: <1461314411.4047.16.camel@pengutronix.de>
References: <20160422120323.24689708@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:59839 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751039AbcDVIkS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Apr 2016 04:40:18 -0400
In-Reply-To: <20160422120323.24689708@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>

Am Freitag, den 22.04.2016, 12:03 +1000 schrieb Stephen Rothwell:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/notifier.h:13:0,
>                  from include/linux/memory_hotplug.h:6,
>                  from include/linux/mmzone.h:744,
>                  from include/linux/gfp.h:5,
>                  from include/linux/kmod.h:22,
>                  from include/linux/module.h:13,
>                  from sound/soc/codecs/hdmi-codec.c:15:
> sound/soc/codecs/hdmi-codec.c: In function 'hdmi_eld_ctl_get':
> sound/soc/codecs/hdmi-codec.c:68:17: error: 'struct hdmi_codec_priv' has no member named 'eld_lock'
>   mutex_lock(&hcp->eld_lock);
>                  ^
> include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
>  #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>                                             ^
> sound/soc/codecs/hdmi-codec.c:70:19: error: 'struct hdmi_codec_priv' has no member named 'eld_lock'
>   mutex_unlock(&hcp->eld_lock);
>                    ^
> 
> Caused by commit
> 
>   81151cfb6bfe ("ASoC: hdmi-codec: Add ELD control")
> 
> I have used the sound-asoc tree from next-20160421 for today.

Sorry, the mutex_lock slipped through when reordering the patches.
That should be part of the "Use HDMI notifications to add jack support"
patch instead.

regards
Philipp

--------8<--------
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] fixup! ASoC: hdmi-codec: Add ELD control

---
 sound/soc/codecs/hdmi-codec.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index c78333b..8e36e88 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -65,9 +65,7 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&hcp->eld_lock);
 	memcpy(ucontrol->value.bytes.data, hcp->eld, sizeof(hcp->eld));
-	mutex_unlock(&hcp->eld_lock);
 
 	return 0;
 }
-- 
2.8.0.rc3
