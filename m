From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the pxa tree
Date: Tue, 10 Feb 2009 14:22:30 +1100
Message-ID: <20090210142230.07fdfe43.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52427 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751933AbZBJDWf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2009 22:22:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Philipp Zabel <philipp.zabel@gmail.com>, Eric Miao <eric.miao@marvell.com>

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
sound/soc/pxa/pxa2xx-i2s.c between commit
69e2a881351e31e936e3a75f8efff768f0edb2be ("[ARM] pxa: move DMA registers
definitions into <mach/dma.h>") from the pxa tree and commit
44dd2b9168350b82a671ce71666b99208ab2d973 ("ASoC: pxa2xx-i2s: remove I2S
pin setup") from the sound tree.

Just simple context change. I fiex it up (see below) and can carry the
fix as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc sound/soc/pxa/pxa2xx-i2s.c
index 223de89,83b59d7..0000000
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@@ -24,8 -24,7 +24,7 @@@
  #include <sound/pxa2xx-lib.h>
  
  #include <mach/hardware.h>
 -#include <mach/pxa-regs.h>
 +#include <mach/dma.h>
- #include <mach/pxa2xx-gpio.h>
  #include <mach/audio.h>
  
  #include "pxa2xx-pcm.h"
