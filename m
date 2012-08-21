From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: ia64 won't boot because of rcu_sched self-detected stall
Date: Tue, 21 Aug 2012 16:20:38 -0700
Message-ID: <20120821232038.GV2456@linux.vnet.ibm.com>
References: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:37081 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911Ab2HUXUn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Aug 2012 19:20:43 -0400
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 21 Aug 2012 17:20:42 -0600
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com [9.17.195.226])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 32EB719D803C
	for <linux-next@vger.kernel.org>; Tue, 21 Aug 2012 17:20:40 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q7LNKd2l175760
	for <linux-next@vger.kernel.org>; Tue, 21 Aug 2012 17:20:39 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q7LNKdeX022854
	for <linux-next@vger.kernel.org>; Tue, 21 Aug 2012 17:20:39 -0600
Content-Disposition: inline
In-Reply-To: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org

On Tue, Aug 21, 2012 at 03:45:52PM -0700, Tony Luck wrote:
> last few linux-next builds (at least from next-20120806 to
> next-20120821) fail to boot on ia64 with these messages:
> 
>  ...
> Total of 2 processors activated (3891.20 BogoMIPS).
> SMBIOS 2.3 present.
> NET: Registered protocol family 16
> ACPI: bus type pci registered
> bio: create slab <bio-0> at 0
> ACPI: Added _OSI(Module Device)
> ACPI: Added _OSI(Processor Device)
> ACPI: Added _OSI(3.0 _SCP Extensions)
> ACPI: Added _OSI(Processor Aggregator Device)
> INFO: rcu_sched self-detected stall on CPUINFO: rcu_sched detected
> stalls on CPUs/tasks: { 1} (detected by 0, t=15002 jiffies)

Two of them simultaneously, it appears.  Looks like CPU 1 detected itself
about the same time that CPU 0 detected it.  Which is a bit strange,
given that the code gives the CPU a couple of jiffies to complain about
itself before other CPUs are allowed to complain.  Was this a guest OS?
Is the system heavily loaded during boot?

> Call Trace:
>  [<a0000001000154e0>] show_stack+0x80/0xa0
>                                 sp=a000000101247a20 bsp=a0000001012410b0
>  [<a000000100d76df0>] dump_stack+0x30/0x50
>                                 sp=a000000101247bf0 bsp=a000000101241098
>  [<a0000001001311e0>] print_other_cpu_stall+0x440/0x540
>                                 sp=a000000101247bf0 bsp=a000000101241038
>  [<a000000100131860>] rcu_check_callbacks+0x580/0x780
>                                 sp=a000000101247bf0 bsp=a000000101240fd8
>  [<a0000001000967d0>] update_process_times+0x50/0xa0
>                                 sp=a000000101247bf0 bsp=a000000101240fa8
>  [<a00000010003f7f0>] timer_interrupt+0x130/0x3c0
>                                 sp=a000000101247bf0 bsp=a000000101240f58
>  [<a00000010011ee00>] handle_irq_event_percpu+0x80/0x460
>                                 sp=a000000101247bf0 bsp=a000000101240ef0
>  [<a0000001001266c0>] handle_percpu_irq+0x120/0x1a0
>                                 sp=a000000101247bf0 bsp=a000000101240ec0
>  [<a00000010011e0e0>] generic_handle_irq+0xa0/0xe0
>                                 sp=a000000101247bf0 bsp=a000000101240ea0
>  [<a0000001000117b0>] ia64_handle_irq+0x110/0x440
>                                 sp=a000000101247bf0 bsp=a000000101240e18
>  [<a00000010000c140>] ia64_native_leave_kernel+0x0/0x270
>                                 sp=a000000101247bf0 bsp=a000000101240e18
>  [<a000000100013bf0>] default_idle+0x130/0x180
>                                 sp=a000000101247dc0 bsp=a000000101240dd0
>  [<a000000100014ee0>] cpu_idle+0x1c0/0x3c0
>                                 sp=a000000101247e20 bsp=a000000101240d68
>  [<a000000100d379e0>] rest_init+0xe0/0x100
>                                 sp=a000000101247e20 bsp=a000000101240d50
>  [<a0000001010f9360>] start_kernel+0x760/0x870
>                                 sp=a000000101247e20 bsp=a000000101240cd0
>  [<a000000100d378c0>] start_ap+0x760/0x780
>                                 sp=a000000101247e30 bsp=a000000101240bc0

And it looks like the stall was from the idle loop.  Except isn't this
CPU 0's stack, rather than that of the stalled CPU 1?

Having CPU 1's stack would of course be much more helpful.

>  { 1}  (t=15613 jiffies)

This is the tail end of CPU 1's stall-warning message.

> Call Trace:
> 
> ... stack traces keep coming every 64 seconds.

Hmmm... Is the immediately following stack trace that of CPU 1?
That would likely be quite helpful.  If not, please see below.

> Any clues on where I should look to debug this?

CONFIG_RCU_CPU_STALL_INFO=y should give more information on why RCU
thought a stall warning should be printed.  In addition, you might
bump up the value of RCU_STALL_RAT_DELAY (defined in kernel/rcutree.h)
in order to give CPU 0 more time to complain about itself -- hopefully
getting its stack rather than that of an innocent bystander.  It should
be no problem setting RCU_STALL_RAT_DELAY to HZ or perhaps even higher.

							Thanx, Paul
