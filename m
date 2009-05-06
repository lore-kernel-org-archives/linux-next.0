From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with the arm-current tree
Date: Wed, 6 May 2009 11:32:33 +1000
Message-ID: <20090506113233.af9db4f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54141 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754002AbZEFBc5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2009 21:32:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sascha Hauer <s.hauer@pengutronix.de>

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/Kconfig between commit 9abf137c6dbf6eabb3add98fcd8352c3dd520568
("ARM: ARCH_MXC should select HAVE_CLK") from the arm-current tree and
commit 788c9700e7855f8a8cc8875e30d2518b57385c20 ("[ARM] Kconfig: sort ARM
machine class support choice list by option name") from the arm tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Kconfig
index e60ec54,01cb452..0000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -292,6 -292,29 +292,30 @@@ config ARCH_FOOTBRIDG
  	  Support for systems based on the DC21285 companion chip
  	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
  
+ config ARCH_MXC
+ 	bool "Freescale MXC/iMX-based"
+ 	select GENERIC_TIME
+ 	select GENERIC_CLOCKEVENTS
+ 	select ARCH_MTD_XIP
+ 	select GENERIC_GPIO
+ 	select ARCH_REQUIRE_GPIOLIB
++	select HAVE_CLK
+ 	help
+ 	  Support for Freescale MXC/iMX-based family of processors
+ 
+ config ARCH_STMP3XXX
+ 	bool "Freescale STMP3xxx"
+ 	select CPU_ARM926T
+ 	select HAVE_CLK
+ 	select COMMON_CLKDEV
+ 	select ARCH_REQUIRE_GPIOLIB
+ 	select GENERIC_TIME
+ 	select GENERIC_CLOCKEVENTS
+ 	select GENERIC_GPIO
+ 	select USB_ARCH_HAS_EHCI
+ 	help
+ 	  Support for systems based on the Freescale 3xxx CPUs.
+ 
  config ARCH_NETX
  	bool "Hilscher NetX based"
  	select CPU_ARM926T
