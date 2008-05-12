From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure
Date: Mon, 12 May 2008 09:50:20 -0700
Message-ID: <20080512165020.GB7721@kroah.com>
References: <20080512154717.2d0947f0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:42180 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753548AbYELQyC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 May 2008 12:54:02 -0400
Content-Disposition: inline
In-Reply-To: <20080512154717.2d0947f0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, David Miller <davem@davemloft.net>

On Mon, May 12, 2008 at 03:47:17PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (sparc64 defconfig) fails like this:
> 
> arch/sparc64/kernel/pci.c: In function `of_create_pci_dev':
> arch/sparc64/kernel/pci.c:412: warning: passing arg 1 of `sprintf' discards qualifiers from pointer target type
> make[2]: *** [arch/sparc64/kernel/pci.o] Error 1
> 
> (I assume sparc64 builds with -Werr)
> 
> This started on May 8 with the introduction of "driver-core: prepare for
> removal of 20 char limit from struct device".
> 
> The sparc64 pci code above looks like this:
> 
> 	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> 		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));

This is my fault, I've dropped the offending patch from my queue right
now, will add it back in when I have the cross-compilers set up locally
to prevent this from happening in the future.

My appologies,

greg k-h
