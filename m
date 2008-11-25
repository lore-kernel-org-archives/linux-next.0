From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: net tree build failure
Date: Tue, 25 Nov 2008 10:01:35 +0100
Message-ID: <20081125090135.GA31581@uranus.ravnborg.org>
References: <20081124154938.bac22cd5.sfr@canb.auug.org.au> <20081123.210452.160784844.davem@davemloft.net> <20081124162044.f3333fcf.sfr@canb.auug.org.au> <20081123.212339.131214270.davem@davemloft.net> <20081124163844.004469a6.sfr@canb.auug.org.au> <20081124210028.GA32585@uranus.ravnborg.org> <20081124135251.51196003@extreme> <20081124221232.GA945@uranus.ravnborg.org> <20081125194257.84089d9b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:50660 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751928AbYKYJAP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 04:00:15 -0500
Content-Disposition: inline
In-Reply-To: <20081125194257.84089d9b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Hemminger <shemminger@vyatta.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Tue, Nov 25, 2008 at 07:42:57PM +1100, Stephen Rothwell wrote:
> Hi Sam,
> 
> On Mon, 24 Nov 2008 23:12:32 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Anyway - I can see that only "cris m68k parisc s390 sparc sparc64 um" lacks
> 
> Actually parisc gets it through drivers/parisc/Kconfig.
>  
> > the include of drivers/scsi/pcmcia/Kconfig.
> > So I will try to add it to drivers/Kconfig in my tree and see it -next
> > blows up. I will wait until next -next as I want to see my current
> > pending patches there in a clean run first.
> 
> I started to do this but then decided that ordering of the includes may
> need some thought.

x86 at least put it in the "Bus" menu where I also think it belongs.
So it is not a simple move to drivers/Kconfig as I orginally thought
and I think we should let it be as it is for now.

	Sam
