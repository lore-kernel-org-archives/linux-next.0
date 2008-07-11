From: Jeff Garzik <jeff@garzik.org>
Subject: Re: [PATCH linux-next-20080704] Fix missing exports for net/phy/mdio-bitbang.c
Date: Fri, 11 Jul 2008 01:22:31 -0400
Message-ID: <4876EE17.5050800@garzik.org>
References: <s5hlk0dwxvi.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from srv5.dvmed.net ([207.36.208.214]:49699 "EHLO mail.dvmed.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752562AbYGKFWl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 01:22:41 -0400
In-Reply-To: <s5hlk0dwxvi.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Laurent Pinchart <laurentp@cse-semaphore.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Takashi Iwai wrote:
> {alloc,free}_mdio_bitbang() are not exported while they are used in
> mdio-ofgpio driver.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> ---
> diff --git a/drivers/net/phy/mdio-bitbang.c b/drivers/net/phy/mdio-bitbang.c
> index 2747b1f..c01b780 100644
> --- a/drivers/net/phy/mdio-bitbang.c
> +++ b/drivers/net/phy/mdio-bitbang.c
> @@ -177,6 +177,7 @@ struct mii_bus *alloc_mdio_bitbang(struct mdiobb_ctrl *ctrl)
>  
>  	return bus;
>  }
> +EXPORT_SYMBOL(alloc_mdio_bitbang);
>  
>  void free_mdio_bitbang(struct mii_bus *bus)
>  {
> @@ -185,5 +186,6 @@ void free_mdio_bitbang(struct mii_bus *bus)
>  	module_put(ctrl->ops->owner);
>  	kfree(bus);
>  }
> +EXPORT_SYMBOL(free_mdio_bitbang);
>  
>  MODULE_LICENSE("GPL");

applied
