From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Tue, 1 Jul 2008 07:54:02 +0200
Message-ID: <20080701055402.GA14658@elte.hu>
References: <20080701124206.77ff77cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:39381 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752436AbYGAFyS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 01:54:18 -0400
Content-Disposition: inline
In-Reply-To: <20080701124206.77ff77cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the sched tree got a conflict in 
> kernel/sched.c between commit 040ec23d07f95285e9777a85cda29cb339a3065b 
> ("sched: sched_clock() lockdep fix") from the tree and commit 
> 76a2a6ee8a0660a29127f05989ac59ae1ce865fa ("sched: sched_clock_cpu() 
> based cpu_clock()") from the sched tree.
> 
> The former updated some code that the latter removed.  I used the 
> version from the sched tree.
> 
> There was also a conflict in kernel/sched_rt.c between commit 
> 363ab6f1424cdea63e5d182312d60e19077b892a ("core: use performance 
> variant for_each_cpu_mask_nr") from the cpus4096 tree and commit 
> eff6549b957d15d1ad168d90b8c1eb643b9c163f ("sched: rt: move some code 
> around") from the sched tree.
> 
> Again I took the version from the sched tree except for the 
> for_each_cpu_mask -> for_each_cpu_mask_nr transformation.

thanks. I did that manual merge a couple of days ago.

You should be able to check whether we both integrated the conflict the 
same way via checking tip/auto-latest, which is the integration of all 
the auto branches that come from -tip.

All the integration branches of -tip are pushed out at once so 
tip/auto-latest always gives a hint about how to integrate two -tip 
derived topic branches, tip/auto-latest always gives an answer. [ which 
might at times be wrong so it never hurts to double check :-) Note: 
auto-latest also includes some non-linux-next topics - but they dont 
affect the scheduler usually. ]

	Ingo
