From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Tue, 9 Jun 2009 17:04:52 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52880 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750878AbZFJAFY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 20:05:24 -0400
In-Reply-To: <20090609235647.GE23846@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org



On Wed, 10 Jun 2009, Ingo Molnar wrote:

> 
> * Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> 
> > > This code has been NAK-ed by the x86 maintainers:
> > > 
> > >  - Due to the absurd irrelevance of Voyager/x86/Linux hardware
> > > 
> > >  - Due to the thousands of lines of of code it adds to arch/x86
> > >    to support a 486/P5 era piece of hardware
> > > 
> > >  - and due to its negative track record of:
> > > 
> > >     v2.6.27.0:   Voyager was broken - it did not even build. (!)
> > >     v2.6.28.0:   Voyager was broken - it did not even build. (!)
> > >     v2.6.29-rc5: Voyager was broken - it did not even build. (!)
> > 
> > So Ingo you are arguing "It didn't work in some releases so we 
> > want to make it continue not to work by trying to keep the fixes 
> > out" ?
> 
> No. This code is not in Linux right now, and that i see no reason to 
> put it back, for the (many) reasons outlined.

Ingo, "absurd irrelevance" is not a reason. If it was, we'd lose about 
half our filesystems etc.

Neither is "thousands of lines of code", or "it hasn't always worked". 
Again, if it was, then we'd have to get rid of just about all drivers out 
there.

So give some real reasons. "It's a maintenance nightmare because it does 
xyz" might be a reason. But then we really need to see the "xyz" part too.

Alan is definitely right that we're likely to see more of the "non-PC" 
platforms as x86 tries to do embedded.

			Linus
