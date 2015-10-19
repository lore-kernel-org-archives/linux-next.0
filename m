From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the omap tree
Date: Mon, 19 Oct 2015 11:59:08 +1100
Message-ID: <20151019115908.7f4d59d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tony Lindgren <tony@atomide.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <Marc.Zyngier@arm.com>, Felipe Balbi <balbi@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  arch/arm/mach-omap2/timer.c

between commits:

  3afbb9afe2c4 ("arm: omap2: timer: move realtime_counter_init() around")
  9c46ffcd5214 ("arm: omap2: timer: always call clocksource_of_init() when DT")

from the omap tree and commit:

  3722ed2380ad ("clocksource: cosmetic: Drop OF 'dependency' from symbols")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-omap2/timer.c
index 05c17eb2f2d9,bef41837bf7f..000000000000
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@@ -469,64 -476,7 +469,64 @@@ static void __init omap2_gptimer_clocks
  			clocksource_gpt.name, clksrc.rate);
  }
  
 -#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 +static void __init __omap_sync32k_timer_init(int clkev_nr, const char *clkev_src,
 +		const char *clkev_prop, int clksrc_nr, const char *clksrc_src,
 +		const char *clksrc_prop, bool gptimer)
 +{
 +	omap_clk_init();
 +	omap_dmtimer_init();
 +	omap2_gp_clockevent_init(clkev_nr, clkev_src, clkev_prop);
 +
 +	/* Enable the use of clocksource="gp_timer" kernel parameter */
 +	if (use_gptimer_clksrc || gptimer)
 +		omap2_gptimer_clocksource_init(clksrc_nr, clksrc_src,
 +						clksrc_prop);
 +	else
 +		omap2_sync32k_clocksource_init();
 +}
 +
 +void __init omap_init_time(void)
 +{
 +	__omap_sync32k_timer_init(1, "timer_32k_ck", "ti,timer-alwon",
 +			2, "timer_sys_ck", NULL, false);
 +
 +	if (of_have_populated_dt())
- 		clocksource_of_init();
++		clocksource_probe();
 +}
 +
 +#if defined(CONFIG_ARCH_OMAP3) || defined(CONFIG_SOC_AM43XX)
 +void __init omap3_secure_sync32k_timer_init(void)
 +{
 +	__omap_sync32k_timer_init(12, "secure_32k_fck", "ti,timer-secure",
 +			2, "timer_sys_ck", NULL, false);
 +}
 +#endif /* CONFIG_ARCH_OMAP3 */
 +
 +#if defined(CONFIG_ARCH_OMAP3) || defined(CONFIG_SOC_AM33XX)
 +void __init omap3_gptimer_timer_init(void)
 +{
 +	__omap_sync32k_timer_init(2, "timer_sys_ck", NULL,
 +			1, "timer_sys_ck", "ti,timer-alwon", true);
 +}
 +#endif
 +
 +#if defined(CONFIG_ARCH_OMAP4) || defined(CONFIG_SOC_OMAP5) ||		\
 +	defined(CONFIG_SOC_DRA7XX) || defined(CONFIG_SOC_AM43XX)
 +static void __init omap4_sync32k_timer_init(void)
 +{
 +	__omap_sync32k_timer_init(1, "timer_32k_ck", "ti,timer-alwon",
 +			2, "sys_clkin_ck", NULL, false);
 +}
 +
 +void __init omap4_local_timer_init(void)
 +{
 +	omap4_sync32k_timer_init();
- 	clocksource_of_init();
++	clocksource_probe();
 +}
 +#endif
 +
 +#if defined(CONFIG_SOC_OMAP5) || defined(CONFIG_SOC_DRA7XX)
 +
  /*
   * The realtime counter also called master counter, is a free-running
   * counter, which is related to real time. It produces the count used
