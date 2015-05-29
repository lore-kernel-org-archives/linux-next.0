From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the modules and
 tip trees
Date: Fri, 29 May 2015 05:46:48 -0700
Message-ID: <20150529124648.GA5989@linux.vnet.ibm.com>
References: <20150528172507.31f6fc8c@canb.auug.org.au>
 <20150528170321.GH5989@linux.vnet.ibm.com>
 <20150529065604.GA23179@gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:60080 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755514AbbE2Mqy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2015 08:46:54 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 29 May 2015 06:46:53 -0600
Content-Disposition: inline
In-Reply-To: <20150529065604.GA23179@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 29, 2015 at 08:56:04AM +0200, Ingo Molnar wrote:
> 
> * Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> 
> > On Thu, May 28, 2015 at 05:25:07PM +1000, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > Today's linux-next merge of the rcu tree got a conflict in
> > > include/linux/rcupdate.h between commits 0a04b0166929 ("rcu: Move
> > > lockless_dereference() out of rcupdate.h") from the modules tree and
> > > c1ad348b452a ("tick: Nohz: Rework next timer evaluation") from the tip
> > > tree and commits 7d0ae8086b82 ("rcu: Convert ACCESS_ONCE() to
> > > READ_ONCE() and WRITE_ONCE()") and 3382adbc1bb8 ("rcu: Eliminate a few
> > > CONFIG_RCU_NOCB_CPU_ALL #ifdefs") from the rcu tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary (no action
> > > is required).
> > 
> > Thank you, Stephen!
> > 
> > Ingo, I can send you a pull request as is or I can merge c1ad348b452a
> > with v4.1-rc3, rebase my commits on top of that, and do another cycle
> > through -next.  If I don't hear otherwise, I will be lazy and send as is,
> > so if you would prefer something different, please let me know.
> 
> I think as-is would be better, to not create extra dependencies. I can resolve 
> conflicts in -tip.

Very good!  I expect to send the pull request tomorrow (Saturday)
Pacific time.

							Thanx, Paul
