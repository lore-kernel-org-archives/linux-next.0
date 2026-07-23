Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A46367B73;
	Thu, 23 Jul 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822656; cv=none; b=CnPTRRKlxesrq0n5jk0CAjRzq3xPokJ2SMdFD6ARx2PLZHljl/wxnPoWjpcFEOr1C7BCTFNeZn3I4DFJk8vYtuvWV1oOqMfQKP89eoALe/ELBH4sID+BE1Ha3+/B3t8Mh/zWrRAcU9YYArL3G+GMK9uWBvDa3aWtNZ1YPyGnJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822656; c=relaxed/simple;
	bh=57Yfwl2xIMyP80xXUV8uW3boQ+larc2ymIVVIajUFjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br53JnmLCx5aJBrqg5mDHpMvWbN4luCQsy6FovGSFjQTRBWWq+HlS+iEd5sMw1HYv0sjFeeP0VrqlUaxN80d3rJ9UYc4jyU9wG9iKU4O/13iqG7D9PHzkLNBk5wvv9L30VP49f5f1Jhy7E3ckPlW0MFZU8zkii0yBLOcFhdNNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnksYq6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnksYq6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C331F000E9;
	Thu, 23 Jul 2026 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822650;
	bh=gLZ9JPwbmjrkDvuKuSlR5qFLR49kYg+whkxVLURTH/Q=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=HnksYq6eZo8N9BrMOTql+dQXagCTl1L0RpIK+qak6ykyJYIwu13jfs1FDwGoUXeOt
	 HZnshXJrsrGD6fKSFkdlUy4M+yXWtF2/WizJ5Y7nxsz0nmjONmS659SLdUfvIEKZxG
	 Xcu4kDlf1DcbQMaNqExzn/CMi5LDncQHL1Yk1ov78zjY7zUDIN6jCbsekN0su7qeiy
	 QUvMPsNPAlht1QOst8pebl808FYFA4XnUnzpGZUEskM93tfEsb87rifzlZp67hXoMV
	 cCLpvSnyQySVo8xNUfsP4FUqo0qW438mDSvK3xRXbcazCY16+AtwHWlpZBLubOaClo
	 8pldM4SxL51ig==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 79963CE0AD8; Thu, 23 Jul 2026 09:03:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 09:03:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chuyi Zhou <zhouchuyi@bytedance.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Usama Arif <usama.arif@linux.dev>
Subject: Re: linux-next: manual merge of the paulmck tree with the tip-fixes
 and tip trees
Message-ID: <a33f4038-8d48-475c-86ae-58458f79ff24@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <amInSCxaV5NRRWcT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amInSCxaV5NRRWcT@sirena.org.uk>

On Thu, Jul 23, 2026 at 03:38:00PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the paulmck tree got a conflict in:
> 
>   kernel/smp.c
> 
> between commits:
> 
>   35551efb155e3 ("smp: Make CSD lock acquisition atomic for debug mode")
>   ec9f57e6fefbc ("smp: Use release stores for csd_lock_record() state")
> 
> from the tip-fixes and tip trees and commit:
> 
>   c2d939be90724 ("smp: Make CSD lock acquisition atomic for debug mode")
> 
> from the paulmck tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Excellent!  I have dropped this from my tree in favor of tip-fixes.

							Thanx, Paul

> diff --combined kernel/smp.c
> index b696bcc60c08f,b9448fe3b84ff..0000000000000
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@@ -16,7 -16,6 +16,7 @@@
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
>   #include <linux/gfp.h>
>  +#include <linux/slab.h>
>   #include <linux/smp.h>
>   #include <linux/cpu.h>
>   #include <linux/sched.h>
> @@@ -64,14 -63,7 +64,14 @@@ int smpcfd_prepare_cpu(unsigned int cpu
>   		free_cpumask_var(cfd->cpumask);
>   		return -ENOMEM;
>   	}
>  -	cfd->csd = alloc_percpu(call_single_data_t);
>  +
>  +	/*
>  +	 * Allocate the per-CPU CSD the first time a CPU comes up. It is
>  +	 * not freed when the CPU is offlined, so csd_lock_wait() can access
>  +	 * it even when the CPU was offlined after preemption was re-enabled.
>  +	 */
>  +	if (!cfd->csd)
>  +		cfd->csd = alloc_percpu(call_single_data_t);
>   	if (!cfd->csd) {
>   		free_cpumask_var(cfd->cpumask);
>   		free_cpumask_var(cfd->cpumask_ipi);
> @@@ -87,6 -79,7 +87,6 @@@ int smpcfd_dead_cpu(unsigned int cpu
>   
>   	free_cpumask_var(cfd->cpumask);
>   	free_cpumask_var(cfd->cpumask_ipi);
>  -	free_percpu(cfd->csd);
>   	return 0;
>   }
>   
> @@@ -189,22 -182,16 +189,22 @@@ static atomic_t csd_bug_count = ATOMIC_
>   static void __csd_lock_record(call_single_data_t *csd)
>   {
>   	if (!csd) {
>  -		smp_mb(); /* NULL cur_csd after unlock. */
>  -		__this_cpu_write(cur_csd, NULL);
>  +		/*
>  +		 * Pairs with smp_load_acquire() of cur_csd in
>  +		 * csd_lock_wait_toolong(): orders any preceding CSD
>  +		 * callback/unlock before a remote reader observes NULL.
>  +		 */
>  +		smp_store_release(this_cpu_ptr(&cur_csd), NULL);
>   		return;
>   	}
>   	__this_cpu_write(cur_csd_func, csd->func);
>   	__this_cpu_write(cur_csd_info, csd->info);
>  -	smp_wmb(); /* func and info before csd. */
>  -	__this_cpu_write(cur_csd, csd);
>  -	smp_mb(); /* Update cur_csd before function call. */
>  -		  /* Or before unlock, as the case may be. */
>  +	/*
>  +	 * Pairs with smp_load_acquire() of cur_csd in
>  +	 * csd_lock_wait_toolong(): publishes cur_csd_func and
>  +	 * cur_csd_info before the non-NULL pointer becomes visible.
>  +	 */
>  +	smp_store_release(this_cpu_ptr(&cur_csd), csd);
>   }
>   
>   static __always_inline void csd_lock_record(call_single_data_t *csd)
> @@@ -285,13 -272,7 +285,13 @@@ static bool csd_lock_wait_toolong(call_
>   		cpux = 0;
>   	else
>   		cpux = cpu;
>  -	cpu_cur_csd = smp_load_acquire(&per_cpu(cur_csd, cpux)); /* Before func and info. */
>  +	/*
>  +	 * Pairs with smp_store_release() of cur_csd in __csd_lock_record():
>  +	 * a non-NULL cur_csd here implies cur_csd_func and cur_csd_info
>  +	 * are the matching publication; a NULL value is ordered after any
>  +	 * preceding CSD callback/unlock on the remote CPU.
>  +	 */
>  +	cpu_cur_csd = smp_load_acquire(&per_cpu(cur_csd, cpux));
>   	/* How long since this CSD lock was stuck. */
>   	ts_delta = ts2 - ts0;
>   	pr_alert("csd: %s non-responsive CSD lock (#%d) on CPU#%d, waiting %lld ns for CPU#%02d %pS(%ps).\n",
> @@@ -342,8 -323,6 +342,8 @@@ static void __csd_lock_wait(call_single
>   	int bug_id = 0;
>   	u64 ts0, ts1;
>   
>  +	guard(preempt)();
>  +
>   	ts1 = ts0 = ktime_get_mono_fast_ns();
>   	for (;;) {
>   		if (csd_lock_wait_toolong(csd, ts0, &ts1, &bug_id, &nmessages))
> @@@ -381,15 -360,14 +381,15 @@@ static __always_inline void csd_lock(ca
>   {
>   	if (IS_ENABLED(CONFIG_CSD_LOCK_WAIT_DEBUG) &&
>   	    static_branch_unlikely(&csdlock_debug_enabled)) {
>  -		unsigned int flags;
>   
>   		for (;;) {
>  +			unsigned int flags;
>  +
>   			__csd_lock_wait(csd);
>   			flags = READ_ONCE(csd->node.u_flags);
>  +
>   			if (!(flags & CSD_FLAG_LOCK) &&
>  -			    try_cmpxchg_acquire(&csd->node.u_flags, &flags,
>  -						flags | CSD_FLAG_LOCK))
>  +			    try_cmpxchg_acquire(&csd->node.u_flags, &flags, flags | CSD_FLAG_LOCK))
>   				break;
>   		}
>   	} else {
> @@@ -680,9 -658,17 +680,9 @@@ void flush_smp_call_function_queue(void
>   	local_irq_restore(flags);
>   }
>   
>  -/**
>  - * smp_call_function_single - Run a function on a specific CPU
>  - * @cpu: Specific target CPU for this function.
>  - * @func: The function to run. This must be fast and non-blocking.
>  - * @info: An arbitrary pointer to pass to the function.
>  - * @wait: If true, wait until function has completed on other CPUs.
>  - *
>  - * Returns: %0 on success, else a negative status code.
>  - */
>  -int smp_call_function_single(int cpu, smp_call_func_t func, void *info,
>  -			     int wait)
>  +static int __smp_call_function_single(int cpu, smp_call_func_t func,
>  +				      void *info, const struct cpumask *mask,
>  +				      bool wait)
>   {
>   	call_single_data_t *csd;
>   	call_single_data_t csd_stack = {
> @@@ -699,14 -685,6 +699,14 @@@
>   	 */
>   	this_cpu = get_cpu();
>   
>  +	if (mask) {
>  +		/* Try for same CPU (cheapest) */
>  +		if (!cpumask_test_cpu(this_cpu, mask))
>  +			cpu = sched_numa_find_nth_cpu(mask, 0, cpu_to_node(this_cpu));
>  +		else
>  +			cpu = this_cpu;
>  +	}
>  +
>   	/*
>   	 * Can deadlock when called with interrupts disabled.
>   	 * We allow cpu's that are not yet online though, as no one else can
> @@@ -739,32 -717,13 +739,32 @@@
>   
>   	err = generic_exec_single(cpu, csd);
>   
>  +	/*
>  +	 * @csd is stack-allocated when @wait is true. No concurrent access
>  +	 * except from the IPI completion path, so we can re-enable preemption
>  +	 * early to reduce latency.
>  +	 */
>  +	put_cpu();
>  +
>   	if (wait)
>   		csd_lock_wait(csd);
>   
>  -	put_cpu();
>  -
>   	return err;
>   }
>  +
>  +/**
>  + * smp_call_function_single - Run a function on a specific CPU
>  + * @cpu:	Specific target CPU for this function.
>  + * @func:	The function to run. This must be fast and non-blocking.
>  + * @info:	An arbitrary pointer to pass to the function.
>  + * @wait:	If true, wait until function has completed on other CPUs.
>  + *
>  + * Returns: %0 on success, else a negative status code.
>  + */
>  +int smp_call_function_single(int cpu, smp_call_func_t func, void *info, bool wait)
>  +{
>  +	return __smp_call_function_single(cpu, func, info, NULL, wait);
>  +}
>   EXPORT_SYMBOL(smp_call_function_single);
>   
>   /**
> @@@ -815,10 -774,10 +815,10 @@@ EXPORT_SYMBOL_GPL(smp_call_function_sin
>   
>   /**
>    * smp_call_function_any - Run a function on any of the given cpus
>  - * @mask: The mask of cpus it can run on.
>  - * @func: The function to run. This must be fast and non-blocking.
>  - * @info: An arbitrary pointer to pass to the function.
>  - * @wait: If true, wait until function has completed.
>  + * @mask:	The mask of cpus it can run on.
>  + * @func:	The function to run. This must be fast and non-blocking.
>  + * @info:	An arbitrary pointer to pass to the function.
>  + * @wait:	If true, wait until function has completed.
>    *
>    * Selection preference:
>    *	1) current cpu if in @mask
> @@@ -829,54 -788,20 +829,54 @@@
>   int smp_call_function_any(const struct cpumask *mask,
>   			  smp_call_func_t func, void *info, int wait)
>   {
>  -	unsigned int cpu;
>  -	int ret;
>  -
>  -	/* Try for same CPU (cheapest) */
>  -	cpu = get_cpu();
>  -	if (!cpumask_test_cpu(cpu, mask))
>  -		cpu = sched_numa_find_nth_cpu(mask, 0, cpu_to_node(cpu));
>  -
>  -	ret = smp_call_function_single(cpu, func, info, wait);
>  -	put_cpu();
>  -	return ret;
>  +	return __smp_call_function_single(-1, func, info, mask, wait);
>   }
>   EXPORT_SYMBOL_GPL(smp_call_function_any);
>   
>  +static DEFINE_STATIC_KEY_FALSE(ipi_mask_inlined);
>  +
>  +#ifdef CONFIG_PREEMPTION
>  +
>  +int smp_task_ipi_mask_alloc(struct task_struct *task)
>  +{
>  +	if (static_branch_unlikely(&ipi_mask_inlined))
>  +		return 0;
>  +
>  +	ACCESS_PRIVATE(task, ipi_mask).ipi_mask_ptr =
>  +		kmalloc(cpumask_size(), GFP_KERNEL);
>  +	if (!ACCESS_PRIVATE(task, ipi_mask).ipi_mask_ptr)
>  +		return -ENOMEM;
>  +
>  +	return 0;
>  +}
>  +
>  +void smp_task_ipi_mask_free(struct task_struct *task)
>  +{
>  +	if (static_branch_unlikely(&ipi_mask_inlined))
>  +		return;
>  +
>  +	kfree(ACCESS_PRIVATE(task, ipi_mask).ipi_mask_ptr);
>  +}
>  +
>  +static cpumask_t *smp_task_ipi_mask(struct task_struct *cur)
>  +{
>  +	/*
>  +	 * If cpumask_size() is smaller than or equal to the pointer
>  +	 * size, it stashes the cpumask in the pointer itself to
>  +	 * avoid extra memory allocations.
>  +	 */
>  +	if (static_branch_unlikely(&ipi_mask_inlined))
>  +		return (cpumask_t *)&ACCESS_PRIVATE(cur, ipi_mask).ipi_mask_val;
>  +
>  +	return ACCESS_PRIVATE(cur, ipi_mask).ipi_mask_ptr;
>  +}
>  +#else
>  +static cpumask_t *smp_task_ipi_mask(struct task_struct *cur)
>  +{
>  +	return NULL;
>  +}
>  +#endif
>  +
>   /*
>    * Flags to be used as scf_flags argument of smp_call_function_many_cond().
>    *
> @@@ -891,20 -816,13 +891,20 @@@ static void smp_call_function_many_cond
>   					unsigned int scf_flags,
>   					smp_cond_func_t cond_func)
>   {
>  -	int cpu, last_cpu, this_cpu = smp_processor_id();
>  -	struct call_function_data *cfd;
>  +	struct cpumask *cpumask, *task_mask;
>   	bool wait = scf_flags & SCF_WAIT;
>  -	int nr_cpus = 0;
>  +	struct call_function_data *cfd;
>  +	int cpu, last_cpu, this_cpu;
>   	bool run_remote = false;
>  +	int nr_cpus = 0;
>   
>  -	lockdep_assert_preemption_disabled();
>  +	this_cpu = get_cpu();
>  +	cfd = this_cpu_ptr(&cfd_data);
>  +	task_mask = smp_task_ipi_mask(current);
>  +	if (task_mask)
>  +		cpumask = task_mask;
>  +	else
>  +		cpumask = cfd->cpumask;
>   
>   	/*
>   	 * Can deadlock when called with interrupts disabled.
> @@@ -926,15 -844,16 +926,15 @@@
>   
>   	/* Check if we need remote execution, i.e., any CPU excluding this one. */
>   	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
>  -		cfd = this_cpu_ptr(&cfd_data);
>  -		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
>  -		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
>  +		cpumask_and(cpumask, mask, cpu_online_mask);
>  +		__cpumask_clear_cpu(this_cpu, cpumask);
>   
>   		cpumask_clear(cfd->cpumask_ipi);
>  -		for_each_cpu(cpu, cfd->cpumask) {
>  +		for_each_cpu(cpu, cpumask) {
>   			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
>   
>   			if (cond_func && !cond_func(cpu, info)) {
>  -				__cpumask_clear_cpu(cpu, cfd->cpumask);
>  +				__cpumask_clear_cpu(cpu, cpumask);
>   				continue;
>   			}
>   
> @@@ -984,18 -903,8 +984,18 @@@
>   		local_irq_restore(flags);
>   	}
>   
>  +	/*
>  +	 * The IPI work has been queued and dispatched. On PREEMPT kernels,
>  +	 * tasks created through dup_task_struct() have task-local wait masks.
>  +	 * The boot init_task can fall back to cfd->cpumask when the mask is
>  +	 * not inlined, but other tasks still use task-local masks and cannot
>  +	 * overwrite it. On !PREEMPT kernels, preempt_enable() cannot schedule
>  +	 * another task, so the per-CPU mask remains protected.
>  +	 */
>  +	put_cpu();
>  +
>   	if (run_remote && wait) {
>  -		for_each_cpu(cpu, cfd->cpumask) {
>  +		for_each_cpu(cpu, cpumask) {
>   			call_single_data_t *csd;
>   
>   			csd = per_cpu_ptr(cfd->csd, cpu);
> @@@ -1006,14 -915,15 +1006,14 @@@
>   
>   /**
>    * smp_call_function_many() - Run a function on a set of CPUs.
>  - * @mask: The set of cpus to run on (only runs on online subset).
>  - * @func: The function to run. This must be fast and non-blocking.
>  - * @info: An arbitrary pointer to pass to the function.
>  - * @wait: If true, wait (atomically) until function has completed
>  - *        on other CPUs.
>  + * @mask:	The set of cpus to run on (only runs on online subset).
>  + * @func:	The function to run. This must be fast and non-blocking.
>  + * @info:	An arbitrary pointer to pass to the function.
>  + * @wait:	If true, wait (atomically) until function has completed
>  + *		on other CPUs.
>    *
>    * You must not call this function with disabled interrupts or from a
>  - * hardware interrupt handler or from a bottom half handler. Preemption
>  - * must be disabled when calling this function.
>  + * hardware interrupt handler or from a bottom half handler.
>    *
>    * @func is not called on the local CPU even if @mask contains it.  Consider
>    * using on_each_cpu_cond_mask() instead if this is not desirable.
> @@@ -1027,10 -937,10 +1027,10 @@@ EXPORT_SYMBOL(smp_call_function_many)
>   
>   /**
>    * smp_call_function() - Run a function on all other CPUs.
>  - * @func: The function to run. This must be fast and non-blocking.
>  - * @info: An arbitrary pointer to pass to the function.
>  - * @wait: If true, wait (atomically) until function has completed
>  - *        on other CPUs.
>  + * @func:	The function to run. This must be fast and non-blocking.
>  + * @info:	An arbitrary pointer to pass to the function.
>  + * @wait:	If true, wait (atomically) until function has completed
>  + *		on other CPUs.
>    *
>    * If @wait is true, then returns once @func has returned; otherwise
>    * it returns just before the target cpu calls @func.
> @@@ -1040,8 -950,9 +1040,8 @@@
>    */
>   void smp_call_function(smp_call_func_t func, void *info, int wait)
>   {
>  -	preempt_disable();
>  -	smp_call_function_many(cpu_online_mask, func, info, wait);
>  -	preempt_enable();
>  +	smp_call_function_many_cond(cpu_online_mask, func, info,
>  +				    wait ? SCF_WAIT : 0, NULL);
>   }
>   EXPORT_SYMBOL(smp_call_function);
>   
> @@@ -1107,9 -1018,6 +1107,9 @@@ EXPORT_SYMBOL(nr_cpu_ids)
>   void __init setup_nr_cpu_ids(void)
>   {
>   	set_nr_cpu_ids(find_last_bit(cpumask_bits(cpu_possible_mask), NR_CPUS) + 1);
>  +
>  +	if (IS_ENABLED(CONFIG_PREEMPTION) && cpumask_size() <= sizeof(unsigned long))
>  +		static_branch_enable(&ipi_mask_inlined);
>   }
>   
>   /* Called by boot processor to activate the rest. */
> @@@ -1146,14 -1054,12 +1146,14 @@@ void __init smp_init(void
>    * @func:	The function to run on all applicable CPUs.
>    *		This must be fast and non-blocking.
>    * @info:	An arbitrary pointer to pass to both functions.
>  - * @wait:	If true, wait (atomically) until function has
>  - *		completed on other CPUs.
>  + * @wait:	If true, wait until function has completed on other CPUs.
>    * @mask:	The set of cpus to run on (only runs on online subset).
>    *
>  - * Preemption is disabled to protect against CPUs going offline but not online.
>  - * CPUs going online during the call will not be seen or sent an IPI.
>  + * Target CPU selection and work queueing are done with preemption
>  + * disabled. This protects against CPUs going offline, but not against
>  + * CPUs coming online concurrently; newly online CPUs are not guaranteed
>  + * to be seen or sent an IPI. If @wait is true, the final wait for remote
>  + * completion happens after that preemption-disabled section.
>    *
>    * You must not call this function with disabled interrupts or
>    * from a hardware interrupt handler or from a bottom half handler.
> @@@ -1166,7 -1072,9 +1166,7 @@@ void on_each_cpu_cond_mask(smp_cond_fun
>   	if (wait)
>   		scf_flags |= SCF_WAIT;
>   
>  -	preempt_disable();
>   	smp_call_function_many_cond(mask, func, info, scf_flags, cond_func);
>  -	preempt_enable();
>   }
>   EXPORT_SYMBOL(on_each_cpu_cond_mask);
>   


