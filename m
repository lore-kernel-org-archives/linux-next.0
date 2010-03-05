From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: sch_gpio: fix compilation warning "ignoring return value of
 gpiochip_remove"
Date: Fri, 5 Mar 2010 19:11:17 +0100
Message-ID: <20100305181117.GA5615@sortiz.org>
References: <20100303162252.e7cf0e43.sfr@canb.auug.org.au>
 <4B8E2CE9.3050001@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B8E2CE9.3050001@compulab.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: Denis Turischev <denis@compulab.co.il>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>
List-Id: linux-next.vger.kernel.org

Hi Denis,

On Wed, Mar 03, 2010 at 11:33:29AM +0200, Denis Turischev wrote:
> Signed-off-by: Denis Turischev <denis@compulab.co.il>
I modified this patch as you were leaking some resources releasing.

Cheers,
Samuel.

> ---
>  drivers/gpio/sch_gpio.c |   25 +++++++++++++++++++++----
>  1 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/sch_gpio.c b/drivers/gpio/sch_gpio.c
> index 761071a..a89c02d 100644
> --- a/drivers/gpio/sch_gpio.c
> +++ b/drivers/gpio/sch_gpio.c
> @@ -229,7 +229,12 @@ static int __devinit sch_gpio_probe(struct platform_device *pdev)
>  	return 0;
> 
>  err_sch_gpio_resume:
> -	gpiochip_remove(&sch_gpio_core);
> +	err = gpiochip_remove(&sch_gpio_core);
> +	if (err) {
> +		dev_err(&pdev->dev, "%s failed, %d\n",
> +				"gpiochip_remove()", err);
> +		return err;
> +	}
> 
>  err_sch_gpio_core:
>  	release_region(res->start, resource_size(res));
> @@ -240,11 +245,23 @@ err_sch_gpio_core:
> 
>  static int __devexit sch_gpio_remove(struct platform_device *pdev)
>  {
> +	int err_c, err_r;
>  	struct resource *res;
>  	if (gpio_ba) {
> -		gpiochip_remove(&sch_gpio_core);
> -		gpiochip_remove(&sch_gpio_resume);
> -
> +		err_c = gpiochip_remove(&sch_gpio_core);
> +		
> +		err_r = gpiochip_remove(&sch_gpio_resume);
> +
> +		if (err_c) {
> +			dev_err(&pdev->dev, "%s failed, %d\n",
> +					"gpiochip_remove()", err_c);
> +			return err_c;
> +		}
> +		if (err_r) {
> +			dev_err(&pdev->dev, "%s failed, %d\n",
> +					"gpiochip_remove()", err_r);
> +			return err_r;
> +		}
>  		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> 
>  		release_region(res->start, resource_size(res));
> -- 
> 1.6.3.3
> 

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
