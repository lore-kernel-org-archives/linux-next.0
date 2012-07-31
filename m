From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: Tree for July 31 (media/radio-tea5777)
Date: Tue, 31 Jul 2012 16:56:21 -0300
Message-ID: <50183865.9090700@redhat.com>
References: <20120731152614.de6ebe9e0d4b8fc6645b793a@canb.auug.org.au> <50181451.5040202@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37409 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752271Ab2GaT4d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Jul 2012 15:56:33 -0400
In-Reply-To: <50181451.5040202@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

Em 31-07-2012 14:22, Randy Dunlap escreveu:
> drivers/built-in.o: In function `radio_tea5777_set_freq':
> radio-tea5777.c:(.text+0x4d8704): undefined reference to `__udivdi3'
> 
The patch below should fix it.

Thanks for reporting it!

Regards,
Mauro

[media] radio-tea5777: use library for 64bits div

From: Mauro Carvalho Chehab <mchehab@redhat.com>

drivers/built-in.o: In function `radio_tea5777_set_freq':
radio-tea5777.c:(.text+0x4d8704): undefined reference to `__udivdi3'

Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
index 3e12179..5bc9fa6 100644
--- a/drivers/media/radio/radio-tea5777.c
+++ b/drivers/media/radio/radio-tea5777.c
@@ -33,6 +33,7 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
+#include <asm/div64.h>
 #include "radio-tea5777.h"
 
 MODULE_AUTHOR("Hans de Goede <perex@perex.cz>");
@@ -158,10 +159,11 @@ static int radio_tea5777_set_freq(struct radio_tea5777 *tea)
 	int res;
 
 	freq = clamp_t(u32, tea->freq,
-		       TEA5777_FM_RANGELOW, TEA5777_FM_RANGEHIGH);
-	freq = (freq + 8) / 16; /* to kHz */
+		       TEA5777_FM_RANGELOW, TEA5777_FM_RANGEHIGH) + 8;
+	do_div(freq, 16); /* to kHz */
 
-	freq = (freq - TEA5777_FM_IF) / TEA5777_FM_FREQ_STEP;
+	freq -= TEA5777_FM_IF;
+	do_div(freq, TEA5777_FM_FREQ_STEP);
 
 	tea->write_reg &= ~(TEA5777_W_FM_PLL_MASK | TEA5777_W_FM_FREF_MASK);
 	tea->write_reg |= freq << TEA5777_W_FM_PLL_SHIFT;
