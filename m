From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 5 Aug 2008 19:40:48 +0200
Message-ID: <20080805174047.GE6335@caravaggio>
References: <20080806000856.a5609577.sfr@canb.auug.org.au> <1217950794.18866.32.camel@wirenth> <20080806020540.c22b1fa0.sfr@canb.auug.org.au> <20080805160840.GC6335@caravaggio> <20080806021614.965a5389.sfr@canb.auug.org.au>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:44175 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759424AbYHERkx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 13:40:53 -0400
Content-Disposition: inline
In-Reply-To: <20080806021614.965a5389.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: ian <spyro@f2s.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Hi Stephen,

On Wed, Aug 06, 2008 at 02:16:14AM +1000, Stephen Rothwell wrote:
> On Tue, 5 Aug 2008 18:08:42 +0200 Samuel Ortiz <sameo@openedhand.com> wrote:
> >
> > :-) I'll take care of it, yep.
> 
> Thanks, I look forward to it.
It should be fixed by now.
All TMIO devices depend on ARM, and the MMC and NAND drivers now depend
on a new symbol (MFD_TMIO) selected when choosing one of the TMIO devices.

Cheers,
Samuel.
