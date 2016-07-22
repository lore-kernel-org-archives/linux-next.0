From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 22 Jul 2016 16:57:34 -0300
Message-ID: <20160722195734.GK18962@kernel.org>
References: <20160720095333.3034531c@canb.auug.org.au>
 <20160720025202.GB18962@kernel.org>
 <20160721092950.0047531e@canb.auug.org.au>
 <20160721131248.GH18962@kernel.org>
 <20160722092302.5a0a1544@canb.auug.org.au>
 <20160722034118.guckaniobf3f7czc@treble>
 <20160722143739.GI18962@kernel.org>
 <20160722191920.ej62fnspnqurbaa7@treble>
 <20160722193655.GJ18962@kernel.org>
 <20160722194416.pxbsnyhaqcyoigsj@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45976 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989AbcGVT5i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 15:57:38 -0400
Content-Disposition: inline
In-Reply-To: <20160722194416.pxbsnyhaqcyoigsj@treble>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Em Fri, Jul 22, 2016 at 02:44:17PM -0500, Josh Poimboeuf escreveu:
> On Fri, Jul 22, 2016 at 04:36:55PM -0300, Arnaldo Carvalho de Melo wrote:
> > Em Fri, Jul 22, 2016 at 02:19:20PM -0500, Josh Poimboeuf escreveu:
> > > On Fri, Jul 22, 2016 at 11:37:39AM -0300, Arnaldo Carvalho de Melo wrote:
> > > > I.e. with the two patches I mentioned, that are equivalent to the last patch I
> > > > sent to Stephen for testing, we would end up with HOSTARCH=powerpc and
> > > > ARCH=x86, no?

> > > Thanks for spelling it out, that helped a lot.

> > Glad you liked it, I had to do it for my own sanity :-)

> > And something that gave me mixed feelings was an e-mail from the kbuild
> > test bot that noticed my perf/core changes and said that the build was
> > broken for "make ARCH=x86_64", so I had to reinstate this part:

> > ifeq ($(ARCH),x86_64)
> > ARCH := x86
> > endif

> > Because, as you say, 'make ARCH=x86' works :-\ I think it will not be
> > needed with your patch, right? I'm checking your patch below right now,

> Yeah, that shouldn't be needed with my patch.  I think either would
> work, but my patch is more of a permanent solution.

Sure, I left it there because then we don't have bisection broke at that
fix I made, i.e. 'make ARCH=x86_64' works at that point too.

I applied your patch and will push it to Ingo, now we must cross our
fingers so that Stephen doesn't come back to us once more telling it is
still broken :o)

Best regards,

- Arnaldo
