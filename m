From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the arm-soc
 tree
Date: Tue, 7 Jun 2016 12:56:20 +1000
Message-ID: <20160607125620.22fd45c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47224 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751126AbcFGC4X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jun 2016 22:56:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Daniel,

Today's linux-next merge of the clockevents tree got conflicts in:

  arch/arm/Kconfig
  arch/arm/mach-mxs/Kconfig

between commit:

  5c34a4e89c74 ("ARM: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB")

from the arm-soc tree and commits:

  db01e25865a3 ("clocksource/drivers/clps_711x: Add the COMPILE_TEST option")
  b37b0e101e59 ("clocksource/drivers/mxs: Add the COMPILE_TEST option")

from the clockevents tree.

Please keep select lines ordered if they appear to be already.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/Kconfig
index a0af11b90236,0c1f5468a8e7..000000000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -354,8 -354,8 +354,8 @@@ config ARM_SINGLE_ARMV7
  
  config ARCH_CLPS711X
  	bool "Cirrus Logic CLPS711x/EP721x/EP731x-based"
 -	select ARCH_REQUIRE_GPIOLIB
  	select AUTO_ZRELADDR
- 	select CLKSRC_MMIO
++	select CLPS711X_TIMER
  	select COMMON_CLK
  	select CPU_ARM720T
  	select GENERIC_CLOCKEVENTS
diff --cc arch/arm/mach-mxs/Kconfig
index 5d9e5fce7937,68a3a9ec605d..000000000000
--- a/arch/arm/mach-mxs/Kconfig
+++ b/arch/arm/mach-mxs/Kconfig
@@@ -15,8 -15,8 +15,8 @@@ config SOC_IMX2
  config ARCH_MXS
  	bool "Freescale MXS (i.MX23, i.MX28) support"
  	depends on ARCH_MULTI_V5
- 	select CLKSRC_MMIO
 -	select ARCH_REQUIRE_GPIOLIB
 +	select GPIOLIB
+ 	select MXS_TIMER
  	select PINCTRL
  	select SOC_BUS
  	select SOC_IMX23
