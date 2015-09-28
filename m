From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 1/2] pinctrl: at91-pio4: use irq_set_handler_locked
Date: Mon, 28 Sep 2015 11:41:12 +0200
Message-ID: <1443433273-17417-2-git-send-email-ludovic.desroches@atmel.com>
References: <1443433273-17417-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443433273-17417-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.ferre@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: linux-next.vger.kernel.org

Use irq_set_handler_locked() as it avoids a redundant lookup of the
irq descriptor.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 6aff632..041df59 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -167,23 +167,23 @@ static int atmel_gpio_irq_set_type(struct irq_data *d, unsigned type)
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_RISING;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_FALLING;
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_BOTH;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_LOW;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_HIGH;
 		break;
 	case IRQ_TYPE_NONE:
-- 
2.5.0
