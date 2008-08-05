From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 5 Aug 2008 18:08:42 +0200
Message-ID: <20080805160840.GC6335@caravaggio>
References: <20080806000856.a5609577.sfr@canb.auug.org.au> <1217950794.18866.32.camel@wirenth> <20080806020540.c22b1fa0.sfr@canb.auug.org.au>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:36739 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760855AbYHEQIs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 12:08:48 -0400
Content-Disposition: inline
In-Reply-To: <20080806020540.c22b1fa0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: ian <spyro@f2s.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Wed, Aug 06, 2008 at 02:05:40AM +1000, Stephen Rothwell wrote:
> Hi Ian,
> 
> On Tue, 05 Aug 2008 16:39:54 +0100 ian <spyro@f2s.com> wrote:
> >
> > I'd have expected the other TMIO drivers to fail too.
> > 
> > get_irq_data is defined in linux/irq.h only if 
> > 
> > CONFIG_GENERIC_HARDIRQs is set and you arent on S390 (so why doesnt S390
> > fail?)
> > 
> > I dont see this as a big problem. As far as Im concerned, all the TMIO
> > drivers can depend on CONFIG_ARM.
> > 
> > It may not be a bad idea to add CONFIG_MFD_TMIO_SUBDEVICE so that TMIO
> > sub device drivers can only be selected when TMIO cores are selected.
> > This would neatly fix the earlier problem, rather than making al lthe
> > subdevices CONFIG_ARM.
> 
> It'd be real nice if someone did a patch to that effect :-)
:-) I'll take care of it, yep.

Cheers,
Samuel.
