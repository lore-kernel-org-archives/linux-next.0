From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] sound: fix patch_realtek printk format
Date: Tue, 30 Mar 2010 10:46:21 -0700
Message-ID: <4BB238ED.9040909@oracle.com>
References: <20100330191834.f2009292.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:31540 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754160Ab0C3Rqj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2010 13:46:39 -0400
In-Reply-To: <20100330191834.f2009292.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings in patch_realtek.c:

ound/pci/hda/patch_realtek.c:5120: warning: format '%s' expects type 'char *', but argument 2 has type 'int'
sound/pci/hda/patch_realtek.c:5120: warning: too few arguments for format

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Jaroslav Kysela <perex@perex.cz>
Cc:	Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20100330.orig/sound/pci/hda/patch_realtek.c
+++ linux-next-20100330/sound/pci/hda/patch_realtek.c
@@ -5117,7 +5117,8 @@ static void fillup_priv_adc_nids(struct 
 	}
 	if (!spec->num_adc_nids) {
 		printk(KERN_WARNING "hda_codec: %s: no valid ADC found;"
-		       " using fallback 0x%x\n", fallback_adc);
+		       " using fallback 0x%x\n",
+		       codec->chip_name, fallback_adc);
 		spec->private_adc_nids[0] = fallback_adc;
 		spec->adc_nids = spec->private_adc_nids;
 		if (fallback_adc != fallback_cap) {
