From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [BUG][next-20170619][347de24] PowerPC boot fails with Oops
Date: Tue, 20 Jun 2017 21:44:16 +1000
Message-ID: <20170620214416.1d3b6373@roar.ozlabs.ibm.com>
References: <1497943165.6789.10.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36170 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbdFTLoc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jun 2017 07:44:32 -0400
In-Reply-To: <1497943165.6789.10.camel@abdul.in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, stephen Rothwell <sfr@canb.auug.org.au>, mpe <mpe@ellerman.id>, akpm@linux-foundation.org, sachinp <sachinp@linux.vnet.ibm.com>

On Tue, 20 Jun 2017 12:49:25 +0530
Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:

> Hi,
> 
> commit: 347de24 (powerpc/64s: implement arch-specific hardlockup
> watchdog)
> 
> linux-next fails to boot on PowerPC Bare-metal box.
> 
> Test: boot
> Machine type: Power 8 Bare-metal
> Kernel: 4.12.0-rc5-next-20170619
> gcc: version 4.8.5
> 
> 
> In file arch/powerpc/kernel/watchdog.c
> 
> void soft_nmi_interrupt(struct pt_regs *regs)
> {
>     unsigned long flags;
>     int cpu = raw_smp_processor_id();
>     u64 tb;
> 
>     if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
>         return;
> 
> >>> nmi_enter();  

Thanks for the report.

This is due to emergency stacks not zeroing preempt_count, so they get
garbage here, and it just trips the BUG_ON(in_nmi()) check.

Don't think it's a bug in the proposed new powerpc watchdog. (at least
I was able to reproduce your bug and fix it by fixing the stack init).

Thanks,
Nick
