From: Jose Rivera <german.rivera@nxp.com>
Subject: RE: linux-next: manual merge of the staging tree with the tip tree
Date: Wed, 2 Mar 2016 17:53:30 +0000
Message-ID: <VI1PR04MB1184697C38CA3BB034D4CFAEF4BC0@VI1PR04MB1184.eurprd04.prod.outlook.com>
References: <20160302143506.5f75d279@canb.auug.org.au>
 <alpine.DEB.2.11.1603020853460.3638@nanos> <20160302174335.GA24233@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-am1on0088.outbound.protection.outlook.com ([157.56.112.88]:3344
	"EHLO emea01-am1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750745AbcCBT0Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Mar 2016 14:26:24 -0500
In-Reply-To: <20160302174335.GA24233@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "J. German Rivera" <German.Rivera@freescale.com>, Qais Yousef <qais.yousef@imgtec.com>

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Wednesday, March 02, 2016 11:44 AM
> To: Thomas Gleixner <tglx@linutronix.de>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>; Ingo Molnar
> <mingo@elte.hu>; H. Peter Anvin <hpa@zytor.com>; Peter Zijlstra
> <peterz@infradead.org>; linux-next@vger.kernel.org; linux-
> kernel@vger.kernel.org; J. German Rivera <German.Rivera@freescale.com>;
> Qais Yousef <qais.yousef@imgtec.com>
> Subject: Re: linux-next: manual merge of the staging tree with the tip tree
> 
> On Wed, Mar 02, 2016 at 08:54:39AM +0100, Thomas Gleixner wrote:
> > On Wed, 2 Mar 2016, Stephen Rothwell wrote:
> > > Hi Greg,
> > >
> > > Today's linux-next merge of the staging tree got a conflict in:
> > >
> > >   include/linux/irqdomain.h
> > >
> > > between commit:
> > >
> > >   29d5c8db26ad ("genirq: Add DOMAIN_BUS_IPI")
> > >
> > > from the tip tree and commit:
> > >
> > >   9b1b282ccd81 ("irqdomain: Added domain bus token
> > > DOMAIN_BUS_FSL_MC_MSI")
> > >
> > > from the staging tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary (no
> > > action is required).
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> > >
> > > diff --cc include/linux/irqdomain.h
> > > index ed48594e96d2,0934d06c8b00..000000000000
> > > --- a/include/linux/irqdomain.h
> > > +++ b/include/linux/irqdomain.h
> > > @@@ -74,7 -74,7 +74,8 @@@ enum irq_domain_bus_token
> > >   	DOMAIN_BUS_PCI_MSI,
> > >   	DOMAIN_BUS_PLATFORM_MSI,
> > >   	DOMAIN_BUS_NEXUS,
> > >  +	DOMAIN_BUS_IPI,
> > > + 	DOMAIN_BUS_FSL_MC_MSI,
> >
> > Errm. What's that? Did that DOMAIN_BUS_FSL_MC_MSI thingy get any
> > review of the irq[domain] maintainers?
> 
> For some reason I thought it did, but in looking at the patch series, it doesn't
> seem like that happened :(
> 
> The patch series started with this message id on lkml:
> 	Message-ID: <1452117809-1870-1-git-send-email-
> German.Rivera@freescale.com>
> 
> German, any reason why you didn't cc: the irqdomain people on this series?
> 

This series was reviewed by Jiang Liu <jiang.liu@linux.intel.com>
and Marc Zyngier <marc.zyngier@arm.com>. I apologize if I
overlooked to CC Thomas as well.

Thanks,

German

> Thomas, should I revert the series until you have a chance to ack it?
> 
> thanks,
> 
> greg k-h
