From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 20:13:24 +0100
Message-ID: <20150831201324.6419ee0d@why.wild-wind.fr.eu.org>
References: <20150831195420.371e8849@canb.auug.org.au>
	<20150831141736.GA19616@roeck-us.net>
	<20150831163103.2e13b301@arm.com>
	<55E476FB.2040208@roeck-us.net>
	<20150831171807.27d78ff0@arm.com>
	<55E4838B.5000500@roeck-us.net>
	<20150831180922.4392875e@arm.com>
	<20150831192657.557e45cc@why.wild-wind.fr.eu.org>
	<55E4A38A.6070306@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58181 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752327AbbHaTJf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 15:09:35 -0400
In-Reply-To: <55E4A38A.6070306@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>, Mark Brown <broonie@kernel.org>, Markus Pargmann <mpa@pengutronix.de>

On Mon, 31 Aug 2015 11:57:14 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Hi Marc,
> 
> On 08/31/2015 11:26 AM, Marc Zyngier wrote:
> [ ... ]
> >
> > Actually, the kernel dies because of this:
> >
> > commit adaac459759db4a1fd35baddbe47bac700095496
> > Author: Markus Pargmann <mpa@pengutronix.de>
> > Date:   Sun Aug 30 09:33:53 2015 +0200
> >
> >      regmap: Introduce max_raw_read/write for regmap_bulk_read/write
> >
> >      There are some buses which have a limit on the maximum number of
> >      bytes that can be send/received. An example for this is
> >      I2C_FUNC_SMBUS_I2C_BLOCK which does not support any reads/writes of
> >      more than 32 bytes. The regmap_bulk operations should still be able
> >      to utilize the full 32 bytes in this case.
> >
> >      Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> >      Signed-off-by: Mark Brown <broonie@kernel.org>
> >
> > which never considers bus to be NULL in __regmap_init. With the
> > following patch applied, I can boot to a prompt:
> >
> >  From 031eae5a1b34f952ba3dcaecb4eb4ec9d3bda352 Mon Sep 17 00:00:00 2001
> > From: Marc Zyngier <marc.zyngier@arm.com>
> > Date: Mon, 31 Aug 2015 19:16:16 +0100
> > Subject: [PATCH] regmap: Fix max_raw_read/write handling when bus is NULL
> >
> > Commit adaac459759d ("regmap: Introduce max_raw_read/write
> > for regmap_bulk_read/write") added new fields to regmap_bus
> > and started using them in __regmap_init, but failed to
> > consider the case where bus would be NULL, like in the
> > vexpress-syscgf case. The box (actually its qemu version)
> > ends up dying painfully.
> >
> > Fix it by testing bus before doing anything else.
> >
> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> 
> Yes, that fixes the vexpress failures.
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> However, I still need to revert your patches to get my realview-pb-a8
> and realview-eb tests to work again.
> 
> I am a bit concerned about the use of of_address_to_resource(),
> which can return an error, leaving cpu_res undefined. Also, if
> both CONFIG_OF and CONFIG_ACPI are not configured, supports_deactivate
> is set to true by default. This is the configuration used in my
> failing tests.
> 
> With that in mind, I ran a simple test.
> 
> -static struct static_key supports_deactivate = STATIC_KEY_INIT_TRUE;
> +static struct static_key supports_deactivate = STATIC_KEY_INIT_FALSE;
> 
> Bingo, problem solved. Can you try to find a clean solution ?

Yeah, I just came to the same conclusion, and to the following patch:

>From 059bc80a4fc433dda99d75a712f30a77ce4964bc Mon Sep 17 00:00:00 2001
From: Marc Zyngier <marc.zyngier@arm.com>
Date: Mon, 31 Aug 2015 20:00:35 +0100
Subject: [PATCH] irqchip/gic: Fix EOImode settiing non-DT/ACPI systems

Non-DT/ACPI systems call directly into the GIC driver at init time.
Since 0b996fd35957 ("irqchip/GIC: Convert to EOImode == 1"), this
breaks old non firmware-driven platforms, as the driver only
works out the capability of the platform on the DT/ACPI paths.

Fix this thinko by forcing EOImode==0 on non-DT platforms,
which are not capable of supporting a hypervisor anyway.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/irqchip/irq-gic.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 72bf81b..e6b7ed5 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -993,7 +993,7 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.xlate = gic_irq_domain_xlate,
 };
 
-void __init gic_init_bases(unsigned int gic_nr, int irq_start,
+static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 			   void __iomem *dist_base, void __iomem *cpu_base,
 			   u32 percpu_offset, struct device_node *node)
 {
@@ -1103,6 +1103,19 @@ void __init gic_init_bases(unsigned int gic_nr, int irq_start,
 	gic_pm_init(gic);
 }
 
+void __init gic_init_bases(unsigned int gic_nr, int irq_start,
+			   void __iomem *dist_base, void __iomem *cpu_base,
+			   u32 percpu_offset, struct device_node *node)
+{
+	/*
+	 * Non-DT/ACPI systems won't run a hypervisor, so let's not
+	 * bother with these...
+	 */
+	static_key_slow_dec(&supports_deactivate);
+	__gic_init_bases(gic_nr, irq_start, dist_base, cpu_base,
+			 percpu_offset, node);
+}
+
 #ifdef CONFIG_OF
 static int gic_cnt __initdata;
 
@@ -1137,7 +1150,7 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	if (of_property_read_u32(node, "cpu-offset", &percpu_offset))
 		percpu_offset = 0;
 
-	gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset, node);
+	__gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset, node);
 	if (!gic_cnt)
 		gic_init_physaddr(node);
 
@@ -1265,7 +1278,7 @@ gic_v2_acpi_init(struct acpi_table_header *table)
 	 * as default IRQ domain to allow for GSI registration and GSI to IRQ
 	 * number translation (see acpi_register_gsi() and acpi_gsi_to_irq()).
 	 */
-	gic_init_bases(0, -1, dist_base, cpu_base, 0, NULL);
+	__gic_init_bases(0, -1, dist_base, cpu_base, 0, NULL);
 	irq_set_default_host(gic_data[0].domain);
 
 	acpi_irq_model = ACPI_IRQ_MODEL_GIC;
-- 
2.1.4

Can you give it a whirl? It makes the PB-A8 emulation work correctly
here.

> I wonder how it comes that you get a console output from qemu, but I don't.
> Did you use multi_v7_defconfig or some other configuration ?

I enable earlyprintk, which makes debugging much easier...  Of course,
earlyprintk comes with its own set of issues (it is the absolute
negation of any form of multiplatform kernel), which is why it is
disabled by default.

Thanks,

	M. 
-- 
Without deviation from the norm, progress is not possible.
