From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] sound: fix opti92x-ad1848 build
Date: Mon, 08 Mar 2010 09:32:42 -0800
Message-ID: <4B9534BA.4020903@oracle.com>
References: <20100308152740.a007e8cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:52969 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751Ab0CHRdq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2010 12:33:46 -0500
In-Reply-To: <20100308152740.a007e8cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix 'else' placement in ifdef block so that build succeeds:

sound/isa/opti9xx/opti92x-ad1848.c:221: error: 'else' without a previous 'if'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Jaroslav Kysela <perex@perex.cz>
Cc:	Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opti9xx/opti92x-ad1848.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20100308.orig/sound/isa/opti9xx/opti92x-ad1848.c
+++ linux-next-20100308/sound/isa/opti9xx/opti92x-ad1848.c
@@ -217,8 +217,9 @@ static int __devinit snd_opti9xx_init(st
 	if (isapnp && chip->mc_base)
 		/* PnP resource gives the least 10 bits */
 		chip->mc_base |= 0xc00;
+	else
 #endif	/* CONFIG_PNP */
-	else {
+	{
 		chip->mc_base = 0xf8c;
 		chip->mc_base_size = opti9xx_mc_size[hardware];
 	}
