From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] cx231xx: fix SND dependency build error
Date: Tue, 07 Apr 2009 08:59:29 -0700
Message-ID: <49DB7861.5050606@oracle.com>
References: <20090407140717.a7f0b07c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:34897 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757701AbZDGP7i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2009 11:59:38 -0400
In-Reply-To: <20090407140717.a7f0b07c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Don't select VIDEO_CX231XX_ALSA when SND is not enabled since selecting it
won't cause SND to be enabled.

ERROR: "snd_pcm_period_elapsed" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_card_create" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_pcm_hw_constraint_integer" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_pcm_set_ops" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_pcm_lib_ioctl" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_card_free" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_card_register" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR: "snd_pcm_new" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/media/video/cx231xx/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090407.orig/drivers/media/video/cx231xx/Kconfig
+++ linux-next-20090407/drivers/media/video/cx231xx/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_CX231XX
        select VIDEO_IR
        select VIDEOBUF_VMALLOC
        select VIDEO_CX25840
-       select VIDEO_CX231XX_ALSA
+       select VIDEO_CX231XX_ALSA if SND
 
 	---help---
 	  This is a video4linux driver for Conexant 231xx USB based TV cards.
