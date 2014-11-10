From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
Date: Mon, 10 Nov 2014 13:40:37 +0900
Message-ID: <20141110044037.GA17099@kroah.com>
References: <20141110151856.0b644fb3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141110151856.0b644fb3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Aaron Lu <aaron.lu@intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 10, 2014 at 03:18:56PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/input/keyboard/gpio_keys_polled.c between commit b26d4e2283b6
> ("input: gpio_keys_polled: Make use of device property API") from the
> pm tree and commit 1d05726c315c ("input: keyboard: drop owner
> assignment from platform_drivers") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/input/keyboard/gpio_keys_polled.c
> index c9c1c8ca7267,10f0098f3c77..000000000000
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@@ -297,8 -307,7 +297,7 @@@ static struct platform_driver gpio_keys
>   	.probe	= gpio_keys_polled_probe,
>   	.driver	= {
>   		.name	= DRV_NAME,
> - 		.owner	= THIS_MODULE,
>  -		.of_match_table = of_match_ptr(gpio_keys_polled_of_match),
>  +		.of_match_table = gpio_keys_polled_of_match,
>   	},
>   };
>   module_platform_driver(gpio_keys_polled_driver);


Looks good, thanks.

greg k-h
