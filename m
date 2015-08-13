From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20150813 build error arch/x86/include/asm/jump_label.h:21:
 error: impossible constraint in =?UTF-8?B?4oCYYXNt4oCZ?=
Date: Fri, 14 Aug 2015 08:34:22 +1000
Message-ID: <20150814083422.6fe2884e@canb.auug.org.au>
References: <CAHTgTXWtwSRuC8ERo4i_XHWUSD0-400oArZQBdcFJCjg6_Q6Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34963 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752682AbbHMWeX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2015 18:34:23 -0400
In-Reply-To: <CAHTgTXWtwSRuC8ERo4i_XHWUSD0-400oArZQBdcFJCjg6_Q6Lg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@twopensource.com>
Cc: linux-next@vger.kernel.org

Hi Vinson,

On Thu, 13 Aug 2015 13:49:56 -0700 Vinson Lee <vlee@twopensource.com> w=
rote:
>
> I get this build error with next-20150813 compiling with GCC 4.4.7.
>=20
>   CC      arch/x86/kvm/irq_comm.o
> In file included from include/linux/jump_label.h:108,
>                  from ./arch/x86/include/asm/spinlock.h:4,
>                  from include/linux/spinlock.h:87,
>                  from include/linux/seqlock.h:35,
>                  from include/linux/time.h:5,
>                  from include/linux/ktime.h:24,
>                  from include/linux/timer.h:5,
>                  from include/linux/workqueue.h:8,
>                  from include/linux/pm.h:25,
>                  from ./arch/x86/include/asm/apic.h:5,
>                  from ./arch/x86/include/asm/smp.h:12,
>                  from include/linux/smp.h:59,
>                  from include/linux/percpu.h:6,
>                  from include/linux/context_tracking_state.h:4,
>                  from include/linux/vtime.h:4,
>                  from include/linux/hardirq.h:7,
>                  from include/linux/kvm_host.h:10,
>                  from arch/x86/kvm/irq_comm.c:23:
> ./arch/x86/include/asm/jump_label.h: In function =E2=80=98kvm_irq_del=
ivery_to_apic=E2=80=99:
> ./arch/x86/include/asm/jump_label.h:21: warning: asm operand 0
> probably doesn=E2=80=99t match constraints
> ./arch/x86/include/asm/jump_label.h:21: warning: asm operand 0
> probably doesn=E2=80=99t match constraints
> ./arch/x86/include/asm/jump_label.h:21: error: impossible constraint =
in =E2=80=98asm=E2=80=99
> ./arch/x86/include/asm/jump_label.h:21: error: impossible constraint =
in =E2=80=98asm=E2=80=99

This was known about and should be fixed in the tip tree today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
