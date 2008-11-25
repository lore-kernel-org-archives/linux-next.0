From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 17:51:18 +0100
Message-ID: <20081125165118.GF22504@elte.hu>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au> <20081125102234.GA4281@elte.hu> <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com> <20081125153345.GA20733@elte.hu> <7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:48489 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752218AbYKYQvr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 11:51:47 -0500
Content-Disposition: inline
In-Reply-To: <7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eranian@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>


* stephane eranian <eranian@googlemail.com> wrote:

> Ingo,
> 
> 
> On Tue, Nov 25, 2008 at 4:33 PM, Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * stephane eranian <eranian@googlemail.com> wrote:
> >
> >> So I am not sure I understand your point about submitting the
> >> changes to the x86 tree first.
> >
> > You are modifying x86 architecture files to enable a kernel feature on
> > x86. Such feature enablement, if it's pushed into linux-next, must go
> > via the arch maintainers.
> >
> > The x86 impact of the perfmon3 tree is substantial:
> >
> [snip]
> >  25 files changed, 2340 insertions(+), 6 deletions(-)
> >
> > linux-next is not a development kernel - it is an integration tree
> > simulating the next version of the upstream kernel and hence all trees
> > that are in it must be synced up (and in this case, go via) their
> > respective maintainers.
> >
>
> Perfmon3 as it exists in linux-next has two components: generic + 
> x86 I can send x86@kernel.org the x86 specific patches to integrate 
> them into the x86 tree even though they would not be operational 
> without the generic part. But then, where do I send the generic 
> code?

There are a number of ways to do that - and we'll sure be able to work 
that out - but first please submit the full patchset (x86 and generic 
bits as well) to lkml with the x86 maintainers Cc:-ed.

In any case, until that happens and until there's agreement with the 
x86 maintainers (there's none at the moment) the perfmon3 tree (or at 
least its x86 bits) needs to be removed from linux-next. I already see 
a number of problems with the patchset that we'll have to work out via 
an iterative review process.

	Ingo
