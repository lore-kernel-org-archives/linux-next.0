From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 14:05:07 +0200
Message-ID: <20080813120507.GA6631@elte.hu>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au> <20080813073205.GA398@elte.hu> <48A28DD9.7010108@cs.helsinki.fi> <20080813075808.GA11645@elte.hu> <1218615288.7813.310.camel@penberg-laptop> <20080813085800.GF23417@elte.hu> <1218627433.7813.320.camel@penberg-laptop> <20080813115210.GD18660@elte.hu> <1218628646.7813.324.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:47756 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751487AbYHMMGE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 08:06:04 -0400
Content-Disposition: inline
In-Reply-To: <1218628646.7813.324.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> On Wed, 2008-08-13 at 13:52 +0200, Ingo Molnar wrote:
> > seems pretty sane to me. We use something quite similar in -tip, with 
> > the distinction that after a very short initial period [a few days at 
> > most] we try to keep development branches append-only as well.
> 
> Sure, I try to do that as well. But like I said, I've had a lot of 
> churn coming from the defrag patches recently...
> 
> But how do you deal with reverts, btw? Assuming you have a patch that 
> you've pushed out already but not asked Linus to pull, what do you do? 
> I currently use git-rebase -i and just drop the patch completely.

it depends - if the patch is the last one, i can just reset the topic 
back to just before that patch. If it's not, i use git-revert.

But the best way to deal with reverts is to use enough topic branches so 
that there's no 'mixing' between independent topics. Most reverts happen 
because there's some testing problem - so i do the revert in the 
_integration_ branch, not in the topic branch, and wait for the fix. 
Once the fix is available, it will be applied to the topic branch and 
the revert is dropped from the integration branch.

Worst-case i have to disable a full topic from the integration branch - 
but even in that case the topic commits still sit in the topic branch 
append-only and are waiting for the fix to arrive. One more detail: if a 
topic branch is broken i try not to merge upstream -rc's into that 
branch, to not artificially widen the window of breakage that could 
break bisection.

	Ingo
