From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for July 25 (xen)
Date: Thu, 4 Aug 2011 21:35:34 +0200
Message-ID: <20110804193534.GB12729@elte.hu>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
 <20110725144629.b752bf14.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:47876 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753105Ab1HDTgr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Aug 2011 15:36:47 -0400
Content-Disposition: inline
In-Reply-To: <20110725144629.b752bf14.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


* Randy Dunlap <rdunlap@xenotime.net> wrote:

> On Mon, 25 Jul 2011 16:25:42 +1000 Stephen Rothwell wrote:
>=20
> > Hi all,
>=20
> xen has lots of build errors and warnings (all on x86_64).
>=20
>   CC      arch/x86/xen/setup.o
> In file included from arch/x86/include/asm/xen/hypercall.h:42,
>                  from arch/x86/xen/setup.c:19:
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> include/trace/events/xen.h:31: warning: its scope is only this defini=
tion or declaration, which is probably not what you want
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> In file included from arch/x86/xen/setup.c:19:
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_fpu_taskswit=
ch':
> arch/x86/include/asm/xen/hypercall.h:465: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_update_va_ma=
pping':
> arch/x86/include/asm/xen/hypercall.h:483: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_grant_table_=
op':
> arch/x86/include/asm/xen/hypercall.h:495: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_update_va_ma=
pping_otherdomain':
> arch/x86/include/asm/xen/hypercall.h:516: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_update_descr=
iptor':
> arch/x86/include/asm/xen/hypercall.h:534: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_memory_op':
> arch/x86/include/asm/xen/hypercall.h:544: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_mmu_update':
> arch/x86/include/asm/xen/hypercall.h:557: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_mmuext_op':
> arch/x86/include/asm/xen/hypercall.h:570: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_set_gdt':
> arch/x86/include/asm/xen/hypercall.h:580: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
> arch/x86/include/asm/xen/hypercall.h: In function 'MULTI_stack_switch=
':
> arch/x86/include/asm/xen/hypercall.h:591: warning: passing argument 1=
 of 'trace_xen_mc_entry' from incompatible pointer type
> include/trace/events/xen.h:48: note: expected 'struct multicall_entry=
 *' but argument is of type 'struct multicall_entry *'
>   CC      arch/x86/xen/multicalls.o
> In file included from arch/x86/include/asm/xen/hypercall.h:42,
>                  from arch/x86/xen/multicalls.c:26:
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> include/trace/events/xen.h:31: warning: its scope is only this defini=
tion or declaration, which is probably not what you want
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list
> include/trace/events/xen.h:31: warning: 'struct multicall_entry' decl=
ared inside parameter list

These build failures are still triggering upstream:

 arch/x86/xen/trace.c:44:2: error: array index in initializer not of in=
teger type
 arch/x86/xen/trace.c:44:2: error: (near initialization for =E2=80=98xe=
n_hypercall_names=E2=80=99)
 arch/x86/xen/trace.c:45:1: error: =E2=80=98__HYPERVISOR_arch_4=E2=80=99=
 undeclared here (not in a function)
 arch/x86/xen/trace.c:45:2: error: array index in initializer not of in=
teger type
 arch/x86/xen/trace.c:45:2: error: (near initialization for =E2=80=98xe=
n_hypercall_names=E2=80=99)

even after:

 b3c4b9825075: xen/tracing: fix compile errors when tracing is disabled=
=2E

Btw., that the heck is going on with the commit that introduced the=20
build failure:

 commit bd9ddc875b6659f9f74dcfd285c472bc58041abd
 Author:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
 AuthorDate: Mon Jun 20 17:52:13 2011 -0700
 Commit:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
 CommitDate: Mon Jul 18 15:43:46 2011 -0700

It was apparently rebased shortly before the merge window and sent to=20
Linus 3 days later, with little to no linux-next testing ...

I'm absolutely unhappy about how the Xen tree is being run. It's=20
using a sloppy, crappy workflow and it is producing crap.

Thanks,

	Ingo
