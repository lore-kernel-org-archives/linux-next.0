From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: origin tree build failure
Date: Fri, 12 Jun 2009 11:20:54 +0200
Message-ID: <20090612092054.GB32052@elte.hu>
References: <20090612102427.32582baa.sfr@canb.auug.org.au> <1244768406.7172.1.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50812 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759622AbZFLJVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 05:21:08 -0400
Content-Disposition: inline
In-Reply-To: <1244768406.7172.1.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulus@samba.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>


* Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:

> On Fri, 2009-06-12 at 10:24 +1000, Stephen Rothwell wrote:
> 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 12 Jun 2009 10:14:22 +1000
> > Subject: [PATCH] perfcounters: remove powerpc definitions of perf_counter_do_pending
> > 
> > Commit 925d519ab82b6dd7aca9420d809ee83819c08db2 ("perf_counter:
> > unify and fix delayed counter wakeup") added global definitions.
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Ah - thanks. The bug was caused by me being a bit too optimistic in 
applying the shiny-new Power7 support patches on the last day. (nice 
CPU btw.)

> Linus, please apply. BTW, This is _EXACTLY_ why this should have 
> been in -next for a few days before being merged :-(

Not really: for example current upstream is build-broken on x86 due 
to an integration artifact via the kmemleak tree - despite it having 
been in linux-next for months.

Paulus was building and booting powerpc on a daily basis and i ran 
cross-builds as well.

Such bugs happen, and they are easy enough to fix. What matters 
arent the 1-2 short-lived bugs that do happen when a new combination 
of trees is created, but the long-lived combination bugs and 
conflicts.

	Ingo
