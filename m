From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 15:58:49 +0200
Message-ID: <20170801135849.t5nbcqotkhztr5mr@hirez.programming.kicks-ass.net>
References: <20170731135029.479025ea@canb.auug.org.au>
 <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
 <20170801040323.GP3730@linux.vnet.ibm.com>
 <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 01, 2017 at 06:43:14AM -0700, Andy Lutomirski wrote:
> Anyway, can you document whatever property you require with a comment
> in switch_mm() or wherever you're finding that property so that future
> arch changes don't break it?

We need _a_ smp_mb after rq->curr store. x86 has plenty.

> > +static void membarrier_private_expedited(void)
> > +{
> > +       int cpu;
> > +       bool fallback = false;
> > +       cpumask_var_t tmpmask;
> > +
> > +       if (num_online_cpus() == 1)
> > +               return;
> > +
> > +       /*
> > +        * Matches memory barriers around rq->curr modification in
> > +        * scheduler.
> > +        */
> > +       smp_mb();       /* system call entry is not a mb. */
> > +
> > +       /*
> > +        * Expedited membarrier commands guarantee that they won't
> > +        * block, hence the GFP_NOWAIT allocation flag and fallback
> > +        * implementation.
> > +        */
> > +       if (!zalloc_cpumask_var(&tmpmask, GFP_NOWAIT)) {
> > +               /* Fallback for OOM. */
> > +               fallback = true;
> > +       }
> > +
> > +       cpus_read_lock();
> > +       for_each_online_cpu(cpu) {
> > +               struct task_struct *p;
> > +
> > +               /*
> > +                * Skipping the current CPU is OK even through we can be
> > +                * migrated at any point. The current CPU, at the point
> > +                * where we read raw_smp_processor_id(), is ensured to
> > +                * be in program order with respect to the caller
> > +                * thread. Therefore, we can skip this CPU from the
> > +                * iteration.
> > +                */
> > +               if (cpu == raw_smp_processor_id())
> > +                       continue;
> > +               rcu_read_lock();
> > +               p = task_rcu_dereference(&cpu_rq(cpu)->curr);
> > +               if (p && p->mm == current->mm) {
> 
> I'm a bit surprised you're iterating all CPUs instead of just CPUs in
> mm_cpumask().

Because ARM64 doesn't set any bits at all in there.
