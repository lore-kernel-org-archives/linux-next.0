From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 18:19:14 +0200
Message-ID: <20090610161914.GA27545@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu> <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain> <20090610003055.GA26492@elte.hu> <20090610010014.GA28345@elte.hu> <1244644726.4109.30.camel@mulgrave.site> <alpine.LFD.2.01.0906100817060.6847@localhost.localdomain> <1244647703.4109.45.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:46941 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751329AbZFJQT0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 12:19:26 -0400
Content-Disposition: inline
In-Reply-To: <1244647703.4109.45.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Wed, 2009-06-10 at 08:20 -0700, Linus Torvalds wrote:
> > 
> > On Wed, 10 Jun 2009, James Bottomley wrote:
> > > 
> > > If I go the merge point route, I get a tree with more non trivial merge
> > > points than commits, so it becomes incredibly difficult for anyone to
> > > follow what's going on.  I also can no longer use git-email to send my
> > > patch series anywhere.
> > 
> > Why do you need to merge at all?
> > 
> > Do you get constant conflicts? If so, _that_ is likely the problem.
> 
> Pretty much, yes.  The problem isn't in the voyager code, it's in 
> the residual subarchitecture clean up.  As the x86 tree evolves, 
> that's what keeps conflicting mainly because adjacent areas get 
> altered.  Once that's upstream, the voyager piece should be a 
> smooth ride.

The problem causing problems with Voyager are long-lived, and it 
goes well before the time we got rid of subarchitectures and added 
the x86-quirks mechanism to express "non PC" properties cleanly.

The problem was simply that the old Voyager code had an unreasonably 
large cross-section to the x86 code originally, under the old 32-bit 
subarch code concepts. (which, in hindsight, should never have been 
merged in that form.)

We had this mach-default/mach-voyager splitup and the asm headers 
were duplicated as well, creating a large, hard to maintain 
build-time kludge of subarchitecture code. Voyager broke again and 
again in the past ~2 years because its assumptions were hidden in 
build-time wrappers and were not visible to developers changing the 
generic code.

The other key problem was that for a long time you runtime tested 
Voyager only in late -rc's (i remember an -rc8 Voyager patchset from 
you - for issues that were introduced months before that point!) - 
which gave us little oppotunity to do things properly.

The thing is, you are the only Linux person known to us on this 
planet who has access to the hardware and runs recent Linux on it 
and thus _can_ test Voyager/Linux, so unless we reduce the cross 
section to the rest of the code it will frequently 'break' - because 
no-one can actually test its assumptions.

So unless someone else mails us that they boot recent kernels and 
care about Voyager, this is basically a one-person show for your 
sake only. So the requirements are that it 1) must not hurt any 
other code 2) the introduction must be done so cleanly that everyone 
else benefits too indirectly, by virtue of an improved 
infrastructure.

> Once the last piece of the subarchitecture is removed and the 
> pieces needed to support voyager are in, that should be it. [...]

Ok, let me make this abundantly clear:

We _already_ removed the 32-bit subarchitecture code. We converted 
summit, numaq and visws over to the x86-quirks mechanism.

So your "once the last piece of the subarchitecture is removed" 
statement makes no sense. We dont have subarchitecture code left and 
we are not adding it back.

	Ingo
