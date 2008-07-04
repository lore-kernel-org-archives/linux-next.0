From: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH next-20080704] Fix compile error in drivers/net/mv643xx_eth.c
Date: Fri, 4 Jul 2008 18:49:55 +0200
Message-ID: <20080704164954.GA12106@xi.wantstofly.org>
References: <s5hr6a9k3uk.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xi.wantstofly.org ([83.160.184.112]:37453 "EHLO
	xi.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754444AbYGDQt5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 12:49:57 -0400
Content-Disposition: inline
In-Reply-To: <s5hr6a9k3uk.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 04, 2008 at 06:32:03PM +0200, Takashi Iwai wrote:

> drivers/net/mv643xx_eth.c: In function 'mv643xx_eth_netpoll':
> drivers/net/mv643xx_eth.c:2115: error: 'INT_CAUSE_EXT' undeclared (first use in this function)
> drivers/net/mv643xx_eth.c:2115: error: (Each undeclared identifier is reported only once
> drivers/net/mv643xx_eth.c:2115: error: for each function it appears in.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> ---
> diff --git a/drivers/net/mv643xx_eth.c b/drivers/net/mv643xx_eth.c
> index 83a877f..cb2c065 100644
> --- a/drivers/net/mv643xx_eth.c
> +++ b/drivers/net/mv643xx_eth.c
> @@ -2112,7 +2112,8 @@ static void mv643xx_eth_netpoll(struct net_device *dev)
>  
>  	mv643xx_eth_irq(dev->irq, dev);
>  
> -	wrl(mp, INT_MASK(mp->port_num), INT_TX_END | INT_RX | INT_CAUSE_EXT);
> +	wrl(mp, INT_MASK(mp->port_num),
> +	    INT_TX_END | INT_RX | INT_CAUSE_EXT(mp->port_num));

You are ORing the _address_ of the interrupt status register into
the interupt mask register.  How do you expect that to work?

This is the proper fix, which I will re-submit shortly:

	http://marc.info/?l=linux-kernel&m=121498695309851&w=2
