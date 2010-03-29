From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 17:55:51 +1100
Message-ID: <20100329175551.873d9fab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44251 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753936Ab0C2Gzx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 02:55:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Misael Lopez Cruz <x0052729@ti.com>, Jorge Eduardo Candelaria <jorge.candelaria@ti.com>, Margarita Olaya Cabrera <magi.olaya@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.de>

Hi Tejun,

After merging the slabh tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/soc/codecs/twl6040.c: In function 'twl6040_remove':
sound/soc/codecs/twl6040.c:1052: error: implicit declaration of function 'kfree'
sound/soc/codecs/twl6040.c: In function 'twl6040_codec_probe':
sound/soc/codecs/twl6040.c:1073: error: implicit declaration of function 'kzalloc'
sound/soc/codecs/twl6040.c:1073: warning: assignment makes pointer from integer without a cast

Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
implicitly include slab.h from percpu.h") from the slabh tree interacting
with commit 8ecbabd977dc64d2d8c9980420a3d72db06fe551 ("ASoC: TWL6040: Add
twl6040 codec driver") from the sound tree.

I applied the following merge fixup patch which should be applied to the
sound tree (see Documentation/SubmitChecklist Rule #1 :-)).  Hi Takashi,
another one. :-(

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2010 17:52:52 +1100
Subject: [PATCH] Asoc: TWL6040: use of kzalloc/kfree requires the include of slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/codecs/twl6040.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 0e4dce7..108c51a 100755
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -27,6 +27,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/i2c/twl.h>
 
 #include <sound/core.h>
-- 
1.7.0.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
