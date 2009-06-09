From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Tue, 9 Jun 2009 23:18:51 +0200
Message-ID: <20090609211851.GA24339@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <1244579612.12321.128.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55055 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755185AbZFIVTF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 17:19:05 -0400
Content-Disposition: inline
In-Reply-To: <1244579612.12321.128.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Tue, 2009-06-09 at 22:21 +0200, Ingo Molnar wrote:
> > * James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > 
> > > Could you add this (as a postmerge tree) somewhere after the x86 
> > > trees, please (it depends on the auto-x86-next branch).
> > > 
> > > I'll be sending the pull request for it to Linus somewhere in the 
> > > next merge window (probably towards the end) and if he takes it, 
> > > linux-next inclusion for a small number of patches it contains 
> > > will probably be a recurring feature.
> > 
> > Sigh.
> > 
> > This code has been NAK-ed by the x86 maintainers:
> > 
> >  - Due to the absurd irrelevance of Voyager/x86/Linux hardware
> > 
> >  - Due to the thousands of lines of of code it adds to arch/x86
> >    to support a 486/P5 era piece of hardware
> > 
> >  - and due to its negative track record of:
> > 
> >     v2.6.27.0:   Voyager was broken - it did not even build. (!)
> >     v2.6.28.0:   Voyager was broken - it did not even build. (!)
> >     v2.6.29-rc5: Voyager was broken - it did not even build. (!)
> > 
> >    [ ... which was the point when we yanked it from the x86 devel 
> >      tree. Then you suddenly found interest in it again. But it was 
> >      too little, too late. Voyager is irrelevant and we've really 
> >      got better things to do than to worry about ancient, completely 
> >      irrelevant hardware. ]
> > 
> > And you were very much aware of its controversial nature and you 
> > were aware of the NAK, still you sent this mail to Stephen without 
> > Cc:-ing the x86 maintainers or without Cc:-ing lkml.
> > 
> > You did this on one of the last days of the development window - 
> > generally the most impossibly busy days for upstream maintainers who 
> > prepare for the next merge window.
> > 
> > I've Cc:-ed Linus - he might want to overrule our judgement and pull 
> > this from you directly or tell us to pull it - but this should be 
> > done above board, not below the radar on the last day of the 
> > development window.
> > 
> > I made it quite clear to you why i object to this code, didnt I? See 
> > the (long) thread at:
> > 
> >     http://lkml.org/lkml/2009/4/15/299
> > 
> > James, it also would have been really honest from you to Cc: us to 
> > this mail. I am not pushing SCSI changes into linux-next either, 
> > against your NAKs, behind your back. I'd have expected the same of 
> > you.
> > 
> > So i strongly object against this tree being included in linux-next.
> 
> Your actual statement was that I should take this to Linus, which 
> I will. [...]

My statement was:

" [...] Meanwhile if James does not want to maintain it out of tree
  he can ask Linus to overrule our NAK, but i'd like to ask him to
  quote this NAK paragraph from me in his mail to Linus. "

  http://lkml.org/lkml/2009/4/19/181

> However, procedurally, I need it through linux-next first before I 
> can send a pull request, otherwise I'm asking for code which 
> hasn't been through the usual integration testing to be included, 
> which is dangerous.

How about the old fashioned way of interpreting my words directly, 
not twisting them like a laywer? Wasnt it clear from my objections 
that i ... object?

Firstly, it is a misunderstanding (at best) on your part that 
patches that are sent to Linus must "procedurally" go through 
linux-next. The stuff from maintainers, the stuff that is not 
controversial, that bit should go into linux-next. The 90% stuff.

The 10% stuff that is disputed and controversial (like kmemcheck 
which was excluded from linux-next for a few weeks in this cycle due 
to an objection, or like perfcounters which was disputed and is thus 
not included) it doesnt and shouldnt go into linux-next. It can be 
sent to Linus on its own right (declaring its controversial nature), 
or if you can convince Andrew to put it into linux-mm.

Does this make it harder to merge controversial bits? Absolutely. 
That's one of the points really. Does this make it impossible to 
merge controversial bits, if the maintainer is on crack? Not at all 
- it just raises the bar.

linux-next is not there to include all random stuff intended by all 
kernel developers on the planet to be sent to Linus, IMHO. It is 
there to _help Linus_ to merge the 90% bulk more easily, to handle 
conflicts between the routine stuff that nobody objects to and to 
test them together. It is there to free up time to handle the _10%_.

And i think linux-next is currently largely fulfilling that purpose 
and role of detecting and excluding/resolving conflicts early on - 
both technical conflicts and conceptual/maintenance conflicts.

If there are long arguments about linux-next that is _bad_. It 
should be a routine medium of friendly conflict resolution and "oh, 
I didnt really mean to push that patch, sorry" type of 
cross-maintainer realizations and cooperation - heavy arguments are 
for other forums such as lkml.

Read the _name_ of linux-next. It's the stuff that is intended to be 
in Linux by maintainers in the next merge window, on a best effort 
basis. Surprises, trickeries and friction are bad.

	Ingo
