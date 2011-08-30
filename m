From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s5p tree with the arm/arm-soc trees
Date: Tue, 30 Aug 2011 12:10:27 +1000
Message-ID: <20110830121027.e88cc4f789474be399171471@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46783 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769Ab1H3CKf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Aug 2011 22:10:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <rmk@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>

Hi Kukjin,

Today's linux-next merge of the s5p tree got a conflict in
arch/arm/mach-exynos4/mach-smdkc210.c between commit 2be5a4a7da6e ("ARM:
mach-exynos4: convert boot_params to atag_offset") from the arm and
arm-soc trees and commit 42c0d26d2c32 ("ARM: EXYNOS4: Turn the
mach-smdkc210.c into mach-smdv310.c") from the s5p tree.

The latter removed the file, so I did that and then applied the following
patch to arch/arm/mach-exynos4/mach-smdkv310.c.  I can carry the fixes as
necessary.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 30 Aug 2011 12:07:41 +1000
Subject: [PATCH] s5p: merge fixup for atags_offset use

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 1277d72..e479171 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -344,7 +344,7 @@ MACHINE_END
 
 MACHINE_START(SMDKC210, "SMDKC210")
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
-	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.atag_offset	= 0x100,
 	.init_irq	= exynos4_init_irq,
 	.map_io		= smdkv310_map_io,
 	.init_machine	= smdkv310_machine_init,
-- 
1.7.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
