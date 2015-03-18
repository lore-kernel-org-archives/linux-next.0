From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the irqchip tree with Linus' tree
Date: Wed, 18 Mar 2015 17:52:08 +0000
Message-ID: <20150318175208.GC15137@io.lakedaemon.net>
References: <20150316144727.488070cb@canb.auug.org.au>
 <5506989D.9050703@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5506989D.9050703@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 16, 2015 at 08:47:25AM +0000, Marc Zyngier wrote:
> Hi Stephen, Jason,
> 
> On 16/03/15 03:47, Stephen Rothwell wrote:
> > Hi Jason,
> > 
> > Today's linux-next merge of the irqchip tree got a conflict in
> > arch/arm/mach-exynos/suspend.c between commit ace283a04a4a ("ARM:
> > EXYNOS: Fix wrong hwirq of RTC interrupt for Exynos3250 SoC") from
> > Linus' tree and commit be42c9ea7b5f ("ARM: exynos4/5: convert pmu
> > wakeup to stacked domains") from the irqchip tree.
> > 
> > I fixed it up (I just randomly chose to use the irqchip tree version)
> > and can carry the fix as necessary (no action is required).
> > 
> 
> Actually, the fix is slightly less obvious, mostly because I introduced
> a bug while converting the code to stacked domains. I noticed that
> something was amiss in the Exynos code, but fixed it the wrong way
> (I assumed the DT was wrong, while it was the code).
> 
> Now, in the light of ace283a04a4a, the fix should be:

Squashed in and a new irqchip/stacked-exynos posted.  Result attached.

thx,

Jason.

--------------->8-------------------------------------
commit 8b283c025443e4c3a3323c92777f422fa504caa5
Author: Marc Zyngier <marc.zyngier@arm.com>
Date:   Wed Mar 11 15:44:52 2015 +0000

    ARM: exynos4/5: convert pmu wakeup to stacked domains
    
    Exynos has been (ab)using the gic_arch_extn to provide
    wakeup from suspend, and it makes a lot of sense to convert
    this code to use stacked domains instead.
    
    This patch does just this, updating the DT files to actually
    reflect what the HW provides.
    
    BIG FAT WARNING: because the DTs were so far lying by not
    exposing the fact that the PMU block is actually the first
    interrupt controller in the chain for RTC, kernels with this patch
    applied wont have any suspend-resume facility when booted
    with old DTs, and old kernels with updated DTs may not even boot.
    
    Also, I strongly suspect that there is more than two wake-up
    interrupts on these platforms, but I leave it to the maintainers
    to fix their mess.
    
    Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
    Link: https://lkml.kernel.org/r/1426088693-15724-2-git-send-email-marc.zyngier@arm.com
    [ jac: squash in maz's fixup from
      https://lkml.kernel.org/r/5506989D.9050703@arm.com ]
    Signed-off-by: Jason Cooper <jason@lakedaemon.net>

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 277b48b0b6f9..580b21095eab 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -130,6 +130,9 @@
 		pmu_system_controller: system-controller@10020000 {
 			compatible = "samsung,exynos3250-pmu", "syscon";
 			reg = <0x10020000 0x4000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
 		};
 
 		mipi_phy: video-phy@10020710 {
@@ -184,6 +187,7 @@
 			compatible = "samsung,exynos3250-rtc";
 			reg = <0x10070000 0x100>;
 			interrupts = <0 73 0>, <0 74 0>;
+			interrupt-parent = <&pmu_system_controller>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 76173cacd450..1d21f0272390 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -152,6 +152,9 @@
 	pmu_system_controller: system-controller@10020000 {
 		compatible = "samsung,exynos4210-pmu", "syscon";
 		reg = <0x10020000 0x4000>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
 	};
 
 	dsi_0: dsi@11C80000 {
@@ -264,6 +267,7 @@
 	rtc@10070000 {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x10070000 0x100>;
+		interrupt-parent = <&pmu_system_controller>;
 		interrupts = <0 44 0>, <0 45 0>;
 		clocks = <&clock CLK_RTC>;
 		clock-names = "rtc";
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9bb1b0b738f5..72fa2d196629 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -196,6 +196,9 @@
 		clock-names = "clkout16";
 		clocks = <&clock CLK_FIN_PLL>;
 		#clock-cells = <1>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
 	};
 
 	sysreg_system_controller: syscon@10050000 {
@@ -232,6 +235,7 @@
 	rtc: rtc@101E0000 {
 		clocks = <&clock CLK_RTC>;
 		clock-names = "rtc";
+		interrupt-parent = <&pmu_system_controller>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9dc2e9773b30..d11a6ab4ecd2 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -327,6 +327,7 @@
 	rtc: rtc@101E0000 {
 		clocks = <&clock CLK_RTC>;
 		clock-names = "rtc";
+		interrupt-parent = <&pmu_system_controller>;
 		status = "disabled";
 	};
 
@@ -769,6 +770,9 @@
 		clock-names = "clkout16";
 		clocks = <&clock CLK_FIN_PLL>;
 		#clock-cells = <1>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
 	};
 
 	sysreg_system_controller: syscon@10050000 {
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 9e9dfdfad9d7..f44c2e05c82e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -166,16 +166,14 @@ static void __init exynos_init_io(void)
 	exynos_map_io();
 }
 
+/*
+ * Apparently, these SoCs are not able to wake-up from suspend using
+ * the PMU. Too bad. Should they suddenly become capable of such a
+ * feat, the matches below should be moved to suspend.c.
+ */
 static const struct of_device_id exynos_dt_pmu_match[] = {
-	{ .compatible = "samsung,exynos3250-pmu" },
-	{ .compatible = "samsung,exynos4210-pmu" },
-	{ .compatible = "samsung,exynos4212-pmu" },
-	{ .compatible = "samsung,exynos4412-pmu" },
-	{ .compatible = "samsung,exynos4415-pmu" },
-	{ .compatible = "samsung,exynos5250-pmu" },
 	{ .compatible = "samsung,exynos5260-pmu" },
 	{ .compatible = "samsung,exynos5410-pmu" },
-	{ .compatible = "samsung,exynos5420-pmu" },
 	{ /*sentinel*/ },
 };
 
@@ -186,9 +184,6 @@ static void exynos_map_pmu(void)
 	np = of_find_matching_node(NULL, exynos_dt_pmu_match);
 	if (np)
 		pmu_base_addr = of_iomap(np, 0);
-
-	if (!pmu_base_addr)
-		panic("failed to find exynos pmu register\n");
 }
 
 static void __init exynos_init_irq(void)
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 52e2b1a2fddb..7b09e7631245 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -18,7 +18,9 @@
 #include <linux/syscore_ops.h>
 #include <linux/cpu_pm.h>
 #include <linux/io.h>
-#include <linux/irqchip/arm-gic.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
 #include <linux/err.h>
 #include <linux/regulator/machine.h>
 
@@ -43,8 +45,8 @@
 #define EXYNOS5420_CPU_STATE	0x28
 
 /**
- * struct exynos_wkup_irq - Exynos GIC to PMU IRQ mapping
- * @hwirq: Hardware IRQ signal of the GIC
+ * struct exynos_wkup_irq - PMU IRQ to mask mapping
+ * @hwirq: Hardware IRQ signal of the PMU
  * @mask: Mask in PMU wake-up mask register
  */
 struct exynos_wkup_irq {
@@ -93,14 +95,14 @@ static const struct exynos_wkup_irq exynos3250_wkup_irq[] = {
 };
 
 static const struct exynos_wkup_irq exynos4_wkup_irq[] = {
-	{ 76, BIT(1) }, /* RTC alarm */
-	{ 77, BIT(2) }, /* RTC tick */
+	{ 44, BIT(1) }, /* RTC alarm */
+	{ 45, BIT(2) }, /* RTC tick */
 	{ /* sentinel */ },
 };
 
 static const struct exynos_wkup_irq exynos5250_wkup_irq[] = {
-	{ 75, BIT(1) }, /* RTC alarm */
-	{ 76, BIT(2) }, /* RTC tick */
+	{ 43, BIT(1) }, /* RTC alarm */
+	{ 44, BIT(2) }, /* RTC tick */
 	{ /* sentinel */ },
 };
 
@@ -167,6 +169,113 @@ static int exynos_irq_set_wake(struct irq_data *data, unsigned int state)
 	return -ENOENT;
 }
 
+static struct irq_chip exynos_pmu_chip = {
+	.name			= "PMU",
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_wake		= exynos_irq_set_wake,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+#endif
+};
+
+static int exynos_pmu_domain_xlate(struct irq_domain *domain,
+				   struct device_node *controller,
+				   const u32 *intspec,
+				   unsigned int intsize,
+				   unsigned long *out_hwirq,
+				   unsigned int *out_type)
+{
+	if (domain->of_node != controller)
+		return -EINVAL;	/* Shouldn't happen, really... */
+	if (intsize != 3)
+		return -EINVAL;	/* Not GIC compliant */
+	if (intspec[0] != 0)
+		return -EINVAL;	/* No PPI should point to this domain */
+
+	*out_hwirq = intspec[1];
+	*out_type = intspec[2];
+	return 0;
+}
+
+static int exynos_pmu_domain_alloc(struct irq_domain *domain,
+				   unsigned int virq,
+				   unsigned int nr_irqs, void *data)
+{
+	struct of_phandle_args *args = data;
+	struct of_phandle_args parent_args;
+	irq_hw_number_t hwirq;
+	int i;
+
+	if (args->args_count != 3)
+		return -EINVAL;	/* Not GIC compliant */
+	if (args->args[0] != 0)
+		return -EINVAL;	/* No PPI should point to this domain */
+
+	hwirq = args->args[1];
+
+	for (i = 0; i < nr_irqs; i++)
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &exynos_pmu_chip, NULL);
+
+	parent_args = *args;
+	parent_args.np = domain->parent->of_node;
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_args);
+}
+
+static struct irq_domain_ops exynos_pmu_domain_ops = {
+	.xlate	= exynos_pmu_domain_xlate,
+	.alloc	= exynos_pmu_domain_alloc,
+	.free	= irq_domain_free_irqs_common,
+};
+
+static int __init exynos_pmu_irq_init(struct device_node *node,
+				      struct device_node *parent)
+{
+	struct irq_domain *parent_domain, *domain;
+
+	if (!parent) {
+		pr_err("%s: no parent, giving up\n", node->full_name);
+		return -ENODEV;
+	}
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		pr_err("%s: unable to obtain parent domain\n", node->full_name);
+		return -ENXIO;
+	}
+
+	pmu_base_addr = of_iomap(node, 0);
+
+	if (!pmu_base_addr) {
+		pr_err("%s: failed to find exynos pmu register\n",
+		       node->full_name);
+		return -ENOMEM;
+	}
+
+	domain = irq_domain_add_hierarchy(parent_domain, 0, 0,
+					  node, &exynos_pmu_domain_ops,
+					  NULL);
+	if (!domain) {
+		iounmap(pmu_base_addr);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+#define EXYNOS_PMU_IRQ(symbol, name)	OF_DECLARE_2(irqchip, symbol, name, exynos_pmu_irq_init)
+
+EXYNOS_PMU_IRQ(exynos3250_pmu_irq, "samsung,exynos3250-pmu");
+EXYNOS_PMU_IRQ(exynos4210_pmu_irq, "samsung,exynos4210-pmu");
+EXYNOS_PMU_IRQ(exynos4212_pmu_irq, "samsung,exynos4212-pmu");
+EXYNOS_PMU_IRQ(exynos4412_pmu_irq, "samsung,exynos4412-pmu");
+EXYNOS_PMU_IRQ(exynos4415_pmu_irq, "samsung,exynos4415-pmu");
+EXYNOS_PMU_IRQ(exynos5250_pmu_irq, "samsung,exynos5250-pmu");
+EXYNOS_PMU_IRQ(exynos5420_pmu_irq, "samsung,exynos5420-pmu");
+
 static int exynos_cpu_do_idle(void)
 {
 	/* issue the standby signal into the pm unit. */
@@ -615,17 +724,19 @@ static struct syscore_ops exynos_pm_syscore_ops;
 void __init exynos_pm_init(void)
 {
 	const struct of_device_id *match;
+	struct device_node *np;
 	u32 tmp;
 
-	of_find_matching_node_and_match(NULL, exynos_pmu_of_device_ids, &match);
-	if (!match) {
+	np = of_find_matching_node_and_match(NULL, exynos_pmu_of_device_ids, &match);
+	if (!np) {
 		pr_err("Failed to find PMU node\n");
 		return;
 	}
-	pm_data = (struct exynos_pm_data *) match->data;
 
-	/* Platform-specific GIC callback */
-	gic_arch_extn.irq_set_wake = exynos_irq_set_wake;
+	if (WARN_ON(!of_find_property(np, "interrupt-controller", NULL)))
+		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
+
+	pm_data = (struct exynos_pm_data *) match->data;
 
 	/* All wakeup disable */
 	tmp = pmu_raw_readl(S5P_WAKEUP_MASK);
