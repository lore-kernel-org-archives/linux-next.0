From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Wed, 2 Sep 2015 00:14:39 -0700
Message-ID: <20150902071439.GM4029@linux.vnet.ibm.com>
References: <20150901135006.78be270e@canb.auug.org.au>
 <20150901074946.GF4029@linux.vnet.ibm.com>
 <20150902135800.068f0f4a@canb.auug.org.au>
 <20150902052612.GK4029@linux.vnet.ibm.com>
 <1441176051.2038.3.camel@stgolabs.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:37230 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752037AbbIBHOp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2015 03:14:45 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 2 Sep 2015 01:14:45 -0600
Content-Disposition: inline
In-Reply-To: <1441176051.2038.3.camel@stgolabs.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, peterz@infradead.org

On Tue, Sep 01, 2015 at 11:40:51PM -0700, Davidlohr Bueso wrote:
> On Tue, 2015-09-01 at 22:26 -0700, Paul E. McKenney wrote:
> > Davidlohr, the error is due to sched_setscheduler_nocheck() not being
> > exported, so that Stephen gets this failure when building modules.
> > This is 04be76a9b067 (locktorture: Support rtmutex torturing) in -rcu.
> > 
> > Thoughts?
> 
> Right, the below should take care of it. Although I think it makes sense
> to get this into at least 4.3 even if we won't use it until 4.4. Simply
> because we already export sched_setscheduler(). If you agree I guess we
> could route via -tip.

Given an ack from Peter or Ingo, I would happy to queue it.  But we are
talking 4.4 rather than 4.3, sorry!

							Thanx, Paul

> Thanks,
> Davidlohr
> 
> ----8<------------------------------------
> Subject: [PATCH -next] sched: Export sched_setscheduler_nocheck
> 
> ... just like regular sched_setscheduler(). We need this, for locktorture
> otherwise we can fail to build modules, ie:
> 
> ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!
> 
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Ingo Molnar <mingo@kernel.org>
> ---
>  kernel/sched/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 3595403..7b51f64 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4012,6 +4012,7 @@ int sched_setscheduler_nocheck(struct task_struct *p, int policy,
>  {
>  	return _sched_setscheduler(p, policy, param, false);
>  }
> +EXPORT_SYMBOL_GPL(sched_setscheduler_nocheck);
> 
>  static int
>  do_sched_setscheduler(pid_t pid, int policy, struct sched_param __user *param)
> -- 
> 2.1.4
> 
> 
> 
