From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Xen-devel] Re: linux-next: Tree for July 25 (xen)
Date: Thu, 4 Aug 2011 15:55:39 -0400
Message-ID: <20110804195539.GA11198@dumpdata.com>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
 <20110725144629.b752bf14.rdunlap@xenotime.net>
 <20110804193534.GB12729@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:54286 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752823Ab1HDT5X convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2011 15:57:23 -0400
Content-Disposition: inline
In-Reply-To: <20110804193534.GB12729@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>

On Thu, Aug 04, 2011 at 09:35:34PM +0200, Ingo Molnar wrote:
>=20
> * Randy Dunlap <rdunlap@xenotime.net> wrote:
>=20
> > On Mon, 25 Jul 2011 16:25:42 +1000 Stephen Rothwell wrote:
> >=20
> > > Hi all,
> >=20
> > xen has lots of build errors and warnings (all on x86_64).

Hm, I have a fix in my linux-next (and stable/bug.fixes) for this that =
I was thinking
to send in a couple of days ..


commit 1e9ea2656b656edd3c8de98675bbc0340211b5bd
Author: Jeremy Fitzhardinge <jeremy@goop.org>
Date:   Wed Aug 3 09:43:44 2011 -0700

     xen/tracing: it looks like we wanted CONFIG_FTRACE
   =20
    Apparently we wanted CONFIG_FTRACE rather the CONFIG_FUNCTION_TRACE=
R.
   =20
    Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
    Tested-by: Sander Eikelenboom <linux@eikelenboom.it>
    Signed-off-by: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
    Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 45e94ac..3326204 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -15,7 +15,7 @@ obj-y		:=3D enlighten.o setup.o multicalls.o mmu.o ir=
q.o \
 			grant-table.o suspend.o platform-pci-unplug.o \
 			p2m.o
=20
-obj-$(CONFIG_FUNCTION_TRACER) +=3D trace.o
+obj-$(CONFIG_FTRACE) +=3D trace.o
=20
 obj-$(CONFIG_SMP)		+=3D smp.o
 obj-$(CONFIG_PARAVIRT_SPINLOCKS)+=3D spinlock.o

=2E. snip of the long compile error..

> These build failures are still triggering upstream:
>=20
>  arch/x86/xen/trace.c:44:2: error: array index in initializer not of =
integer type
>  arch/x86/xen/trace.c:44:2: error: (near initialization for =E2=80=98=
xen_hypercall_names=E2=80=99)
>  arch/x86/xen/trace.c:45:1: error: =E2=80=98__HYPERVISOR_arch_4=E2=80=
=99 undeclared here (not in a function)
>  arch/x86/xen/trace.c:45:2: error: array index in initializer not of =
integer type
>  arch/x86/xen/trace.c:45:2: error: (near initialization for =E2=80=98=
xen_hypercall_names=E2=80=99)

Oh, that I haven't seen. Can you send me the .config for that please.

>=20
> even after:
>=20
>  b3c4b9825075: xen/tracing: fix compile errors when tracing is disabl=
ed.
>=20
> Btw., that the heck is going on with the commit that introduced the=20
> build failure:
>=20
>  commit bd9ddc875b6659f9f74dcfd285c472bc58041abd
>  Author:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
>  AuthorDate: Mon Jun 20 17:52:13 2011 -0700
>  Commit:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
>  CommitDate: Mon Jul 18 15:43:46 2011 -0700
>=20
> It was apparently rebased shortly before the merge window and sent to=
=20

Well, the rebase I get - it was done on top of the merge that introduce=
d
the new functionality.

> Linus 3 days later, with little to no linux-next testing ...

<Hmm> It did fix the compile problem.. albeit it created another one.
>=20
> I'm absolutely unhappy about how the Xen tree is being run. It's=20
> using a sloppy, crappy workflow and it is producing crap.

Do you have a manual of how you guys run your workflow?
