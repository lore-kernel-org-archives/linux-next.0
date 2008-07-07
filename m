From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 09:04:43 +0200
Message-ID: <20080707070439.GB28708@elte.hu>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au> <20080707060251.GA16144@elte.hu> <20080707061634.GA23191@elte.hu> <20080707164108.250e9888.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58529 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751410AbYGGHFI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 03:05:08 -0400
Content-Disposition: inline
In-Reply-To: <20080707164108.250e9888.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Mon, 7 Jul 2008 08:16:34 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * Ingo Molnar <mingo@elte.hu> wrote:
> > 
> > i.e. next time we see this pattern we should just do the header stub 
> > (or API stub) immediately, upstream.
> 
> Correct.  Though we should wait a little to make sure the API is 
> correct but once it hits -next is probably a good time.

i'd wait longer than "it hits -next": to see fallout, to give people 
time to object or to suggest different approaches. (This happened in the 
past, see the tip/sched/new-API-sched_setscheduler API change as an 
example.)

Two weeks after something hits linux-next should be a good rule i guess.

	Ingo
