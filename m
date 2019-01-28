From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: Re: [PATCH] extcon: Fix build issues in ptn5150
Date: Mon, 28 Jan 2019 12:40:59 +0530
Message-ID: <20190128071059.GA32040@chikyu>
References: <88f71303-575e-6680-a207-da102bda8ef2@infradead.org>
 <1548650292-15762-1-git-send-email-vijaikumar.kanagarajan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548650292-15762-1-git-send-email-vijaikumar.kanagarajan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: rdunlap@infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jan 28, 2019 at 10:08:12AM +0530, Vijai Kumar K wrote:
I was wondering, what is the normal procedure in the below case
when the build fails because of the driver.
Should I send a new patch as a whole [PATCH v3] for the driver
or should I send a new patch to fix the issue like below.

Thanks,
Vijai Kumar K
> - extcon-ptn5150 driver uses gpio libraries
> - Add GPIOLIB in depends section of Kconfig
> 
> Error:
> -----
> >   CC      drivers/extcon/extcon-ptn5150.o
> > ../drivers/extcon/extcon-ptn5150.c: In function ‘ptn5150_irq_work’:
> > ../drivers/extcon/extcon-ptn5150.c:130:5: error: implicit declaration of function ‘gpiod_set_value’ [-Werror=implicit-function-declaration]
> >      gpiod_set_value(info->vbus_gpiod, 0);
> >      ^
> > ../drivers/extcon/extcon-ptn5150.c: In function ‘ptn5150_i2c_probe’:
> > ../drivers/extcon/extcon-ptn5150.c:242:2: error: implicit declaration of function ‘devm_gpiod_get’ [-Werror=implicit-function-declaration]
> >   info->int_gpiod = devm_gpiod_get(&i2c->dev, "int", GPIOD_IN);
> >   ^
> > ../drivers/extcon/extcon-ptn5150.c:242:53: error: ‘GPIOD_IN’ undeclared (first use in this function)
> >   info->int_gpiod = devm_gpiod_get(&i2c->dev, "int", GPIOD_IN);
> >                                                      ^
> > ../drivers/extcon/extcon-ptn5150.c:242:53: note: each undeclared identifier is reported only once for each function it appears in
> > ../drivers/extcon/extcon-ptn5150.c:252:2: error: implicit declaration of function ‘gpiod_direction_output’ [-Werror=implicit-function-declaration]
> >   ret = gpiod_direction_output(info->vbus_gpiod, 0);
> >   ^
> > ../drivers/extcon/extcon-ptn5150.c:271:3: error: implicit declaration of function ‘gpiod_to_irq’ [-Werror=implicit-function-declaration]
> >    info->irq = gpiod_to_irq(info->int_gpiod);
> -----
> 
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>  drivers/extcon/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index b9cc027..330dd8b 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -116,7 +116,7 @@ config EXTCON_PALMAS
>  
>  config EXTCON_PTN5150
>  	tristate "NXP PTN5150 CC LOGIC USB EXTCON support"
> -	depends on I2C
> +	depends on I2C && GPIOLIB
>  	select REGMAP_I2C
>  	help
>  	  Say Y here to enable support for USB peripheral and USB host
> -- 
> 2.7.4
> 
