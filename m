From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: mfd tree build failure
Date: Wed, 6 Aug 2008 11:53:05 +0200
Message-ID: <20080806095304.GA6224@caravaggio>
References: <20080806000856.a5609577.sfr@canb.auug.org.au> <1217950794.18866.32.camel@wirenth> <20080806020540.c22b1fa0.sfr@canb.auug.org.au> <20080805160840.GC6335@caravaggio> <20080806021614.965a5389.sfr@canb.auug.org.au> <20080805174047.GE6335@caravaggio> <1217961978.18866.36.camel@wirenth>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:34382 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754412AbYHFJxL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2008 05:53:11 -0400
Content-Disposition: inline
In-Reply-To: <1217961978.18866.36.camel@wirenth>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ian <spyro@f2s.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, Aug 05, 2008 at 07:46:18PM +0100, ian wrote:
> On Tue, 2008-08-05 at 19:40 +0200, Samuel Ortiz wrote:
> > 
> > All TMIO devices depend on ARM, and the MMC and NAND drivers now
> > depend on a new symbol (MFD_TMIO) selected when choosing one of the
> > TMIO devices.
> 
> Sounds good.
> 
> Whens the merge date for mainline btw ?
Later this week, hopefully.

Cheers,
Samuel.
 
