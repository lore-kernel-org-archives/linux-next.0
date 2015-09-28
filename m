From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 2/2] pinctrl: at91-pio4: irq argument as been removed from irq flow handlers
Date: Mon, 28 Sep 2015 11:41:13 +0200
Message-ID: <1443433273-17417-3-git-send-email-ludovic.desroches@atmel.com>
References: <1443433273-17417-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443433273-17417-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.ferre@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: linux-next.vger.kernel.org

Irq argument as been removed from irq flow handlers so use the irq
descriptor to retrieve data we need.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 041df59..4aa6be0 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -222,9 +222,10 @@ static struct irq_chip atmel_gpio_irq_chip = {
 	.irq_set_type	= atmel_gpio_irq_set_type,
 };
 
-static void atmel_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+static void atmel_gpio_irq_handler(struct irq_desc *desc)
 {
-	struct atmel_pioctrl *atmel_pioctrl = irq_get_handler_data(irq);
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct atmel_pioctrl *atmel_pioctrl = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long isr;
 	int n, bank = -1;
-- 
2.5.0
