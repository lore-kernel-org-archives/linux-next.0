From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip tree
Date: Thu, 26 Nov 2009 10:51:54 +0100
Message-ID: <20091126095154.GE32275@elte.hu>
References: <20091126190018.88a6dd77.sfr@canb.auug.org.au>
 <20091126081237.GA31034@elte.hu>
 <4B0E4741.10509@kernel.org>
 <20091126092631.GA17253@elte.hu>
 <4B0E4EFB.2070705@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753438AbZKZJwL@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B0E4EFB.2070705@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org


* Tejun Heo <tj@kernel.org> wrote:

> Hello, Ingo.
> 
> 11/26/2009 06:26 PM, Ingo Molnar wrote:
> >> Sure, which sched/* branch should I base these patches on?
> > 
> > You could send the patch you rely on standalone (it seems to be a single 
> > patch) and we can look at applying it to the scheduler tree. That 
> > reduces the conflicts on an ongoing basis. Please Cc: PeterZ and Mike 
> > Galbraith as well.
> 
> The tree contains four scheduler patches.
> 
> 0001-sched-rename-preempt_notifier-to-sched_notifier-and-.patch
> 0002-sched-update-sched_notifier-and-add-wakeup-sleep-not.patch
> 0003-sched-implement-sched_notifier_wake_up_process.patch
> 0004-sched-implement-force_cpus_allowed.patch
> 
> 1, 2 and 4 are somewhat spread throughout sched.c so it would be
> better if they all are routed through sched tree.  Currently the
> wq#for-sched contains the followings on top of linus#master.
> 
> * Adds debugobj support to workqueue.
> 
> * Pulls in sched/urgent to receive the scheduler fix.
> 
> * Adds the above four patches.
> 
> If pulling in from the existing branch is an option, I'd prefer that. 
> If not, please let me know.  I'll send the above four patches against 
> sched/urgent.

I've merged sched/urgent into sched/core and pushed it out - mind basing 
any sched.c patches on top of that and send a series of scheduler-only 
patches?

Thanks,

	Ingo
