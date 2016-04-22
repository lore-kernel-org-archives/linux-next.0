From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 22 Apr 2016 12:03:23 +1000
Message-ID: <20160422120323.24689708@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38965 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751863AbcDVCDZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Apr 2016 22:03:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Jyri Sarha <jsarha@ti.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/notifier.h:13:0,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:744,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from sound/soc/codecs/hdmi-codec.c:15:
sound/soc/codecs/hdmi-codec.c: In function 'hdmi_eld_ctl_get':
sound/soc/codecs/hdmi-codec.c:68:17: error: 'struct hdmi_codec_priv' has no member named 'eld_lock'
  mutex_lock(&hcp->eld_lock);
                 ^
include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                            ^
sound/soc/codecs/hdmi-codec.c:70:19: error: 'struct hdmi_codec_priv' has no member named 'eld_lock'
  mutex_unlock(&hcp->eld_lock);
                   ^

Caused by commit

  81151cfb6bfe ("ASoC: hdmi-codec: Add ELD control")

I have used the sound-asoc tree from next-20160421 for today.

-- 
Cheers,
Stephen Rothwell
