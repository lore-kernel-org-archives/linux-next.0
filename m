From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Tue, 1 Jul 2008 08:08:14 +0200
Message-ID: <20080701060814.GD14658@elte.hu>
References: <20080701124206.77ff77cd.sfr@canb.auug.org.au> <20080701055402.GA14658@elte.hu> <20080701160016.0fa899e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:43082 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751623AbYGAGIa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 02:08:30 -0400
Content-Disposition: inline
In-Reply-To: <20080701160016.0fa899e4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Tue, 1 Jul 2008 07:54:02 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > You should be able to check whether we both integrated the conflict the 
> > same way via checking tip/auto-latest, which is the integration of all 
> > the auto branches that come from -tip.
> > 
> > All the integration branches of -tip are pushed out at once so 
> > tip/auto-latest always gives a hint about how to integrate two -tip 
> > derived topic branches, tip/auto-latest always gives an answer. [ which 
> > might at times be wrong so it never hurts to double check :-) Note: 
> > auto-latest also includes some non-linux-next topics - but they dont 
> > affect the scheduler usually. ]
> 
> Good to know, I will fetch it when necessary to check my work.

we could also add tip/auto-next, which would be the integration of 
strictly the topics that go towards linux-next.

You probably dont want to use it for linux-next because it's too large 
hence you'd lose flexibility in shaping the ordering of trees (and lose 
flexibility in excluding broken trees and iterating them out of sync) - 
but it would be useful for the normal case and it might also speed up / 
strengthen your conflict resolution workflow.

	Ingo
