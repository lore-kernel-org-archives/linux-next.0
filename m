From: Andy Lutomirski <luto@kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 06:43:14 -0700
Message-ID: <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com>
References: <20170731135029.479025ea@canb.auug.org.au> <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com> <20170801040323.GP3730@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801040323.GP3730@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 31, 2017 at 9:03 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, Aug 01, 2017 at 12:04:05AM +0000, Mathieu Desnoyers wrote:
>> ----- On Jul 31, 2017, at 12:13 PM, Paul E. McKenney paulmck@linux.vnet.ibm.com wrote:
>>

>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit fde19879b6bd1abc0c1d4d5f945efed61bf7eb8c
> Author: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Date:   Fri Jul 28 16:40:40 2017 -0400
>
>     membarrier: Expedited private command
>
>     Implement MEMBARRIER_CMD_PRIVATE_EXPEDITED with IPIs using cpumask built
>     from all runqueues for which current thread's mm is the same as the
>     thread calling sys_membarrier. It executes faster than the non-expedited
>     variant (no blocking). It also works on NOHZ_FULL configurations.
>
>     Scheduler-wise, it requires a memory barrier before and after context
>     switching between processes (which have different mm). The memory
>     barrier before context switch is already present. For the barrier after
>     context switch:
>
>     * Our TSO archs can do RELEASE without being a full barrier. Look at
>       x86 spin_unlock() being a regular STORE for example.  But for those
>       archs, all atomics imply smp_mb and all of them have atomic ops in
>       switch_mm() for mm_cpumask().

I think that, on x86, context switches, even without mm changes, must
at least flush the store buffer (maybe SFENCE is okay) to avoid
visible inconsistency due to store-buffer forwarding.

Anyway, can you document whatever property you require with a comment
in switch_mm() or wherever you're finding that property so that future
arch changes don't break it?

> +static void membarrier_private_expedited(void)
> +{
> +       int cpu;
> +       bool fallback = false;
> +       cpumask_var_t tmpmask;
> +
> +       if (num_online_cpus() == 1)
> +               return;
> +
> +       /*
> +        * Matches memory barriers around rq->curr modification in
> +        * scheduler.
> +        */
> +       smp_mb();       /* system call entry is not a mb. */
> +
> +       /*
> +        * Expedited membarrier commands guarantee that they won't
> +        * block, hence the GFP_NOWAIT allocation flag and fallback
> +        * implementation.
> +        */
> +       if (!zalloc_cpumask_var(&tmpmask, GFP_NOWAIT)) {
> +               /* Fallback for OOM. */
> +               fallback = true;
> +       }
> +
> +       cpus_read_lock();
> +       for_each_online_cpu(cpu) {
> +               struct task_struct *p;
> +
> +               /*
> +                * Skipping the current CPU is OK even through we can be
> +                * migrated at any point. The current CPU, at the point
> +                * where we read raw_smp_processor_id(), is ensured to
> +                * be in program order with respect to the caller
> +                * thread. Therefore, we can skip this CPU from the
> +                * iteration.
> +                */
> +               if (cpu == raw_smp_processor_id())
> +                       continue;
> +               rcu_read_lock();
> +               p = task_rcu_dereference(&cpu_rq(cpu)->curr);
> +               if (p && p->mm == current->mm) {

I'm a bit surprised you're iterating all CPUs instead of just CPUs in
mm_cpumask().
