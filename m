From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Tue, 06 Mar 2012 10:46:19 +0200
Message-ID: <4F55CEDB.90909@compulab.co.il>
References: <1330989122-6323-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 50.23.254.54-static.reverse.softlayer.com ([50.23.254.54]:54202
	"EHLO softlayer.compulab.co.il" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1758674Ab2CFIqd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 03:46:33 -0500
In-Reply-To: <1330989122-6323-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Haojian Zhuang <haojian.zhuang@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>

Also Cc: Haojian Zhuang <haojian.zhuang@marvell.com>

On 03/06/12 01:12, Paul Gortmaker wrote:
> Commit 737f360d5bef5e01c6cfa755dca0b449a154c1e0 (linux-next)
> 
>   "regulator: Remove support for supplies specified by struct device"
> 
> caused this file to break, since it was still relying on the
> device field to be present.  Strip them out here too.
> 
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

You've missed the scissors line:
---

The patch itself:

Acked-by: Igor Grinberg <grinberg@compulab.co.il>

Thanks

> 
> diff --git a/arch/arm/mach-pxa/em-x270.c b/arch/arm/mach-pxa/em-x270.c
> index d80c0ba..c8f3293 100644
> --- a/arch/arm/mach-pxa/em-x270.c
> +++ b/arch/arm/mach-pxa/em-x270.c
> @@ -1083,20 +1083,19 @@ static void __init em_x270_userspace_consumers_init(void)
>  }
>  
>  /* DA9030 related initializations */
> -#define REGULATOR_CONSUMER(_name, _dev, _supply)			       \
> +#define REGULATOR_CONSUMER(_name, _supply)			       \
>  	static struct regulator_consumer_supply _name##_consumers[] = {	\
>  		{							\
> -			.dev = _dev,					\
>  			.supply = _supply,				\
>  		},							\
>  	}
>  
> -REGULATOR_CONSUMER(ldo3, &em_x270_gps_userspace_consumer.dev, "vcc gps");
> -REGULATOR_CONSUMER(ldo5, NULL, "vcc cam");
> -REGULATOR_CONSUMER(ldo10, &pxa_device_mci.dev, "vcc sdio");
> -REGULATOR_CONSUMER(ldo12, NULL, "vcc usb");
> -REGULATOR_CONSUMER(ldo19, &em_x270_gprs_userspace_consumer.dev, "vcc gprs");
> -REGULATOR_CONSUMER(buck2, NULL, "vcc_core");
> +REGULATOR_CONSUMER(ldo3, "vcc gps");
> +REGULATOR_CONSUMER(ldo5, "vcc cam");
> +REGULATOR_CONSUMER(ldo10, "vcc sdio");
> +REGULATOR_CONSUMER(ldo12, "vcc usb");
> +REGULATOR_CONSUMER(ldo19, "vcc gprs");
> +REGULATOR_CONSUMER(buck2, "vcc_core");
>  
>  #define REGULATOR_INIT(_ldo, _min_uV, _max_uV, _ops_mask)		\
>  	static struct regulator_init_data _ldo##_data = {		\

-- 
Regards,
Igor.
