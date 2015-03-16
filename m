From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the irqchip tree with Linus' tree
Date: Mon, 16 Mar 2015 08:47:25 +0000
Message-ID: <5506989D.9050703@arm.com>
References: <20150316144727.488070cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55790 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752639AbbCPIr2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2015 04:47:28 -0400
In-Reply-To: <20150316144727.488070cb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Cooper <jason@lakedaemon.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Stephen, Jason,

On 16/03/15 03:47, Stephen Rothwell wrote:
> Hi Jason,
> 
> Today's linux-next merge of the irqchip tree got a conflict in
> arch/arm/mach-exynos/suspend.c between commit ace283a04a4a ("ARM:
> EXYNOS: Fix wrong hwirq of RTC interrupt for Exynos3250 SoC") from
> Linus' tree and commit be42c9ea7b5f ("ARM: exynos4/5: convert pmu
> wakeup to stacked domains") from the irqchip tree.
> 
> I fixed it up (I just randomly chose to use the irqchip tree version)
> and can carry the fix as necessary (no action is required).
> 

Actually, the fix is slightly less obvious, mostly because I introduced
a bug while converting the code to stacked domains. I noticed that
something was amiss in the Exynos code, but fixed it the wrong way
(I assumed the DT was wrong, while it was the code).

Now, in the light of ace283a04a4a, the fix should be:

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 554e9be..580b2109 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -186,7 +186,7 @@
 		rtc: rtc@10070000 {
 			compatible = "samsung,exynos3250-rtc";
 			reg = <0x10070000 0x100>;
-			interrupts = <0 41 0>, <0 42 0>;
+			interrupts = <0 73 0>, <0 74 0>;
 			interrupt-parent = <&pmu_system_controller>;
 			status = "disabled";
 		};
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 891e431..7b09e76 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -89,8 +89,8 @@ static unsigned int exynos_pmu_spare3;
 static u32 exynos_irqwake_intmask = 0xffffffff;
 
 static const struct exynos_wkup_irq exynos3250_wkup_irq[] = {
-	{ 41, BIT(1) }, /* RTC alarm */
-	{ 42, BIT(2) }, /* RTC tick */
+	{ 73, BIT(1) }, /* RTC alarm */
+	{ 74, BIT(2) }, /* RTC tick */
 	{ /* sentinel */ },
 };
 
Jason, any chance you could apply this on top of be42c9ea7b5f? We'll still
have a conflict when the two branches get merged, but at least we'll know
what the resolution is.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
