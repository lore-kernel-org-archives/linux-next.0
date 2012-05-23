From: Chen Gong <gong.chen@linux.intel.com>
Subject: Re: [PATCH] x86: auto poll/interrupt mode switch for CMC to stop
 CMC storm
Date: Wed, 23 May 2012 10:30:46 +0800
Message-ID: <4FBC4BD6.3080103@linux.intel.com>
References: <1337740225-26673-1-git-send-email-gong.chen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:19178 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751035Ab2EWCas (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 May 2012 22:30:48 -0400
In-Reply-To: <1337740225-26673-1-git-send-email-gong.chen@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chen Gong <gong.chen@linux.intel.com>
Cc: tony.luck@intel.com, bp@amd64.org, linux-next@vger.kernel.org

=E4=BA=8E 2012/5/23 10:30, Chen Gong =E5=86=99=E9=81=93:
> This idea is inspired from IA64 implementation. It is like NAPI for
> network stack. When CMCI is too many to handle, this interrupt can
> be disabled and then poll mode will take over the events handle.
> When no more events happen in the system, CMC interrupt can be
> enabled automatically.
>=20
> Signed-off-by: Chen Gong <gong.chen@linux.intel.com> ---=20
> arch/x86/kernel/cpu/mcheck/mce.c |   83
> +++++++++++++++++++++++++++++++++++++- 1 file changed, 81
> insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/x86/kernel/cpu/mcheck/mce.c
> b/arch/x86/kernel/cpu/mcheck/mce.c index d086a09..6334f0d 100644=20
> --- a/arch/x86/kernel/cpu/mcheck/mce.c +++
> b/arch/x86/kernel/cpu/mcheck/mce.c @@ -92,6 +92,7 @@ static char
> *mce_helper_argv[2] =3D { mce_helper, NULL };
>=20
> static DECLARE_WAIT_QUEUE_HEAD(mce_chrdev_wait);
>=20
> +static DEFINE_PER_CPU(struct timer_list, mce_timer); static
> DEFINE_PER_CPU(struct mce, mces_seen); static int			cpu_missing;
>=20
> @@ -100,8 +101,28 @@ DEFINE_PER_CPU(mce_banks_t, mce_poll_banks) =3D
> { [0 ... BITS_TO_LONGS(MAX_NR_BANKS)-1] =3D ~0UL };
>=20
> +#define CMC_POLL_INTERVAL	(1 * 30) +#define CMC_STORM		5 +static
> DEFINE_PER_CPU(int, cmci_storm_warning); +static
> DEFINE_PER_CPU(unsigned long, first_cmci_jiffie); +static
> DEFINE_SPINLOCK(cmc_poll_lock); + +/* + * This variable tells
> whether we are in cmci-storm-happened mode. + * Start with this in
> the wrong state so we won't play w/ timers + * before the system is
> ready. + */ +static int cmci_storm_detected =3D 1; + static
> DEFINE_PER_CPU(struct work_struct, mce_work);
>=20
> +static void mce_disable_cmci(void *data); +static void
> mce_enable_ce(void *all); +static void cmc_disable_keventd(struct
> work_struct *dummy); +static void cmc_enable_keventd(struct
> work_struct *dummy); + +static DECLARE_WORK(cmc_disable_work,
> cmc_disable_keventd); +static DECLARE_WORK(cmc_enable_work,
> cmc_enable_keventd); /* * CPU/chipset specific EDAC code can
> register a notifier call here to print * MCE errors in a
> human-readable form. @@ -582,6 +603,37 @@ void
> machine_check_poll(enum mcp_flags flags, mce_banks_t *b) { struct
> mce m; int i; +	unsigned long flag; + +
> spin_lock_irqsave(&cmc_poll_lock, flag); +	if (cmci_storm_detected
> =3D=3D 0) { +		unsigned long now =3D jiffies; +		int *count =3D
> &__get_cpu_var(cmci_storm_warning); +		unsigned long *history =3D
> &__get_cpu_var(first_cmci_jiffie); + +		if (time_before_eq(now,
> *history + HZ)) +			(*count)++; +		else { +			*count =3D 0; +
> *history =3D now; +		} + +		if (*count >=3D CMC_STORM) { +
> cmci_storm_detected =3D 1; +			/* If we're being hit with CMC
> interrupts, we won't +			 * ever execute the schedule_work() below.
> Need to +			 * disable CMC interrupts on this processor now. +
> */ +			mce_disable_cmci(NULL); +			if
> (!work_pending(&cmc_disable_work)) +
> schedule_work(&cmc_disable_work); +
> spin_unlock_irqrestore(&cmc_poll_lock, flag); +
> printk(KERN_WARNING "WARNING: Switching to polling "\ +				"CMC
> handler; error records may be lost\n"); +			goto out; +		} +	} +
> spin_unlock_irqrestore(&cmc_poll_lock, flag);
>=20
> percpu_inc(mce_poll_count);
>=20
> @@ -628,6 +680,7 @@ void machine_check_poll(enum mcp_flags flags,
> mce_banks_t *b) mce_wrmsrl(MSR_IA32_MCx_STATUS(i), 0); }
>=20
> +out: /* * Don't clear MCG_STATUS here because it's only defined
> for * exceptions. @@ -1199,6 +1252,20 @@ static void
> mce_process_work(struct work_struct *dummy) memory_failure(pfn,
> MCE_VECTOR, 0); }
>=20
> +static void cmc_disable_keventd(struct work_struct *dummy) +{ +
> struct timer_list *t =3D __this_cpu_ptr(&mce_timer); + +
> on_each_cpu(mce_disable_cmci, NULL, 0); +	mod_timer(t, jiffies +
> CMC_POLL_INTERVAL * HZ); +} + +static void
> cmc_enable_keventd(struct work_struct *dummy) +{ +	/* don't
> re-initiate timer */ +	on_each_cpu(mce_enable_ce, NULL, 0); +} +=20
> #ifdef CONFIG_X86_MCE_INTEL /*** * mce_log_therm_throt_event - Logs
> the thermal throttling event to mcelog @@ -1232,12 +1299,12 @@ void
> mce_log_therm_throt_event(__u64 status) static int check_interval =3D
> 5 * 60; /* 5 minutes */
>=20
> static DEFINE_PER_CPU(int, mce_next_interval); /* in jiffies */=20
> -static DEFINE_PER_CPU(struct timer_list, mce_timer);
>=20
> static void mce_start_timer(unsigned long data) { struct timer_list
> *t =3D &per_cpu(mce_timer, data); int *n; +	unsigned long flags;
>=20
> WARN_ON(smp_processor_id() !=3D data);
>=20
> @@ -1253,8 +1320,19 @@ static void mce_start_timer(unsigned long
> data) n =3D &__get_cpu_var(mce_next_interval); if (mce_notify_irq())=20
> *n =3D max(*n/2, HZ/100); -	else +	else { *n =3D min(*n*2,
> (int)round_jiffies_relative(check_interval*HZ)); +		/* if no CMC
> event, switch out of polling mode */ +
> spin_lock_irqsave(&cmc_poll_lock, flags); +		if
> (cmci_storm_detected =3D=3D 1) { +			printk(KERN_WARNING "Returning t=
o
> interrupt driven "\ +					"CMC handler\n"); +			if
> (!work_pending(&cmc_enable_work)) +
> schedule_work(&cmc_enable_work); +			cmci_storm_detected =3D 0; +		}=20
> +		spin_unlock_irqrestore(&cmc_poll_lock, flags); +	}
>=20
> t->expires =3D jiffies + *n; add_timer_on(t, smp_processor_id()); @@
> -1547,6 +1625,7 @@ void __cpuinit mcheck_cpu_init(struct
> cpuinfo_x86 *c) __mcheck_cpu_init_generic();=20
> __mcheck_cpu_init_vendor(c); __mcheck_cpu_init_timer(); +
> cmci_storm_detected =3D 0; INIT_WORK(&__get_cpu_var(mce_work),
> mce_process_work); init_irq_work(&__get_cpu_var(mce_irq_work),
> &mce_irq_work_cb); }

Oops, I send it to wrong LKML address. I will send this patch again.
