From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: sparc64 build failure
Date: Thu, 29 May 2008 15:01:58 -0700
Message-ID: <20080529220158.GA3867@kroah.com>
References: <20080529175332.a12ad65d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:32996 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbYE2WDd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 18:03:33 -0400
Content-Disposition: inline
In-Reply-To: <20080529175332.a12ad65d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Thu, May 29, 2008 at 05:53:32PM +1000, Stephen Rothwell wrote:
> Hi Dave, Greg,
> 
> Today's build of linux-next (sparc64 defconfig) failed like this:
> 
> arch/sparc64/kernel/pci.c: In function `of_create_pci_dev':
> arch/sparc64/kernel/pci.c:412: warning: passing arg 1 of `sprintf' discards qualifiers from pointer target type
> make[2]: *** [arch/sparc64/kernel/pci.o] Error 1
> 
> This was caused by commit bd24b944eb93549b1ca5becbf27c7373504f7eed
> ("driver-core: prepare for removal of 20 char limit from struct device")
> from the driver-core tree which made pci_name() return a "const char *".
> 
> I have applied the following patch.
> 
> Greg, it would really help if a version of dev_set_name() was created
> early ... like in Linus' tree now?

I'm trying to do that right now, but it's causing a little oops at boot
time that would not be nice to introduce so late in the game :)

We're working on it.

> >From eee5cd99ea3b4e93f41e7f6486d799d198c87750 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 May 2008 17:51:05 +1000
> Subject: [PATCH] sparc: fallout from pci_name() constifying
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/sparc64/kernel/pci.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/sparc64/kernel/pci.c b/arch/sparc64/kernel/pci.c
> index 112b09f..5509619 100644
> --- a/arch/sparc64/kernel/pci.c
> +++ b/arch/sparc64/kernel/pci.c
> @@ -408,7 +408,7 @@ struct pci_dev *of_create_pci_dev(struct pci_pbm_info *pbm,
>  	dev->class = class >> 8;
>  	dev->revision = class & 0xff;
>  
> -	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> +	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
>  		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));

It's wierd that we broke the build like this, I'll work to merge this in
so that it isn't broken.

thanks,

greg k-h
