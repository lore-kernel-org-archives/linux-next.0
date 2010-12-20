From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the ux500-core tree
Date: Mon, 20 Dec 2010 15:21:48 +1100
Message-ID: <20101220152148.6fedee0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60851 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751281Ab0LTEVx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Dec 2010 23:21:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sundar Iyer <sundar.iyer@stericsson.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in
drivers/mfd/tc35892.c between commit
f4e8afdc7ab1b5a0962be02a9dd15d29a81f4c53 ("mfd/tc35892: rename tc35892
core driver to tc3589x") from the ux500-core tree and commit
9716d7717db1eb7b407e67e576a8ca515836d0da ("mfd: Convert tc35892 to new
irq_ APIs") from the mfd tree.

The former renamed the file modified by the latter.  I have applied the
patch from the mfd tree to the new file drivers/mfd/tc3589x.c (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sun, 12 Dec 2010 12:26:09 +0000
Subject: [PATCH] mfd: Convert tc35892 to new irq_ APIs

The genirq core is being converted to pass struct irq_data to irq_chip
operations rather than an IRQ number. Update the tc35892 driver to the
new APIs.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
Acked-by: Rabin Vincent <rabin.vincent@stericsson.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 drivers/mfd/tc3589x.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 32291fe..dde2d858 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -170,15 +170,15 @@ again:
 	return IRQ_HANDLED;
 }
 
-static void tc3589x_irq_dummy(unsigned int irq)
+static void tc3589x_irq_dummy(struct irq_data *data)
 {
 	/* No mask/unmask at this level */
 }
 
 static struct irq_chip tc3589x_irq_chip = {
-	.name	= "tc3589x",
-	.mask	= tc3589x_irq_dummy,
-	.unmask	= tc3589x_irq_dummy,
+	.name		= "tc3589x",
+	.irq_mask	= tc3589x_irq_dummy,
+	.irq_unmask	= tc3589x_irq_dummy,
 };
 
 static int tc3589x_irq_init(struct tc3589x *tc3589x)
-- 
1.7.2.3
