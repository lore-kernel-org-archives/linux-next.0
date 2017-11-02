From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Thu, 2 Nov 2017 16:20:38 +1100
Message-ID: <20171102162038.339466ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbdKBFUk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 01:20:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpio/gpio-uniphier.c:324:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .activate = uniphier_gpio_irq_domain_activate,
              ^

Caused by commit

  dbe776c2ca54 ("gpio: uniphier: add UniPhier GPIO controller driver")

interacting with commit

  72491643469a ("genirq/irqdomain: Update irq_domain_ops.activate() signature")

from the tip tree

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 Nov 2017 16:10:46 +1100
Subject: [PATCH] gpio: uniphier: merge fix for "Update
 irq_domain_ops.activate() signature"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpio/gpio-uniphier.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index d62cea4ed6b7..d0069202ade3 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -300,13 +300,15 @@ static int uniphier_gpio_irq_domain_alloc(struct irq_domain *domain,
 	return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
 }
 
-static void uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
-					      struct irq_data *data)
+static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
+					      struct irq_data *data,
+					      bool early)
 {
 	struct uniphier_gpio_priv *priv = domain->host_data;
 	struct gpio_chip *chip = &priv->chip;
 
 	gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
+	return 0;
 }
 
 static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
-- 
2.14.1

-- 
Cheers,
Stephen Rothwell
