From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the l2-mtd
 tree
Date: Mon, 10 Nov 2014 13:39:33 +0900
Message-ID: <20141110043933.GB25797@kroah.com>
References: <20141110152801.221c4f5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141110152801.221c4f5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 10, 2014 at 03:28:01PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mtd/devices/docg3.c between commit a59459f29fb7 ("mtd: docg3:
> add device-tree support") from the l2-mtd tree and commit c37c1e160546
> ("mtd: devices: drop owner assignment from platform_drivers") from the
> driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/mtd/devices/docg3.c
> index 0d9d3ee68b61,72346048532d..000000000000
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@@ -2130,8 -2129,6 +2130,7 @@@ MODULE_DEVICE_TABLE(of, docg3_dt_ids)
>   static struct platform_driver g3_driver = {
>   	.driver		= {
>   		.name	= "docg3",
> - 		.owner	= THIS_MODULE,
>  +		.of_match_table = of_match_ptr(docg3_dt_ids),
>   	},
>   	.suspend	= docg3_suspend,
>   	.resume		= docg3_resume,


Looks good, thanks.

greg k-h
