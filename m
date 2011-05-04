From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] sound: fix lola build
Date: Wed, 4 May 2011 09:53:10 -0700
Message-ID: <20110504095310.465fae53.randy.dunlap@oracle.com>
References: <20110504144759.802483cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:50685 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786Ab1EDQx2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2011 12:53:28 -0400
In-Reply-To: <20110504144759.802483cc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

sound/pci/lola/Makefile was trying to build lola modules even
when PCI and SND_LOLA were not enabled, causing build errors:

ERROR: "snd_pcm_hw_constraint_step" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_period_elapsed" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_dma_alloc_pages" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_hw_constraint_integer" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_sgbuf_ops_page" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_set_ops" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_lib_free_pages" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_lib_ioctl" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_lib_malloc_pages" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_sgbuf_get_chunk_size" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_dma_free_pages" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_lib_preallocate_pages_for_all" [sound/pci/lola/snd-lola.ko] undefined!
ERROR: "snd_pcm_new" [sound/pci/lola/snd-lola.ko] undefined!

Fix the Makefile to build only when CONFIG_SND_LOLA is enabled.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/pci/lola/Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20110504.orig/sound/pci/lola/Makefile
+++ linux-next-20110504/sound/pci/lola/Makefile
@@ -1,3 +1,4 @@
 snd-lola-y := lola.o lola_pcm.o lola_clock.o lola_mixer.o
 snd-lola-$(CONFIG_SND_DEBUG) += lola_proc.o
-obj-m = snd-lola.o
+
+obj-$(CONFIG_SND_LOLA) += snd-lola.o
