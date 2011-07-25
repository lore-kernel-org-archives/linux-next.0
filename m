From: Shawn Guo <shawn.guo@freescale.com>
Subject: linux-next: merge error in arch/arm/mm/Kconfig?
Date: Mon, 25 Jul 2011 12:17:22 +0800
Message-ID: <20110725041720.GA21641@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:35142
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750776Ab1GYEKP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jul 2011 00:10:15 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>

There is a merge error (?) causing 'make ARCH=arm menuconfig' fails on
next-20110722.

---8<-------------
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index d490c4a..2df5504 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -834,7 +834,7 @@ config CACHE_L2X0
        depends on REALVIEW_EB_ARM11MP || MACH_REALVIEW_PB11MP || MACH_REALVIEW_PB1176 || \
                   REALVIEW_EB_A9MP || SOC_IMX35 || SOC_IMX31 || MACH_REALVIEW_PBX || \
                   ARCH_NOMADIK || ARCH_OMAP4 || ARCH_EXYNOS4 || ARCH_TEGRA || \
-                  ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_SHMOBILE ||
+                  ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_SHMOBILE || \
                   ARCH_PRIMA2 || ARCH_ZYNQ || ARCH_CNS3XXX
        default y
        select OUTER_CACHE


-- 
Regards,
Shawn
