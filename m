From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 08:33:21 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0906100831120.6847@localhost.localdomain>
References: <1244477423.4079.228.camel@mulgrave.site>  <20090609202130.GA5291@elte.hu>  <20090610004126.491508c9@lxorguk.ukuu.org.uk>  <20090609235647.GE23846@elte.hu>  <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>  <20090610003055.GA26492@elte.hu>
 <20090610010014.GA28345@elte.hu>  <1244644726.4109.30.camel@mulgrave.site>  <alpine.LFD.2.01.0906100817060.6847@localhost.localdomain> <1244647703.4109.45.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38466 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753367AbZFJPdq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 11:33:46 -0400
In-Reply-To: <1244647703.4109.45.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Ingo Molnar <mingo@elte.hu>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org



On Wed, 10 Jun 2009, James Bottomley wrote:
> 
> Pretty much, yes.  The problem isn't in the voyager code, it's in the
> residual subarchitecture clean up.  As the x86 tree evolves, that's what
> keeps conflicting mainly because adjacent areas get altered.  Once
> that's upstream, the voyager piece should be a smooth ride.

Quite frankly, in that case I think that in order to get Voyager merged, 
we should just get the subarchitecture code cleaned up _first_.

The thing is, I do agree with Ingo that Voyager is not _nearly_ important 
enough to be rammed through in some ugly manner. And if the plan is to get 
it all done cleanly in the end anyway, then there is certainly no hurry 
what-so-ever in getting Voyager merged _before_ it's possible to merge it 
cleanly.

			Linus
