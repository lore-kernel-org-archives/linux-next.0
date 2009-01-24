From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 22:27:05 -0800 (PST)
Message-ID: <20090123.222705.186090326.davem@davemloft.net>
References: <20090123212128.16cd5698.sfr@canb.auug.org.au>
	<20090123213927.61beb5b3.sfr@canb.auug.org.au>
	<20090123215057.f5512e43.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50402
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750807AbZAXG1F (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 24 Jan 2009 01:27:05 -0500
In-Reply-To: <20090123215057.f5512e43.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Jan 2009 21:50:57 +1100

> On Fri, 23 Jan 2009 21:39:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi again,
> > 
> > On Fri, 23 Jan 2009 21:21:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > So, this could be a compiler bug?
> > 
> > We pass -fno-common to gcc which seems to cause the (non-extern) const
> > variable to end up in the bss.
> 
>        -fno-common
>            In C, allocate even uninitialized global variables in the data
>            section of the object file, rather than generating them as common
>            blocks.  This has the effect that if the same variable is declared
>            (without "extern") in two different compilations, you will get an
>            error when you link them.  The only reason this might be useful is
>            if you wish to verify that the program will work on other systems
>            which always work this way.
> 
> I don't know why we use this, but it seems to basically make using
> "extern" on variables in header files compulsory.  But it seems to be
> moving the variable from *COM* to .bss rather than to .{ro}data as I would
> expect from the description above.
> 
> Oh, well, easy to work around.

Thanks for testing, it confirms my suspicions :-)

I'll check in the fix.
