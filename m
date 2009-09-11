From: Greg KH <greg@kroah.com>
Subject: Re: drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined
 from 'boolean' to 'tristate'
Date: Fri, 11 Sep 2009 09:44:28 -0700
Message-ID: <20090911164428.GA17883@kroah.com>
References: <10f740e80909110726x313e3e3coe2321c683163e3a5@mail.gmail.com>
 <20090911150210.GB16593@kroah.com>
 <4AAA7AEB.803@gefanuc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:60934 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751679AbZIKQqq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Sep 2009 12:46:46 -0400
Content-Disposition: inline
In-Reply-To: <4AAA7AEB.803@gefanuc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martyn Welch <martyn.welch@gefanuc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

On Fri, Sep 11, 2009 at 05:29:31PM +0100, Martyn Welch wrote:
> Greg KH wrote:
> > On Fri, Sep 11, 2009 at 04:26:36PM +0200, Geert Uytterhoeven wrote:
> >   
> >> http://kisskb.ellerman.id.au/kisskb/buildresult/1221192/:
> >> drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
> >> 'boolean' to 'tristate'
> >> drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
> >> 'boolean' to 'tristate'
> >>
> >> We already have:
> >>
> >> arch/m68k/Kconfig:config VME
> >> arch/m68k/Kconfig:      bool "VME (Motorola and BVM) support"
> >> arch/m68k/Kconfig:        Say Y here if you want to build a kernel for
> >> a 680x0 based VME
> >>     
> >
> > Ah, not good.
> >
> > Are these a board-specific thing?  It's not the "VME bus" is it?
> >
> > Martyn, maybe we should rename CONFIG_VME to CONFIG_VME_BUS ?
> >
> > thanks,
> >
> > greg k-h
> >   
> Agreed - Not good.
> 
> I'll try and rustle up a patch ASAP, but it might not be until Monday 
> now - I unfortunately have a rather busy weekend. I'm more than happy 
> with CONFIG_VME_BUS if someone beats me to it.

I'll go do it right now.

thanks,

greg k-h
