From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Thu, 10 Jul 2008 16:59:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807101654080.6791@localhost.localdomain>
References: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0807071424240.6791@localhost.localdomain>
 <1215473798.8138.4.camel@localhost>  <Pine.LNX.4.64.0807080437550.6791@localhost.localdomain>
 <1215651082.13950.7.camel@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-vbr11.xs4all.nl ([194.109.24.31]:1098 "EHLO
	smtp-vbr11.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755237AbYGJPAY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jul 2008 11:00:24 -0400
In-Reply-To: <1215651082.13950.7.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Mackerras <paulus@samba.org>, linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linuxppc-dev@ozlabs.org

Hi,

On Thu, 10 Jul 2008, Michael Ellerman wrote:

> Well yes :)  But I think that's because you're thinking of 
> "end-users" and I'm thinking of "users" like myself - ie. _I_ use
> Kconfig and I do expect myself to be able to type a 64-bit address.

That doesn't really answer my question, why you need this.

> > > --- .config.orig	2008-07-08 09:30:00.000000000 +1000
> > > +++ .config	2008-07-08 09:30:43.000000000 +1000
> > > @@ -370,9 +370,8 @@
> > >  CONFIG_HOTPLUG_PCI_RPA=m
> > >  CONFIG_HOTPLUG_PCI_RPA_DLPAR=m
> > >  # CONFIG_HAS_RAPIDIO is not set
> > > -CONFIG_PAGE_OFFSET=0xc000000000000000
> > > -CONFIG_KERNEL_START=0xc000000002000000
> > > -CONFIG_PHYSICAL_START=0x02000000
> > > +CONFIG_PAGE_OFFSET=0xc0000000
> > > +CONFIG_PHYSICAL_START=0x2000000
> > 
> > Why is this worse? These are constants, you're not supposed to change them 
> > anyway.
> > The remaining values are generated in page.h and should be the same as 
> > before. If that isn't the case and this patch produces a nonworking 
> > kernel, I'd like to hear about it.
> 
> You're right the built kernel is fine. So it's not a bug,

Good, could someone please ack whether the powerpc changes are acceptable?

> but I think it is nicer to have the real values in the .config.

Why?

bye, Roman
