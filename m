From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 13:44:57 +0200
Message-ID: <20080716114457.GA5615@elte.hu>
References: <20080716194517.fc260962.sfr@canb.auug.org.au> <20080716101921.GA16688@elte.hu> <20080716202521.ea91d90d.sfr@canb.auug.org.au> <20080716104012.GA2425@elte.hu> <20080716205639.4655ccca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50922 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750758AbYGPLpX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 07:45:23 -0400
Content-Disposition: inline
In-Reply-To: <20080716205639.4655ccca.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Wed, 16 Jul 2008 12:40:12 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > hm, so them being stale over the merge window is a problem for you, 
> > even thought the sha1's didnt change? Ok - i'll do a full 
> > integration run right away to update them all to linus-very-latest. 
> > There's been quite a number of nontrivial interactions.
> 
> Its not to bad except where what gets merged to Linus is not exactly 
> what is in linux-next.  This can be because they are sent to Linus as 
> patches, or the just the merge commits are are different.

Hm. Sometimes i collapse merge fixlets into the conflict resolution 
commit to reduce the bisection breakage window. If the difference is 
material (and for the worse ;-) then please let us know about it.

> However, once a tree is merged to Linus, just resetting resetting it 
> to be (a subset of) his tree (for some a fast forward for others not) 
> makes sense anyway.  (And makes my life easier :-))
> 
> So thanks for that.

Instead of a reset i did an integration run. That automatically gets rid 
of everything that Linus has merged - plus it adds whatever got merged 
meanwhile in various topic branches. (because life doesnt stop :)

For many topics that means auto-topic-next == linus, but it's inherently 
safer than an explicit reset, because it cannot result in the loss of 
commits :-)

	Ingo
