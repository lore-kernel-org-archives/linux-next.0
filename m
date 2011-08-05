From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [Xen-devel] Re: linux-next: Tree for July 25 (xen)
Date: Fri, 5 Aug 2011 10:05:31 +0200
Message-ID: <20110805080531.GA8052@elte.hu>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
 <20110725144629.b752bf14.rdunlap@xenotime.net>
 <20110804193534.GB12729@elte.hu>
 <20110804195539.GA11198@dumpdata.com>
 <20110804131516.c4da6595.rdunlap@xenotime.net>
 <20110804223259.GB4370@dumpdata.com>
 <20110804224020.GA21492@dumpdata.com>
 <4E3B3117.5050308@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54786 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754895Ab1HEIHT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Aug 2011 04:07:19 -0400
Content-Disposition: inline
In-Reply-To: <4E3B3117.5050308@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

* Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 08/04/11 15:40, Konrad Rzeszutek Wilk wrote:
> > On Thu, Aug 04, 2011 at 06:32:59PM -0400, Konrad Rzeszutek Wilk wro=
te:
> >>>>> These build failures are still triggering upstream:
> >>>>>
> >>>>>  arch/x86/xen/trace.c:44:2: error: array index in initializer n=
ot of integer type
> >>>>>  arch/x86/xen/trace.c:44:2: error: (near initialization for =E2=
=80=98xen_hypercall_names=E2=80=99)
> >>>>>  arch/x86/xen/trace.c:45:1: error: =E2=80=98__HYPERVISOR_arch_4=
=E2=80=99 undeclared here (not in a function)
> >>>>>  arch/x86/xen/trace.c:45:2: error: array index in initializer n=
ot of integer type
> >>>>>  arch/x86/xen/trace.c:45:2: error: (near initialization for =E2=
=80=98xen_hypercall_names=E2=80=99)
> >>>>
> >>>> Oh, that I haven't seen. Can you send me the .config for that pl=
ease.
> >>>
> >>> You can't be trying very hard then.  I see lots of these (but no,
> >>
> >> Ah, I am getting it now. Thanks for reporting it.
> >=20
> > This should do the trick:
>=20
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>

That patch did the trick here too:

Acked-by: Ingo Molnar <mingo@elte.hu>

Thanks,

	Ingo
