From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: mmc/driver-core merge conflict
Date: Mon, 16 Jun 2008 20:15:00 -0700
Message-ID: <20080617031500.GB1088@kroah.com>
References: <20080606155655.b72cff0d.sfr@canb.auug.org.au> <20080609091452.5240892b@mjolnir.drzeus.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:59458 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753485AbYFQDTg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jun 2008 23:19:36 -0400
Content-Disposition: inline
In-Reply-To: <20080609091452.5240892b@mjolnir.drzeus.cx>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Anton Vorontsov <avorontsov@ru.mvista.com>

On Mon, Jun 09, 2008 at 09:14:52AM +0200, Pierre Ossman wrote:
> On Fri, 6 Jun 2008 15:56:55 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Pierre, Greg,
> > 
> > Today's linux-next merge of the mmc tree got a conflict in
> > drivers/mmc/host/mmc_spi.c between commit
> > b16fa5e051064488f241647a080271f1cd41d077 ("driver-core: prepare for
> > removal of 20 char limit from struct device") from the driver-core tree
> > and commit cd3c93fe826def37abc474e7a91bbf56444d7cd0 ("mmc_spi: add
> > support for card-detection polling") from the mmc tree.
> > 
> > I fixed it up in the obvious manner.  Could be fixed by moving the
> > drivers/mmc/host/mmc_spi.c part of the driver-core change to the mmc
> > tree ...
> > 
> 
> Sounds good to me. Greg, can you separate out that portion?

Yes, we will be doing this.  Right now that patch is dropped from the
linux-next tree.

thanks,

greg k-h
