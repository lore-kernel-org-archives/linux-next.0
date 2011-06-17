From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the trivial tree
Date: Fri, 17 Jun 2011 13:15:15 +1000
Message-ID: <20110617131515.f6e6c5a9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43119 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755028Ab1FQDPU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jun 2011 23:15:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ryan Mallon <rmallon@gmail.com>, H Hartley Sweeten <hartleys@visionengravers.com>

Hi Grant,

Today's linux-next merge of the gpio tree got a conflict in
drivers/gpio/gpio-ep93xx.c between commit 1c5454eed85a ("Change Ryan
Mallon's email address across the kernel") from the trivial tree and
commit 1e4c88420e0d ("gpio/ep93xx: convert to platform_driver and use
basic_mmio_gpio library") from the gpio tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpio/gpio-ep93xx.c
index 1a0f852,3bfd341..0000000
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@@ -1,9 -1,8 +1,8 @@@
  /*
-  * linux/arch/arm/mach-ep93xx/gpio.c
-  *
   * Generic EP93xx GPIO handling
   *
 - * Copyright (c) 2008 Ryan Mallon <ryan@bluewatersys.com>
 + * Copyright (c) 2008 Ryan Mallon
+  * Copyright (c) 2011 H Hartley Sweeten <hsweeten@visionengravers.com>
   *
   * Based on code originally from:
   *  linux/arch/arm/mach-ep93xx/core.c
