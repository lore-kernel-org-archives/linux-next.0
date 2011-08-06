From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Xen-devel] Re: linux-next: Tree for July 25 (xen)
Date: Fri, 5 Aug 2011 21:58:16 -0400
Message-ID: <20110806015815.GA26833@dumpdata.com>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
 <20110725144629.b752bf14.rdunlap@xenotime.net>
 <20110804193534.GB12729@elte.hu>
 <20110804195539.GA11198@dumpdata.com>
 <20110804131516.c4da6595.rdunlap@xenotime.net>
 <20110804223259.GB4370@dumpdata.com>
 <20110804224020.GA21492@dumpdata.com>
 <4E3B3117.5050308@xenotime.net>
 <20110805080531.GA8052@elte.hu>
 <20110805211423.GA9765@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:52654 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346Ab1HFB7T convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Aug 2011 21:59:19 -0400
Content-Disposition: inline
In-Reply-To: <20110805211423.GA9765@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>

On Fri, Aug 05, 2011 at 11:14:23PM +0200, Ingo Molnar wrote:
>=20
> * Ingo Molnar <mingo@elte.hu> wrote:
>=20
> > * Randy Dunlap <rdunlap@xenotime.net> wrote:
> >=20
> > > On 08/04/11 15:40, Konrad Rzeszutek Wilk wrote:
> > > > On Thu, Aug 04, 2011 at 06:32:59PM -0400, Konrad Rzeszutek Wilk=
 wrote:
> > > >>>>> These build failures are still triggering upstream:
> > > >>>>>
> > > >>>>>  arch/x86/xen/trace.c:44:2: error: array index in initializ=
er not of integer type
> > > >>>>>  arch/x86/xen/trace.c:44:2: error: (near initialization for=
 =E2=80=98xen_hypercall_names=E2=80=99)
> > > >>>>>  arch/x86/xen/trace.c:45:1: error: =E2=80=98__HYPERVISOR_ar=
ch_4=E2=80=99 undeclared here (not in a function)
> > > >>>>>  arch/x86/xen/trace.c:45:2: error: array index in initializ=
er not of integer type
> > > >>>>>  arch/x86/xen/trace.c:45:2: error: (near initialization for=
 =E2=80=98xen_hypercall_names=E2=80=99)
> > > >>>>
> > > >>>> Oh, that I haven't seen. Can you send me the .config for tha=
t please.
> > > >>>
> > > >>> You can't be trying very hard then.  I see lots of these (but=
 no,
> > > >>
> > > >> Ah, I am getting it now. Thanks for reporting it.
> > > >=20
> > > > This should do the trick:
> > >=20
> > > Acked-by: Randy Dunlap <rdunlap@xenotime.net>
> >=20
> > That patch did the trick here too:
> >=20
> > Acked-by: Ingo Molnar <mingo@elte.hu>
>=20
> Except that i'm still seeing the occasional build failure - see the=20
> error log below. Config attached.

Much appreciate for the report. I believe this fix (which I think hit
linux-next yesterday?) should do that:

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


Planning to send all of the bug-fixes in my branch to Linus tomorrow - =
just
leaving it in linux-next for the full 24-hrs at least to make sure noth=
ing
else goes haywire.
