From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: ia64 won't boot because of rcu_sched self-detected stall
Date: Wed, 22 Aug 2012 08:29:35 -0700
Message-ID: <20120822152935.GB2447@linux.vnet.ibm.com>
References: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
 <20120821232038.GV2456@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F19396504@ORSMSX104.amr.corp.intel.com>
 <20120822004608.GW2456@linux.vnet.ibm.com>
 <20120822151200.GB13674@somewhere>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:42052 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752766Ab2HVPiY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Aug 2012 11:38:24 -0400
Received: from /spool/local
	by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 22 Aug 2012 11:38:22 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id F3C70C900E9
	for <linux-next@vger.kernel.org>; Wed, 22 Aug 2012 11:37:44 -0400 (EDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q7MFbgib113688
	for <linux-next@vger.kernel.org>; Wed, 22 Aug 2012 11:37:43 -0400
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q7MFb1qR009734
	for <linux-next@vger.kernel.org>; Wed, 22 Aug 2012 09:37:01 -0600
Content-Disposition: inline
In-Reply-To: <20120822151200.GB13674@somewhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Aug 22, 2012 at 05:12:03PM +0200, Frederic Weisbecker wrote:
> On Tue, Aug 21, 2012 at 05:46:08PM -0700, Paul E. McKenney wrote:
> > On Tue, Aug 21, 2012 at 11:53:50PM +0000, Luck, Tony wrote:
> > > Thanks for the pointers.
> > > 
> > > I turned on CONFIG_RCU_CPU_STALL_INFO=y and bumped RCU_STALL_RAT_DELAY
> > > from 2 to 20
> > > 
> > > This is the new console log.  There is a minute of hang before the first
> > > pair of stack traces. Then hang for a minute and the second pair show
> > > up.
> > > 
> > > Linux version 3.6.0-rc2-zx1-smp-next-20120821 (aegl@linux-bxb1) (gcc version 4.3.4 [gcc-4_3-branch revision 152973] (SUSE Linux) ) #2 SMP Tue Aug 21 16:44:17 PDT 2012
> > > EFI v1.10 by HP: SALsystab=0x3fefa000 ACPI 2.0=0x3fd5e000 SMBIOS=0x3fefc000 HCDP=0x3fd5c000
> > > Early serial console at MMIO 0xff5e0000 (options '9600')
> > > bootconsole [uart0] enabled
> > > PCDP: v0 at 0x3fd5c000
> > > Explicit "console="; ignoring PCDP
> > > ACPI: RSDP 000000003fd5e000 00028 (v02     HP)
> > > ACPI: XSDT 000000003fd5e02c 00094 (v01     HP   rx2620 00000000   HP 00000000)
> > > ACPI: FACP 000000003fd67390 000F4 (v03     HP   rx2620 00000000   HP 00000000)
> > > ACPI BIOS Bug: Warning: 32/64X length mismatch in FADT/Gpe0Block: 32/16 (20120711/tbfadt-567)
> > > ACPI BIOS Bug: Warning: 32/64X length mismatch in FADT/Gpe1Block: 32/16 (20120711/tbfadt-567)
> > > ACPI: DSDT 000000003fd5e100 05F3C (v01     HP   rx2620 00000007 INTL 02012044)
> > > ACPI: FACS 000000003fd67488 00040
> > > ACPI: SPCR 000000003fd674c8 00050 (v01     HP   rx2620 00000000   HP 00000000)
> > > ACPI: DBGP 000000003fd67518 00034 (v01     HP   rx2620 00000000   HP 00000000)
> > > ACPI: APIC 000000003fd67610 000B0 (v01     HP   rx2620 00000000   HP 00000000)
> > > ACPI: SPMI 000000003fd67550 00050 (v04     HP   rx2620 00000000   HP 00000000)
> > > ACPI: CPEP 000000003fd675a0 00034 (v01     HP   rx2620 00000000   HP 00000000)
> > > ACPI: SSDT 000000003fd64040 001D6 (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd64220 00702 (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd64930 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd65350 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd65d70 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd66790 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd671b0 000EB (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: SSDT 000000003fd672a0 000EF (v01     HP   rx2620 00000006 INTL 02012044)
> > > ACPI: Local APIC address c0000000fee00000
> > > 2 CPUs available, 2 CPUs total
> > > warning: skipping physical page 0
> > > Initial ramdisk at: 0xe00000407e9bb000 (6071698 bytes)
> > > SAL 3.1: HP version 3.15
> > > SAL Platform features: None
> > > SAL: AP wakeup using external interrupt vector 0xff
> > > MCA related initialization done
> > > warning: skipping physical page 0
> > > Zone ranges:
> > >   DMA      [mem 0x00004000-0xffffffff]
> > >   Normal   [mem 0x100000000-0x407ffc7fff]
> > > Movable zone start for each node
> > > Early memory node ranges
> > >   node   0: [mem 0x00004000-0x3f4ebfff]
> > >   node   0: [mem 0x3fc00000-0x3fd5bfff]
> > >   node   0: [mem 0x4040000000-0x407fd2bfff]
> > >   node   0: [mem 0x407fd98000-0x407fe07fff]
> > >   node   0: [mem 0x407fe80000-0x407ffc7fff]
> > > Virtual mem_map starts at 0xa0007fffc7900000
> > > Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 72586
> > > Kernel command line: BOOT_IMAGE=scsi0:\efi\SuSE\l-zx1-smp.gz root=/dev/disk/by-id/scsi-200000e1100a5d5f2-part2  console=uart,mmio,0xff5e0000 
> > > PID hash table entries: 4096 (order: 1, 32768 bytes)
> > > Dentry cache hash table entries: 262144 (order: 7, 2097152 bytes)
> > > Inode-cache hash table entries: 131072 (order: 6, 1048576 bytes)
> > > Memory: 2048432k/2086064k available (13698k code, 37632k reserved, 5791k data, 816k init)
> > > SLUB: Genslabs=17, HWalign=128, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> > > Hierarchical RCU implementation.
> > > 	Additional per-CPU info printed with stalls.
> > > 	RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=2.
> > > NR_IRQS:768
> > > ACPI: Local APIC address c0000000fee00000
> > > GSI 36 (level, low) -> CPU 0 (0x0000) vector 48
> > > Console: colour dummy device 80x25
> > > Calibrating delay loop... 1945.60 BogoMIPS (lpj=3891200)
> > > pid_max: default: 32768 minimum: 301
> > > Mount-cache hash table entries: 1024
> > > ACPI: Core revision 20120711
> > > Boot processor id 0x0/0x0
> > > Fixed BSP b0 value from CPU 1
> > > CPU 1: synchronized ITC with CPU 0 (last diff -3 cycles, maxerr 579 cycles)
> > > Brought up 2 CPUs
> > > Total of 2 processors activated (3891.20 BogoMIPS).
> > > SMBIOS 2.3 present.
> > > NET: Registered protocol family 16
> > > ACPI: bus type pci registered
> > > bio: create slab <bio-0> at 0
> > > ACPI: Added _OSI(Module Device)
> > > ACPI: Added _OSI(Processor Device)
> > > ACPI: Added _OSI(3.0 _SCP Extensions)
> > > ACPI: Added _OSI(Processor Aggregator Device)
> > > INFO: rcu_sched self-detected stall on CPU
> > > 	1: (15000 ticks this GP) idle=001/140000000000001/0 
> > 
> > OK, this is strange.  The stacks below would lead me to believe that
> > the CPUs are idle.  But the idle= value above says that RCU believes
> > that this CPU was executing in non-idle process context when the
> > interrupt occurred.
> > 
> > OK, time to take a look at the IA64 idle loop.  And I don't see any
> > calls to rcu_idle_enter()...  Please see below for my best guess as
> > to where to place it and rcu_idle_exit() -- the rule is that there must
> > be no use of RCU read-side critical sections between the call to the
> > rcu_idle_enter() and the rcu_idle_exit(), so you probably know better
> > than I where to put them.
> > 
> > void __attribute__((noreturn))
> > cpu_idle (void)
> > {
> > 	void (*mark_idle)(int) = ia64_mark_idle;
> >   	int cpu = smp_processor_id();
> > 
> > 	/* endless idle loop with no priority at all */
> > 	while (1) {
> > 		rcu_idle_enter();  /* HERE */
> > 		if (can_do_pal_halt) {
> > 			current_thread_info()->status &= ~TS_POLLING;
> > 			/*
> > 			 * TS_POLLING-cleared state must be visible before we
> > 			 * test NEED_RESCHED:
> > 			 */
> > 			smp_mb();
> > 		} else {
> > 			current_thread_info()->status |= TS_POLLING;
> > 		}
> > 
> > 		if (!need_resched()) {
> > 			void (*idle)(void);
> > #ifdef CONFIG_SMP
> > 			min_xtp();
> > #endif
> > 			rmb();
> > 			if (mark_idle)
> > 				(*mark_idle)(1);
> > 
> > 			idle = pm_idle;
> > 			if (!idle)
> > 				idle = default_idle;
> > 			(*idle)();
> > 			if (mark_idle)
> > 				(*mark_idle)(0);
> > #ifdef CONFIG_SMP
> > 			normal_xtp();
> > #endif
> > 		}
> > 		rcu_idle_exit();  /* AND HERE */
> > 		schedule_preempt_disabled();
> > 		check_pgt_cache();
> > 		if (cpu_is_offline(cpu))
> > 			play_dead();
> > 	}
> > }
> > 
> > Without the calls to rcu_idle_enter() and rcu_idle_exit(), RCU has no
> > way of knowing that the CPU is idle, so waits forever for a context
> > switch.
> > 
> > Ah, I bet I know what happened...  I don't see tick_nohz_idle_enter(),
> > so I would guess that there is no dyntick-idle, so the recent changes in
> > dyntick-idle didn't cause rcu_idle_enter() to be added.
> > 
> > I wonder how many other architectures don't do dyntick-idle?
> > 
> > Looks like about 12 more.  Probably need fixing as well...
> 
> Ouch, that's bad. Ok see below for the conversion of other architectures.
> 
> While doing this, I realized that most of these archs just use the same
> cpu_idle() function, basically:
> 
> void cpu_idle(void)
> {
> 	while (1) {
> +		rcu_idle_enter();
> 		while (!need_resched())
> 			do_arch_thing();
> +		rcu_idle_exit();
> 		schedule_preempt_disabled();
> 	}
> }
> 
> So I think it may be worth creating a "simple idle loop" generic function
> for those archs that they can call. This way there is less conversion to do.
> 
> Now this is all a regression, so IMO we should first fix the things locally and
> do that generic idle loop later, since it's rather a feature.
> 
> Hmm?

Makes sense to me!  And the patches look sane, but I must defer to the
arch maintainers.

							Thanx, Paul

> I'm cooking the patches.
> 
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index 153d3fc..2ebf7b5 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -28,6 +28,7 @@
>  #include <linux/tty.h>
>  #include <linux/console.h>
>  #include <linux/slab.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/reg.h>
>  #include <asm/uaccess.h>
> @@ -50,13 +51,16 @@ cpu_idle(void)
>  {
>  	set_thread_flag(TIF_POLLING_NRFLAG);
> 
> +	preempt_disable();
>  	while (1) {
>  		/* FIXME -- EV6 and LCA45 know how to power down
>  		   the CPU.  */
> 
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			cpu_relax();
> -		schedule();
> +		rcu_idle_exit();
> +		schedule_preempt_disabled();
>  	}
>  }
> 
> diff --git a/arch/cris/kernel/process.c b/arch/cris/kernel/process.c
> index 66fd017..7f65be6 100644
> --- a/arch/cris/kernel/process.c
> +++ b/arch/cris/kernel/process.c
> @@ -25,6 +25,7 @@
>  #include <linux/elfcore.h>
>  #include <linux/mqueue.h>
>  #include <linux/reboot.h>
> +#include <linux/rcupdate.h>
> 
>  //#define DEBUG
> 
> @@ -74,6 +75,7 @@ void cpu_idle (void)
>  {
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched()) {
>  			void (*idle)(void);
>  			/*
> @@ -86,6 +88,7 @@ void cpu_idle (void)
>  				idle = default_idle;
>  			idle();
>  		}
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> diff --git a/arch/frv/kernel/process.c b/arch/frv/kernel/process.c
> index ff95f50..2eb7fa5 100644
> --- a/arch/frv/kernel/process.c
> +++ b/arch/frv/kernel/process.c
> @@ -25,6 +25,7 @@
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/pagemap.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/asm-offsets.h>
>  #include <asm/uaccess.h>
> @@ -69,12 +70,14 @@ void cpu_idle(void)
>  {
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched()) {
>  			check_pgt_cache();
> 
>  			if (!frv_dma_inprogress && idle)
>  				idle();
>  		}
> +		rcu_idle_exit();
> 
>  		schedule_preempt_disabled();
>  	}
> diff --git a/arch/h8300/kernel/process.c b/arch/h8300/kernel/process.c
> index 0e9c315..f153ed1 100644
> --- a/arch/h8300/kernel/process.c
> +++ b/arch/h8300/kernel/process.c
> @@ -36,6 +36,7 @@
>  #include <linux/reboot.h>
>  #include <linux/fs.h>
>  #include <linux/slab.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/uaccess.h>
>  #include <asm/traps.h>
> @@ -78,8 +79,10 @@ void (*idle)(void) = default_idle;
>  void cpu_idle(void)
>  {
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			idle();
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> diff --git a/arch/m32r/kernel/process.c b/arch/m32r/kernel/process.c
> index 3a4a32b2..384e63f 100644
> --- a/arch/m32r/kernel/process.c
> +++ b/arch/m32r/kernel/process.c
> @@ -26,6 +26,7 @@
>  #include <linux/ptrace.h>
>  #include <linux/unistd.h>
>  #include <linux/hardirq.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/io.h>
>  #include <asm/uaccess.h>
> @@ -82,6 +83,7 @@ void cpu_idle (void)
>  {
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched()) {
>  			void (*idle)(void) = pm_idle;
> 
> @@ -90,6 +92,7 @@ void cpu_idle (void)
> 
>  			idle();
>  		}
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
> index c488e3c..ac2892e 100644
> --- a/arch/m68k/kernel/process.c
> +++ b/arch/m68k/kernel/process.c
> @@ -25,6 +25,7 @@
>  #include <linux/reboot.h>
>  #include <linux/init_task.h>
>  #include <linux/mqueue.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/uaccess.h>
>  #include <asm/traps.h>
> @@ -75,8 +76,10 @@ void cpu_idle(void)
>  {
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			idle();
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> diff --git a/arch/mn10300/kernel/process.c b/arch/mn10300/kernel/process.c
> index 7dab0cd..e9cceba 100644
> --- a/arch/mn10300/kernel/process.c
> +++ b/arch/mn10300/kernel/process.c
> @@ -25,6 +25,7 @@
>  #include <linux/err.h>
>  #include <linux/fs.h>
>  #include <linux/slab.h>
> +#include <linux/rcupdate.h>
>  #include <asm/uaccess.h>
>  #include <asm/pgtable.h>
>  #include <asm/io.h>
> @@ -107,6 +108,7 @@ void cpu_idle(void)
>  {
>  	/* endless idle loop with no priority at all */
>  	for (;;) {
> +		rcu_idle_enter();
>  		while (!need_resched()) {
>  			void (*idle)(void);
> 
> @@ -121,6 +123,7 @@ void cpu_idle(void)
>  			}
>  			idle();
>  		}
> +		rcu_idle_exit();
> 
>  		schedule_preempt_disabled();
>  	}
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index d4b94b3..c54a4db 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -48,6 +48,7 @@
>  #include <linux/unistd.h>
>  #include <linux/kallsyms.h>
>  #include <linux/uaccess.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/io.h>
>  #include <asm/asm-offsets.h>
> @@ -69,8 +70,10 @@ void cpu_idle(void)
> 
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			barrier();
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  		check_pgt_cache();
>  	}
> diff --git a/arch/score/kernel/process.c b/arch/score/kernel/process.c
> index 2707023..637970c 100644
> --- a/arch/score/kernel/process.c
> +++ b/arch/score/kernel/process.c
> @@ -27,6 +27,7 @@
>  #include <linux/reboot.h>
>  #include <linux/elfcore.h>
>  #include <linux/pm.h>
> +#include <linux/rcupdate.h>
> 
>  void (*pm_power_off)(void);
>  EXPORT_SYMBOL(pm_power_off);
> @@ -50,9 +51,10 @@ void __noreturn cpu_idle(void)
>  {
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			barrier();
> -
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> diff --git a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
> index 2c8d6a3..bc44311 100644
> --- a/arch/xtensa/kernel/process.c
> +++ b/arch/xtensa/kernel/process.c
> @@ -31,6 +31,7 @@
>  #include <linux/mqueue.h>
>  #include <linux/fs.h>
>  #include <linux/slab.h>
> +#include <linux/rcupdate.h>
> 
>  #include <asm/pgtable.h>
>  #include <asm/uaccess.h>
> @@ -110,8 +111,10 @@ void cpu_idle(void)
> 
>  	/* endless idle loop with no priority at all */
>  	while (1) {
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			platform_idle();
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> 
> 		
> 
