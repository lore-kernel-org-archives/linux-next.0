From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the irqchip tree with Linus' tree
Date: Mon, 13 Apr 2015 11:18:52 +0200
Message-ID: <CAMuHMdVgN3f4kQYVcK7VAJ4DbH23vW_Pkc+DeKk5bejFET9UCA@mail.gmail.com>
References: <20150316144727.488070cb@canb.auug.org.au>
	<5506989D.9050703@arm.com>
	<20150318175208.GC15137@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318175208.GC15137@io.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 18, 2015 at 6:52 PM, Jason Cooper <jason@lakedaemon.net> wrote:
> --- a/arch/arm/mach-exynos/suspend.c
> +++ b/arch/arm/mach-exynos/suspend.c
> @@ -615,17 +724,19 @@ static struct syscore_ops exynos_pm_syscore_ops;
>  void __init exynos_pm_init(void)
>  {
>         const struct of_device_id *match;
> +       struct device_node *np;
>         u32 tmp;
>
> -       of_find_matching_node_and_match(NULL, exynos_pmu_of_device_ids, &match);
> -       if (!match) {
> +       np = of_find_matching_node_and_match(NULL, exynos_pmu_of_device_ids, &match);
> +       if (!np) {
>                 pr_err("Failed to find PMU node\n");
>                 return;
>         }
> -       pm_data = (struct exynos_pm_data *) match->data;
>
> -       /* Platform-specific GIC callback */
> -       gic_arch_extn.irq_set_wake = exynos_irq_set_wake;
> +       if (WARN_ON(!of_find_property(np, "interrupt-controller", NULL)))
> +               pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
> +
> +       pm_data = (struct exynos_pm_data *) match->data;

Upon first look, the cast above should be "const".
Upon second look, the cast is not needed at all (assigning "const void *"
to "const struct exynos_pm_data *").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
