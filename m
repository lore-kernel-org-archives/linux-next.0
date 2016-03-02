From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tip tree
Date: Wed, 2 Mar 2016 09:43:35 -0800
Message-ID: <20160302174335.GA24233@kroah.com>
References: <20160302143506.5f75d279@canb.auug.org.au>
 <alpine.DEB.2.11.1603020853460.3638@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59586 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751062AbcCBRni (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Mar 2016 12:43:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 67167209B1
	for <linux-next@vger.kernel.org>; Wed,  2 Mar 2016 12:43:37 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1603020853460.3638@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "J. German Rivera" <German.Rivera@freescale.com>, Qais Yousef <qais.yousef@imgtec.com>

On Wed, Mar 02, 2016 at 08:54:39AM +0100, Thomas Gleixner wrote:
> On Wed, 2 Mar 2016, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next merge of the staging tree got a conflict in:
> > 
> >   include/linux/irqdomain.h
> > 
> > between commit:
> > 
> >   29d5c8db26ad ("genirq: Add DOMAIN_BUS_IPI")
> > 
> > from the tip tree and commit:
> > 
> >   9b1b282ccd81 ("irqdomain: Added domain bus token DOMAIN_BUS_FSL_MC_MSI")
> > 
> > from the staging tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc include/linux/irqdomain.h
> > index ed48594e96d2,0934d06c8b00..000000000000
> > --- a/include/linux/irqdomain.h
> > +++ b/include/linux/irqdomain.h
> > @@@ -74,7 -74,7 +74,8 @@@ enum irq_domain_bus_token 
> >   	DOMAIN_BUS_PCI_MSI,
> >   	DOMAIN_BUS_PLATFORM_MSI,
> >   	DOMAIN_BUS_NEXUS,
> >  +	DOMAIN_BUS_IPI,
> > + 	DOMAIN_BUS_FSL_MC_MSI,
> 
> Errm. What's that? Did that DOMAIN_BUS_FSL_MC_MSI thingy get any review of the
> irq[domain] maintainers?

For some reason I thought it did, but in looking at the patch series, it
doesn't seem like that happened :(

The patch series started with this message id on lkml:
	Message-ID: <1452117809-1870-1-git-send-email-German.Rivera@freescale.com>

German, any reason why you didn't cc: the irqdomain people on this
series?

Thomas, should I revert the series until you have a chance to ack it?

thanks,

greg k-h
