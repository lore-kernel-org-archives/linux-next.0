From: Tony Luck <tony.luck@intel.com>
Subject: ia64 won't boot because of rcu_sched self-detected stall
Date: Tue, 21 Aug 2012 15:45:52 -0700
Message-ID: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:34108 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834Ab2HUWpx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Aug 2012 18:45:53 -0400
Received: by vcbfk26 with SMTP id fk26so412828vcb.19
        for <linux-next@vger.kernel.org>; Tue, 21 Aug 2012 15:45:53 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: linux-next@vger.kernel.org

last few linux-next builds (at least from next-20120806 to
next-20120821) fail to boot on ia64 with these messages:

 ...
Total of 2 processors activated (3891.20 BogoMIPS).
SMBIOS 2.3 present.
NET: Registered protocol family 16
ACPI: bus type pci registered
bio: create slab <bio-0> at 0
ACPI: Added _OSI(Module Device)
ACPI: Added _OSI(Processor Device)
ACPI: Added _OSI(3.0 _SCP Extensions)
ACPI: Added _OSI(Processor Aggregator Device)
INFO: rcu_sched self-detected stall on CPUINFO: rcu_sched detected
stalls on CPUs/tasks: { 1} (detected by 0, t=15002 jiffies)

Call Trace:
 [<a0000001000154e0>] show_stack+0x80/0xa0
                                sp=a000000101247a20 bsp=a0000001012410b0
 [<a000000100d76df0>] dump_stack+0x30/0x50
                                sp=a000000101247bf0 bsp=a000000101241098
 [<a0000001001311e0>] print_other_cpu_stall+0x440/0x540
                                sp=a000000101247bf0 bsp=a000000101241038
 [<a000000100131860>] rcu_check_callbacks+0x580/0x780
                                sp=a000000101247bf0 bsp=a000000101240fd8
 [<a0000001000967d0>] update_process_times+0x50/0xa0
                                sp=a000000101247bf0 bsp=a000000101240fa8
 [<a00000010003f7f0>] timer_interrupt+0x130/0x3c0
                                sp=a000000101247bf0 bsp=a000000101240f58
 [<a00000010011ee00>] handle_irq_event_percpu+0x80/0x460
                                sp=a000000101247bf0 bsp=a000000101240ef0
 [<a0000001001266c0>] handle_percpu_irq+0x120/0x1a0
                                sp=a000000101247bf0 bsp=a000000101240ec0
 [<a00000010011e0e0>] generic_handle_irq+0xa0/0xe0
                                sp=a000000101247bf0 bsp=a000000101240ea0
 [<a0000001000117b0>] ia64_handle_irq+0x110/0x440
                                sp=a000000101247bf0 bsp=a000000101240e18
 [<a00000010000c140>] ia64_native_leave_kernel+0x0/0x270
                                sp=a000000101247bf0 bsp=a000000101240e18
 [<a000000100013bf0>] default_idle+0x130/0x180
                                sp=a000000101247dc0 bsp=a000000101240dd0
 [<a000000100014ee0>] cpu_idle+0x1c0/0x3c0
                                sp=a000000101247e20 bsp=a000000101240d68
 [<a000000100d379e0>] rest_init+0xe0/0x100
                                sp=a000000101247e20 bsp=a000000101240d50
 [<a0000001010f9360>] start_kernel+0x760/0x870
                                sp=a000000101247e20 bsp=a000000101240cd0
 [<a000000100d378c0>] start_ap+0x760/0x780
                                sp=a000000101247e30 bsp=a000000101240bc0

 { 1}  (t=15613 jiffies)

Call Trace:

... stack traces keep coming every 64 seconds.

Any clues on where I should look to debug this?

Thanks

-Tony
