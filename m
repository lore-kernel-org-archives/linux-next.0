From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 17:39:54 +0200
Message-ID: <20090610153954.GA3464@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu> <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain> <alpine.LFD.2.00.0906101454420.3367@localhost.localdomain> <alpine.LFD.2.01.0906100821540.6847@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33455 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753367AbZFJPkJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 11:40:09 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.01.0906100821540.6847@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Alan Cox <alan@lxorguk.ukuu.org.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 10 Jun 2009, Thomas Gleixner wrote:
> > 
> > > Alan is definitely right that we're likely to see more of the "non-PC" 
> > > platforms as x86 tries to do embedded.
> > 
> > I agree, but the way voyager is done is _not_ a good example for the
> > embedded x86 folks who will probably start to send in their scoop in
> > the foreseable future.
> > 
> > I'm not fundamentally against bringing Voyager back, but it 
> > needs to go through a useful patch submission and review process 
> > and not by forcing voyager wreckage into our code base.
> 
> Ok, thanks. This was exactly the kind of thing I wanted to hear. 
> It does sound like the Voyager tree is doing things I myself 
> wouldn't approve of as a maintainer, so I can't really say that 
> I'm upset by the x86 maintainers then not pulling it.

I also take back the "it's obsolete" and "it didnt even build" 
portion of my NAK - that was overboard as Alan and you pointed it 
out.

I think we can work out something and a clear(er) platform driver 
interface abstraction with a thin cross section to generic x86 code 
will be helpful to a lot more than just Voyager.

In fact we have implemented that largely and it went upstream in 
2.6.30, via the massive changes around this bit:

  6bda2c8: x86: remove subarchitecture support

This is what _already_ happened to other (ex-)subarchitecture code: 
visws, numaq were frequent trouble spots too, and with the 
x86-quirks model they basically vanished from our regression lists.

So it's a successful model in practice, and if Voyager is done in a 
similar way we wont see many Voyager problems in the future either.

	Ingo
