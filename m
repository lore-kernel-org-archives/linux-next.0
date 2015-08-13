From: Vinson Lee <vlee@twopensource.com>
Subject: =?UTF-8?Q?next=2D20150813_build_error_arch=2Fx86=2Finclude=2Fasm=2Fjump=5F?=
	=?UTF-8?Q?label=2Eh=3A21=3A_error=3A_impossible_constraint_in_=E2=80=98asm=E2=80=99?=
Date: Thu, 13 Aug 2015 13:49:56 -0700
Message-ID: <CAHTgTXWtwSRuC8ERo4i_XHWUSD0-400oArZQBdcFJCjg6_Q6Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:35514 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455AbbHMUt6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2015 16:49:58 -0400
Received: by lbcbn3 with SMTP id bn3so33960899lbc.2
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2015 13:49:57 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi.

I get this build error with next-20150813 compiling with GCC 4.4.7.

  CC      arch/x86/kvm/irq_comm.o
In file included from include/linux/jump_label.h:108,
                 from ./arch/x86/include/asm/spinlock.h:4,
                 from include/linux/spinlock.h:87,
                 from include/linux/seqlock.h:35,
                 from include/linux/time.h:5,
                 from include/linux/ktime.h:24,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/pm.h:25,
                 from ./arch/x86/include/asm/apic.h:5,
                 from ./arch/x86/include/asm/smp.h:12,
                 from include/linux/smp.h:59,
                 from include/linux/percpu.h:6,
                 from include/linux/context_tracking_state.h:4,
                 from include/linux/vtime.h:4,
                 from include/linux/hardirq.h:7,
                 from include/linux/kvm_host.h:10,
                 from arch/x86/kvm/irq_comm.c:23:
=2E/arch/x86/include/asm/jump_label.h: In function =E2=80=98kvm_irq_del=
ivery_to_apic=E2=80=99:
=2E/arch/x86/include/asm/jump_label.h:21: warning: asm operand 0
probably doesn=E2=80=99t match constraints
=2E/arch/x86/include/asm/jump_label.h:21: warning: asm operand 0
probably doesn=E2=80=99t match constraints
=2E/arch/x86/include/asm/jump_label.h:21: error: impossible constraint =
in =E2=80=98asm=E2=80=99
=2E/arch/x86/include/asm/jump_label.h:21: error: impossible constraint =
in =E2=80=98asm=E2=80=99

Cheers,
Vinson
