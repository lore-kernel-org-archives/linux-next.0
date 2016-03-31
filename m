From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Thu, 31 Mar 2016 13:22:35 +1100
Message-ID: <20160331132235.7f132973@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59888 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750704AbcCaCWi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Mar 2016 22:22:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

arch/powerpc/sysdev/ppc4xx_gpio.c: In function 'ppc4xx_gpio_set':
arch/powerpc/sysdev/ppc4xx_gpio.c:93:26: error: unused variable 'mm_gc' [-Werror=unused-variable]
  struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
                          ^
cc1: all warnings being treated as errors

Caused by commit

  0d36fe65f583 ("powerpc: ppc4xx: use gpiochip data pointer")

I applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Mar 2016 13:18:45 +1100
Subject: [PATCH] powerpc: ppc4xx: remove unused local variable

Fixes: 0d36fe65f583 ("powerpc: ppc4xx: use gpiochip data pointer")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/sysdev/ppc4xx_gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_gpio.c b/arch/powerpc/sysdev/ppc4xx_gpio.c
index 4ab83cd04785..5382d04dd872 100644
--- a/arch/powerpc/sysdev/ppc4xx_gpio.c
+++ b/arch/powerpc/sysdev/ppc4xx_gpio.c
@@ -90,7 +90,6 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static void
 ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
