From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Xen-devel] Re: linux-next: Tree for July 25 (xen)
Date: Thu, 4 Aug 2011 18:40:20 -0400
Message-ID: <20110804224020.GA21492@dumpdata.com>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
 <20110725144629.b752bf14.rdunlap@xenotime.net>
 <20110804193534.GB12729@elte.hu>
 <20110804195539.GA11198@dumpdata.com>
 <20110804131516.c4da6595.rdunlap@xenotime.net>
 <20110804223259.GB4370@dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:18166 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755397Ab1HDWku convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2011 18:40:50 -0400
Content-Disposition: inline
In-Reply-To: <20110804223259.GB4370@dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>

On Thu, Aug 04, 2011 at 06:32:59PM -0400, Konrad Rzeszutek Wilk wrote:
> > > > These build failures are still triggering upstream:
> > > >=20
> > > >  arch/x86/xen/trace.c:44:2: error: array index in initializer n=
ot of integer type
> > > >  arch/x86/xen/trace.c:44:2: error: (near initialization for =E2=
=80=98xen_hypercall_names=E2=80=99)
> > > >  arch/x86/xen/trace.c:45:1: error: =E2=80=98__HYPERVISOR_arch_4=
=E2=80=99 undeclared here (not in a function)
> > > >  arch/x86/xen/trace.c:45:2: error: array index in initializer n=
ot of integer type
> > > >  arch/x86/xen/trace.c:45:2: error: (near initialization for =E2=
=80=98xen_hypercall_names=E2=80=99)
> > >=20
> > > Oh, that I haven't seen. Can you send me the .config for that ple=
ase.
> >=20
> > You can't be trying very hard then.  I see lots of these (but no,
>=20
> Ah, I am getting it now. Thanks for reporting it.

This should do the trick:

diff --git a/arch/x86/xen/trace.c b/arch/x86/xen/trace.c
index 734beba..520022d 100644
--- a/arch/x86/xen/trace.c
+++ b/arch/x86/xen/trace.c
@@ -1,4 +1,5 @@
 #include <linux/ftrace.h>
+#include <xen/interface/xen.h>
=20
 #define N(x)	[__HYPERVISOR_##x] =3D "("#x")"
 static const char *xen_hypercall_names[] =3D {
