From: Joseph Fannin <jfannin@gmail.com>
Subject: Re: inux-next 0701 mv643xx_eth powerpc build failure
Date: Thu, 3 Jul 2008 08:38:28 -0400
Message-ID: <20080703123828.GA1631@nineveh.local>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au> <20080702031111.GA26752@nineveh.local> <20080702082117.GA18989@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.177]:8237 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757219AbYGCMjL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 08:39:11 -0400
Received: by py-out-1112.google.com with SMTP id p76so408976pyb.10
        for <linux-next@vger.kernel.org>; Thu, 03 Jul 2008 05:39:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080702082117.GA18989@xi.wantstofly.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jul 02, 2008 at 10:21:18AM +0200, Lennert Buytenhek wrote:
> On Tue, Jul 01, 2008 at 11:11:12PM -0400, Joseph Fannin wrote:
>
> > I'm getting a build failure on 32bit powerpc in -next, but not in mainline:
> >
> > drivers/net/mv643xx_eth.c: In function 'mv643xx_eth_netpoll':
> > drivers/net/mv643xx_eth.c:2115: error: 'INT_CAUSE_EXT' undeclared
> > (first use in this function)
> > drivers/net/mv643xx_eth.c:2115: error: (Each undeclared identifier is
> > reported only once
> > drivers/net/mv643xx_eth.c:2115: error: for each function it appears in.)
>
> Does this fix it for you?

  Yes, it builds fine.  Thanks.

>
> Index: linux-2.6.26-rc8/drivers/net/mv643xx_eth.c
> ===================================================================
> --- linux-2.6.26-rc8.orig/drivers/net/mv643xx_eth.c
> +++ linux-2.6.26-rc8/drivers/net/mv643xx_eth.c
> @@ -2184,7 +2184,7 @@ static void mv643xx_eth_netpoll(struct n
>
>  	mv643xx_eth_irq(dev->irq, dev);
>
> -	wrl(mp, INT_MASK(mp->port_num), INT_TX_END | INT_RX | INT_CAUSE_EXT);
> +	wrl(mp, INT_MASK(mp->port_num), INT_TX_END | INT_RX | INT_EXT);
>  }
>  #endif
>
>
>
> > I haven't investigated any further than a quick check if this hardware
> > even makes sense on 32bit powerpc -- it seems it does.
>
> It does -- it is used on ARM, PPC and MIPS.

--
Joseph Fannin
jfannin@gmail.com
