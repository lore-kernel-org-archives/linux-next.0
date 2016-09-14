From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Wed, 14 Sep 2016 23:38:49 +0200
Message-ID: <1813290.OlV7mnkH53@vostro.rjw.lan>
References: <20160914142747.1553f1c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:62588 "HELO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S1753312AbcINVcm (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Sep 2016 17:32:42 -0400
In-Reply-To: <20160914142747.1553f1c8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wednesday, September 14, 2016 02:27:47 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/devfreq/tegra-devfreq.c: In function 'tegra_devfreq_target':
> drivers/devfreq/tegra-devfreq.c:500:2: error: implicit declaration of function 'clk_set_min_rate' [-Werror=implicit-function-declaration]
>   clk_set_min_rate(tegra->emc_clock, rate);
>   ^
> 
> Caused by commit
> 
>   797da5598f3a ("PM / devfreq: Add COMPILE_TEST for build coverage")
> 
> clk_set_min_rate() usage depends on CONFIG_HAVE_CLK.
> 
> I added the following for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 Sep 2016 14:22:25 +1000
> Subject: [PATCH] partial revert of 797da5598f3a ("PM / devfreq: Add
>  COMPILE_TEST for build coverage")
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/devfreq/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index cadd56e50b2c..93b6ada06676 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -92,7 +92,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
>  
>  config ARM_TEGRA_DEVFREQ
>  	tristate "Tegra DEVFREQ Driver"
> -	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
> +	depends on ARCH_TEGRA_124_SOC
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	select PM_OPP
>  	help

I've just gone ahead and applied it.

Thanks Stephen!
