From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the samsung tree with the  tree
Date: Fri, 23 May 2014 11:02:16 +0900
Message-ID: <017b01cf762b$05576a80$10063f80$@samsung.com>
References: <20140523112003.3da4b5f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18200 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaEWCCT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 May 2014 22:02:19 -0400
In-reply-to: <20140523112003.3da4b5f5@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Russell King' <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Sachin Kamat' <sachin.kamat@linaro.org>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi Stephen,

> Today's linux-next merge of the samsung tree got a conflict in
> arch/arm/mach-exynos/exynos.c between commit 46bfc99c9225 ("ARM: l2c:
> exynos: convert to generic l2c OF initialisation (and thereby fix it)")
> from the arm tree and commit 3919fb954b3a ("ARM: EXYNOS: Remove
> exynos_subsys registration") from the samsung tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
Looks good to me, thanks.

- Kukjin

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/mach-exynos/exynos.c
> index afce154f83f9,93507ee98c86..000000000000
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@@ -241,17 -246,22 +243,6 @@@ void __init exynos_init_io(void
>   	exynos_map_io();
>   }
> 
> - struct bus_type exynos_subsys = {
> - 	.name		= "exynos-core",
> - 	.dev_name	= "exynos-core",
> - };
> -
> - static int __init exynos_core_init(void)
>  -static int __init exynos4_l2x0_cache_init(void)
> --{
> - 	return subsys_system_register(&exynos_subsys, NULL);
>  -	int ret;
>  -
>  -	ret = l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
>  -	if (ret)
>  -		return ret;
>  -
>  -	if (IS_ENABLED(CONFIG_S5P_SLEEP)) {
>  -		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
>  -		clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
>  -	}
>  -	return 0;
> --}
> - core_initcall(exynos_core_init);
>  -early_initcall(exynos4_l2x0_cache_init);
> --
>   static void __init exynos_dt_machine_init(void)
>   {
>   	struct device_node *i2c_np;
