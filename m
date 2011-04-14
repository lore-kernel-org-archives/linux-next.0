From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Thu, 14 Apr 2011 11:25:19 +0200
Message-ID: <20110414092519.GA18329@elte.hu>
References: <20110414131440.fb8dc3ad.sfr@canb.auug.org.au>
 <1302771770.2388.131.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:38607 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089Ab1DNJZa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Apr 2011 05:25:30 -0400
Content-Disposition: inline
In-Reply-To: <1302771770.2388.131.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, 2011-04-14 at 13:14 +1000, Stephen Rothwell wrote:
> > 
> > Today's linux-next merge of the tip tree got a conflict in kernel/sched.c
> > between commit 6631e635c65d ("block: don't flush plugged IO on forced
> > preemtion scheduling") from Linus' tree and commits 098247b90a9e ("sched:
> > Provide p->on_rq") and a3380736e4b3 ("sched: Also serialize ttwu_local()
> > with p->pi_lock") from the tip tree.
> > 
> > I fixed them up (hopefully - see below) and can carry the fix as
> > necessary. 
> 
> It looks like Ingo accidentially published an older version of these patches 
> because I also got a UP build error from Tony yesterday.

It was intentionally published.

> A new series was merged this morning which should hopefully address both 
> problems.

Yes.

Thanks,

	Ingo
