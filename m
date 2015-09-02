From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Wed, 2 Sep 2015 01:34:32 -0700
Message-ID: <20150902083432.GP4029@linux.vnet.ibm.com>
References: <20150901135006.78be270e@canb.auug.org.au>
 <20150901074946.GF4029@linux.vnet.ibm.com>
 <20150902135800.068f0f4a@canb.auug.org.au>
 <20150902052612.GK4029@linux.vnet.ibm.com>
 <1441176051.2038.3.camel@stgolabs.net>
 <20150902071439.GM4029@linux.vnet.ibm.com>
 <20150902072918.GA2677@gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150902072918.GA2677@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, peterz@infradead.org
List-Id: linux-next.vger.kernel.org

On Wed, Sep 02, 2015 at 09:29:18AM +0200, Ingo Molnar wrote:
> 
> * Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> 
> > On Tue, Sep 01, 2015 at 11:40:51PM -0700, Davidlohr Bueso wrote:
> > > On Tue, 2015-09-01 at 22:26 -0700, Paul E. McKenney wrote:
> > > > Davidlohr, the error is due to sched_setscheduler_nocheck() not being
> > > > exported, so that Stephen gets this failure when building modules.
> > > > This is 04be76a9b067 (locktorture: Support rtmutex torturing) in -rcu.
> > > > 
> > > > Thoughts?
> > > 
> > > Right, the below should take care of it. Although I think it makes sense
> > > to get this into at least 4.3 even if we won't use it until 4.4. Simply
> > > because we already export sched_setscheduler(). If you agree I guess we
> > > could route via -tip.
> > 
> > Given an ack from Peter or Ingo, I would happy to queue it.  But we are
> > talking 4.4 rather than 4.3, sorry!
> 
> The export looks good to me:
> 
> Acked-by: Ingo Molnar <mingo@kernel.org>

Very good, queued for 4.4!

							Thanx, Paul

------------------------------------------------------------------------

sched: Export sched_setscheduler_nocheck

The new locktorture rtmutex_lock tests exercise priority boosting, which
means that they need to set some tasks to real-time priority.  To do this,
they use sched_setscheduler_nocheck().  However, this is not exported to
modules, which results in the following error when building locktorture
as a module:

ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!

This commit therefore adds an EXPORT_SYMBOL_GPL() to allow this function
to be invoked from locktorture when built as a module.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Acked-by: Ingo Molnar <mingo@kernel.org>

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5e73c79fadd0..5eee11b2b4b0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3960,6 +3960,7 @@ int sched_setscheduler_nocheck(struct task_struct *p, int policy,
 {
 	return _sched_setscheduler(p, policy, param, false);
 }
+EXPORT_SYMBOL_GPL(sched_setscheduler_nocheck);
 
 static int
 do_sched_setscheduler(pid_t pid, int policy, struct sched_param __user *param)
