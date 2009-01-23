From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the sound tree with the pxa tree
Date: Fri, 23 Jan 2009 11:31:24 +0000
Message-ID: <20090123113124.GA17303@rakim.wolfsonmicro.main>
References: <20090123140130.eba111dd.sfr@canb.auug.org.au> <49793496.2010908@mnementh.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41962 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755378AbZAWLb0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 06:31:26 -0500
Content-Disposition: inline
In-Reply-To: <49793496.2010908@mnementh.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ian Molton <ian@mnementh.co.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Eric Miao <eric.miao@marvell.com>

On Fri, Jan 23, 2009 at 03:08:06AM +0000, Ian Molton wrote:
> Stephen Rothwell wrote:

>> Just overlapping context changes.  I fixed it up (see below) and can
>> carry the fix as necessary.

> Looks good. If it needs acking, then

> Acked-by: Ian Molton <ian@mnementh.co.uk>

Stephen's fix didn't apply directly to the ASoC tree so I've applied the
slightly different fix below which merges cleanly with the PXA commit
for me:

>From c91cf25ebfbf3a5b336cbaa46646d37dd3d33127 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Fri, 23 Jan 2009 11:23:32 +0000
Subject: [PATCH] ASoC: Fix merge with PXA tree

Fix a merge issue caused by context overlap.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 sound/soc/pxa/e800_wm9712.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/e800_wm9712.c b/sound/soc/pxa/e800_wm9712.c
index 78a1770..bc019cd 100644
--- a/sound/soc/pxa/e800_wm9712.c
+++ b/sound/soc/pxa/e800_wm9712.c
@@ -18,13 +18,10 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 
-#include <mach/pxa-regs.h>
-#include <mach/hardware.h>
+#include <asm/mach-types.h>
 #include <mach/audio.h>
 #include <mach/eseries-gpio.h>
 
-#include <asm/mach-types.h>
-
 #include "../codecs/wm9712.h"
 #include "pxa2xx-pcm.h"
 #include "pxa2xx-ac97.h"
-- 
1.5.6.5
