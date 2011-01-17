From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bjdooks-i2c tree with Linus' tree
Date: Mon, 17 Jan 2011 11:17:00 +1100
Message-ID: <20110117111700.7fefe690.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47999 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138Ab1AQARH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Jan 2011 19:17:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lennert Buytenhek <buytenh@wantstofly.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi Ben,

Today's linux-next merge of the bjdooks-i2c tree got a conflict in
arch/arm/mach-pxa/pxa27x.c between commit
a3f4c927d379cfaa597bc8ff75dc9d28f8d9200e ("ARM: PXA SoCs: irq_data
conversion") from Linus' tree and commit
0a56f28ec486273d84d25571573908344aa67176 ("arm/pxa2xx: reorganize I2C
files") from the bjdooks-i2c tree.

I fixed it up (see below) and can carry the fix as necessary.

Ben, is that stuff going into 2.6.38?  If so, please get Linus to pull it
as it has quite a few conflicts (especially this one commit) ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-pxa/pxa27x.c
index 987301f,1c77e89..0000000
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@@ -17,10 -17,8 +17,11 @@@
  #include <linux/suspend.h>
  #include <linux/platform_device.h>
  #include <linux/sysdev.h>
 +#include <linux/io.h>
 +#include <linux/irq.h>
+ #include <linux/i2c/pxa-i2c.h>
  
 +#include <asm/mach/map.h>
  #include <mach/hardware.h>
  #include <asm/irq.h>
  #include <mach/irqs.h>
@@@ -30,10 -28,7 +31,8 @@@
  #include <mach/ohci.h>
  #include <mach/pm.h>
  #include <mach/dma.h>
 +#include <mach/smemc.h>
  
- #include <plat/i2c.h>
- 
  #include "generic.h"
  #include "devices.h"
  #include "clock.h"
