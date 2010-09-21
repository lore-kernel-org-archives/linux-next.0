From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input tree with the davinci tree
Date: Tue, 21 Sep 2010 12:46:32 +1000
Message-ID: <20100921124632.3be46417.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35242 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752149Ab0IUCqf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Sep 2010 22:46:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyril Chemparathy <cyril@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>, Abraham Arce <x0066660@ti.com>, Syed Rafiuddin <rafiuddin.syed@ti.com>

Hi Dmitry,

Today's linux-next merge of the input tree got a conflict in
drivers/input/keyboard/Kconfig between commit
34dca1011e05d3965c0f60d51a69643789683877 ("input: add driver for
tnetv107x on-chip keypad controller") from the davinci tree and commit
a17f79553f052f04d47689a842118f775f81b7e3 ("Input: add support for OMAP4
keyboard controller") from the input tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
diff --cc drivers/input/keyboard/Kconfig
index df1facb,4f30048..0000000
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@@ -424,15 -424,15 +424,24 @@@ config KEYBOARD_OMA
  	  To compile this driver as a module, choose M here: the
  	  module will be called omap-keypad.
  
+ config KEYBOARD_OMAP4
+ 	tristate "TI OMAP4 keypad support"
+ 	depends on ARCH_OMAP4
+ 	help
+ 	  Say Y here if you want to use the OMAP4 keypad.
+ 
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called omap4-keypad.
+ 
 +config KEYBOARD_TNETV107X
 +	tristate "TI TNETV107X keypad support"
 +	depends on ARCH_DAVINCI_TNETV107X
 +	help
 +	  Say Y here if you want to use the TNETV107X keypad.
 +
 +	  To compile this driver as a module, choose M here: the
 +	  module will be called tnetv107x-keypad.
 +
  config KEYBOARD_TWL4030
  	tristate "TI TWL4030/TWL5030/TPS659x0 keypad support"
  	depends on TWL4030_CORE
