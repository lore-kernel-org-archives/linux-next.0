From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 08:23:27 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0906100821540.6847@localhost.localdomain>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu> <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
 <alpine.LFD.2.00.0906101454420.3367@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:57426 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756766AbZFJPXx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 11:23:53 -0400
In-Reply-To: <alpine.LFD.2.00.0906101454420.3367@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>, Alan Cox <alan@lxorguk.ukuu.org.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org



On Wed, 10 Jun 2009, Thomas Gleixner wrote:
> 
> > Alan is definitely right that we're likely to see more of the "non-PC" 
> > platforms as x86 tries to do embedded.
> 
> I agree, but the way voyager is done is _not_ a good example for the
> embedded x86 folks who will probably start to send in their scoop in
> the foreseable future.
> 
> I'm not fundamentally against bringing Voyager back, but it needs to
> go through a useful patch submission and review process and not by
> forcing voyager wreckage into our code base.

Ok, thanks. This was exactly the kind of thing I wanted to hear. It does 
sound like the Voyager tree is doing things I myself wouldn't approve of 
as a maintainer, so I can't really say that I'm upset by the x86 
maintainers then not pulling it.

			Linus
