From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: sparc64 build failure
Date: Fri, 30 May 2008 07:10:05 -0700
Message-ID: <20080530141005.GB26342@kroah.com>
References: <20080529175332.a12ad65d.sfr@canb.auug.org.au> <20080529220158.GA3867@kroah.com> <20080530153847.a5f3fd35.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:59388 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465AbYE3ONM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 May 2008 10:13:12 -0400
Content-Disposition: inline
In-Reply-To: <20080530153847.a5f3fd35.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Fri, May 30, 2008 at 03:38:47PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 29 May 2008 15:01:58 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > > -	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> > > +	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> > >  		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
> > 
> > It's wierd that we broke the build like this, I'll work to merge this in
> > so that it isn't broken.
> 
> It broke the build because arch/sparc64 is (mostly) built with -Werror.

Sorry, no, I realized that, I was confused as to why a warning was
created here.  Turns out that pci_name() was being changed to a const
string, and the compiler was rightfully saying that we can't be using
that for an assignment.

I've fixed it up correctly in my latest tree, which you should have
already.

thanks,

greg k-h
