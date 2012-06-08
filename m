From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] MFD: twl6040: Update Kconfig to avoid build breakage
Date: Fri,  8 Jun 2012 09:35:00 +0300
Message-ID: <1339137300-16546-1-git-send-email-peter.ujfalusi@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, t-kristo@ti.com, Randy Dunlap <rdunlap@xenotime.net>, peter.ujfalusi@ti.com
List-Id: linux-next.vger.kernel.org

twl6040 needs CONFIG_IRQ_DOMAIN to compile, without this we have:
drivers/mfd/twl6040-irq.c: In function 'twl6040_irq_init':
drivers/mfd/twl6040-irq.c:164:2: error: implicit declaration of function 'irq_domain_add_legacy'
drivers/mfd/twl6040-irq.c:165:11: error: 'irq_domain_simple_ops' undeclared (first use in this function)
drivers/mfd/twl6040-irq.c:165:11: note: each undeclared identifier is reported only once for each function it appears in

Reported by: Randy Dunlap <rdunlap@xenotime.net>

At the same time limit the twl6040 availability to ARM architecture since
it is unlikely that this chip is going to be used on other architectures.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/mfd/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e129c82..b6af334 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -283,9 +283,10 @@ config TWL6030_PWM
 
 config TWL6040_CORE
 	bool "Support for TWL6040 audio codec"
-	depends on I2C=y && GENERIC_HARDIRQS
+	depends on I2C=y && GENERIC_HARDIRQS && ARM
 	select MFD_CORE
 	select REGMAP_I2C
+	select IRQ_DOMAIN
 	default n
 	help
 	  Say yes here if you want support for Texas Instruments TWL6040 audio
-- 
1.7.8.6
