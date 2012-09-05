From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Wed, 5 Sep 2012 09:39:59 -0700
Message-ID: <20120905163959.GF3308@linux.vnet.ibm.com>
References: <20120905135947.34ba1c8356cbfe374c6c4ea8@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:58919 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753913Ab2IEQkI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Sep 2012 12:40:08 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 5 Sep 2012 12:40:07 -0400
Content-Disposition: inline
In-Reply-To: <20120905135947.34ba1c8356cbfe374c6c4ea8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Wed, Sep 05, 2012 at 01:59:47PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> kernel/sched/core.c between commit f319da0c6894 ("sched: Fix load avg vs
> cpu-hotplug") from the tip tree and commit ead504e5600e ("sched: Fix load
> avg vs cpu-hotplug") from the rcu tree.
> 
> These are 2 slightly different versions of the same patch :-( Same author
> time, different commit times ...  The rcu tree version contains this
> extra bit in the commit message:
> 
> "    [ paulmck: Move call to calc_load_migration to CPU_DEAD to avoid
>      miscounting noted by Rakib. ]"
> 
> So I used it.  Let me know if this is not correct.

My guess is that Peter Zijlstra will replace my version at some point,
at which point I will drop mine.  But from what I can see, the version
currently  in -tip is the older version, so I will keep mine until
-tip updates.

							Thanx, Paul
