From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH v2] MFD: twl6040: Update Kconfig to avoid build breakage
Date: Fri, 08 Jun 2012 09:57:47 -0700
Message-ID: <4FD22F0B.6090908@xenotime.net>
References: <1339145661-25333-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339145661-25333-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, t-kristo@ti.com
List-Id: linux-next.vger.kernel.org

On 06/08/2012 01:54 AM, Peter Ujfalusi wrote:

> twl6040 needs CONFIG_IRQ_DOMAIN to compile, without this we have:
> drivers/mfd/twl6040-irq.c: In function 'twl6040_irq_init':
> drivers/mfd/twl6040-irq.c:164:2: error: implicit declaration of function 'irq_domain_add_legacy'
> drivers/mfd/twl6040-irq.c:165:11: error: 'irq_domain_simple_ops' undeclared (first use in this function)
> drivers/mfd/twl6040-irq.c:165:11: note: each undeclared identifier is reported only once for each function it appears in
> 
> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>


Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  drivers/mfd/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e129c82..92144ed 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -286,6 +286,7 @@ config TWL6040_CORE
>  	depends on I2C=y && GENERIC_HARDIRQS
>  	select MFD_CORE
>  	select REGMAP_I2C
> +	select IRQ_DOMAIN
>  	default n
>  	help
>  	  Say yes here if you want support for Texas Instruments TWL6040 audio



-- 
~Randy
