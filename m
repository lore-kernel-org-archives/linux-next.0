From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the
 samsung-krzk tree
Date: Mon, 23 Nov 2015 12:22:47 +1100
Message-ID: <20151123122247.23eb6f3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47918 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752813AbbKWBWw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2015 20:22:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  arch/arm/mach-exynos/Kconfig

between commit:

  23067d397616 ("ARM: EXYNOS: Switch to syscon reboot and poweroff")

from the samsung-krzk tree and commit:

  b21f38ccbc1d ("clocksource/drivers/exynos_mct: Fix Kconfig and add COMPILE_TEST option")

from the clockevents tree.

OK, so these entries were sorted at one point for a reason :-(

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-exynos/Kconfig
index d279edf9b10d,ff105399aae4..000000000000
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@@ -14,6 -14,6 +14,7 @@@ menuconfig ARCH_EXYNO
  	select ARCH_REQUIRE_GPIOLIB
  	select ARM_AMBA
  	select ARM_GIC
++	select CLKSRC_EXYNOS_MCT
  	select COMMON_CLK_SAMSUNG
  	select EXYNOS_THERMAL
  	select HAVE_ARM_SCU if SMP
@@@ -23,13 -23,11 +24,13 @@@
  	select PINCTRL
  	select PINCTRL_EXYNOS
  	select PM_GENERIC_DOMAINS if PM
++	select POWER_RESET
++	select POWER_RESET_SYSCON
++	select POWER_RESET_SYSCON_POWEROFF
  	select S5P_DEV_MFC
  	select SRAM
  	select THERMAL
  	select MFD_SYSCON
- 	select POWER_RESET
- 	select POWER_RESET_SYSCON
- 	select POWER_RESET_SYSCON_POWEROFF
 -	select CLKSRC_EXYNOS_MCT
  	help
  	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
  
