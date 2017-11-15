From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the rseq tree with Linus' tree
Date: Wed, 15 Nov 2017 16:22:34 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1711151613250.1805@nanos>
References: <20171115153536.7fab87b7@canb.auug.org.au> <20171115080712.tehklwmcvol7iiic@gmail.com> <20171116014826.5228aa7c@canb.auug.org.au> <1489656964.15813.1510758032885.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42095 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932259AbdKOPWk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2017 10:22:40 -0500
In-Reply-To: <1489656964.15813.1510758032885.JavaMail.zimbra@efficios.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Wed, 15 Nov 2017, Mathieu Desnoyers wrote:
> ----- On Nov 15, 2017, at 9:48 AM, Stephen Rothwell sfr@canb.auug.org.au wrote:
> 
> > Hi Ingo,
> > 
> > On Wed, 15 Nov 2017 09:07:12 +0100 Ingo Molnar <mingo@kernel.org> wrote:
> >>
> >> There's absolutely no way such invasive x86 changes should be done outside the
> >> x86
> >> tree and be merged into linux-next.
> >> 
> >> linux-next should be for the regular maintenance flow, for changes pushed by
> >> maintainers and part of the regular maintenance process - not for
> >> work-in-progress
> >> features that may or may not be merged upstream in that form ...
> > 
> > Sure.  I was given the impression that Linus was going to be asked to
> > merge this tree during this merge window, so I assumed that it had been
> > seen by the appropriate people.  Most of these patches include you,
> > Linus and Andrew (among others) on their cc's and they seem to have
> > gone through several revisions.
> > 
> > I guess Mathieu has jumped the gun.
> 
> The membarrier core serializing command has been developed in the open
> since Aug. 27, 2017 [1]. That's one full development cycle. On Sept 28,
> 2017, I started CCing Ingo when I noticed I would have to add documentation
> to each architecture return-to-usermode paths [2]. I have never heard feedback
> from him until now.
> 
> I am open to remove the x86-specific membarrier core serializing patch from
> my tree and hand it to the x86 maintainers after the generic code makes it
> into Linus' tree, if this is seen as the appropriate way forward.

To be honest, I was looking at this stuff losely, but the continous flux of
it and the entanglement with the rseq series did not really help.

I have no idea why you are trying to force shove that rseq stuff into
4.15. It's not been complete before the merge window opened and it's still
not complete AFAICT.

That x86 membarrier thing is not yet clear if it is required at all, so why
is this so high priority?

Can we please handle this as any other feature which is not ready before
the merge window and postpone the rseq stuff for 4.16?

The core serialization thing might be a correctness issue and we can fix
that independently once we have gathered enough information from
Intel/AMD.

Thanks,

	tglx
