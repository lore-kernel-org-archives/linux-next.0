From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] genirq: Export irq_{get,set}_irqchip_state()
Date: Wed, 22 Jul 2015 12:43:04 -0700
Message-ID: <1437594184-22966-1-git-send-email-bjorn.andersson@sonymobile.com>
References: <20150722184015.GA11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:7348 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751333AbbGVTnJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jul 2015 15:43:09 -0400
In-Reply-To: <20150722184015.GA11162@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Export these functions to be able to build the Qualcomm family A PMIC
gpio and mpp drivers as modules.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 kernel/irq/manage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index f9744853b656..3ceedb34e38b 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1875,6 +1875,7 @@ int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 	irq_put_desc_busunlock(desc, flags);
 	return err;
 }
+EXPORT_SYMBOL(irq_get_irqchip_state);
 
 /**
  *	irq_set_irqchip_state - set the state of a forwarded interrupt.
@@ -1920,3 +1921,4 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 	irq_put_desc_busunlock(desc, flags);
 	return err;
 }
+EXPORT_SYMBOL(irq_set_irqchip_state);
-- 
1.8.2.2
