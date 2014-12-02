From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the driver-core
 tree
Date: Tue, 2 Dec 2014 10:10:08 -0800
Message-ID: <20141202181008.GB11700@kroah.com>
References: <20141128173246.241262c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141128173246.241262c4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Chen <peter.chen@freescale.com>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 28, 2014 at 05:32:46PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/chipidea/core.c between commit 5bc879a6a271 ("usb:
> chipidea: drop owner assignment from platform_drivers") from the
> driver-core tree and commit 8076932ff2fc ("usb: chipidea: add system
> power management support") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/usb/chipidea/core.c
> index 947ed6e78be2,e14eafb2a05e..000000000000
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@@ -751,6 -867,8 +867,7 @@@ static struct platform_driver ci_hdrc_d
>   	.remove	= ci_hdrc_remove,
>   	.driver	= {
>   		.name	= "ci_hdrc",
> + 		.pm	= &ci_pm_ops,
>  -		.owner	= THIS_MODULE,
>   	},
>   };
>   

Looks good, thanks.

greg k-h
