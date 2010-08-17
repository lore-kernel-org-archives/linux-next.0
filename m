From: Jarkko Nikula <jhnikula@gmail.com>
Subject: [PATCH] ASoC: multi-component - Drop board-n8x0.c changes
Date: Tue, 17 Aug 2010 09:58:02 +0300
Message-ID: <1282028282-13264-1-git-send-email-jhnikula@gmail.com>
References: <20100817093445.ade1b4a4.jhnikula@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:41641 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756460Ab0HQG6F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2010 02:58:05 -0400
Received: by eyg5 with SMTP id 5so1745797eyg.19
        for <linux-next@vger.kernel.org>; Mon, 16 Aug 2010 23:58:04 -0700 (PDT)
In-Reply-To: <20100817093445.ade1b4a4.jhnikula@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: alsa-devel@alsa-project.org
Cc: linux-next@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Tony Lindgren <tony@atomide.com>, Jarkko Nikula <jhnikula@gmail.com>

These will conflict with queued changes to board-n8x0.c coming from
linux-omap tree. Only side effect from this dropping is that the integrated
digital microphone on Nokia N810 will stop working when ASoC multi-component
is merged.

As currently the N810 is not very usable in mainline, I consider this as a
minor issue that can be fixed in linux-omap tree the after the
multi-component is merged.

Signed-off-by: Jarkko Nikula <jhnikula@gmail.com>
---
 arch/arm/mach-omap2/board-n8x0.c |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 04df912..3ccc34e 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -20,7 +20,6 @@
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
 #include <linux/usb/musb.h>
-#include <sound/tlv320aic3x.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -613,25 +612,11 @@ static int n8x0_menelaus_late_init(struct device *dev)
 	return 0;
 }
 
-static struct aic3x_setup_data n810_aic33_setup = {
-	.gpio_func[0] = AIC3X_GPIO1_FUNC_DISABLED,
-	.gpio_func[1] = AIC3X_GPIO2_FUNC_DIGITAL_MIC_INPUT,
-};
-
-static struct aic3x_pdata n810_aic33_data = {
-	.setup = &n810_aic33_setup,
-	.gpio_reset = -1,
-};
-
 static struct i2c_board_info __initdata n8x0_i2c_board_info_1[] = {
 	{
 		I2C_BOARD_INFO("menelaus", 0x72),
 		.irq = INT_24XX_SYS_NIRQ,
 	},
-	{
-		I2C_BOARD_INFO("tlv320aic3x", 0x1b),
-		.platform_data = &n810_aic33_data,
-	},
 };
 
 static struct menelaus_platform_data n8x0_menelaus_platform_data = {
-- 
1.7.1
