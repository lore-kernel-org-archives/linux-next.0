From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Xen-devel] Re: linux-next: Tree for July 25 (xen)
Date: Thu, 4 Aug 2011 18:30:18 -0400
Message-ID: <20110804223018.GA4370@dumpdata.com>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
 <20110725144629.b752bf14.rdunlap@xenotime.net>
 <20110804193534.GB12729@elte.hu>
 <20110804195539.GA11198@dumpdata.com>
 <20110804131516.c4da6595.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:22865 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755190Ab1HDWbM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2011 18:31:12 -0400
Content-Disposition: inline
In-Reply-To: <20110804131516.c4da6595.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Thomas Gleixner <tglx@linutronix.de>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

> > >  arch/x86/xen/trace.c:44:2: error: array index in initializer not=
 of integer type
> > >  arch/x86/xen/trace.c:44:2: error: (near initialization for =E2=80=
=98xen_hypercall_names=E2=80=99)
> > >  arch/x86/xen/trace.c:45:1: error: =E2=80=98__HYPERVISOR_arch_4=E2=
=80=99 undeclared here (not in a function)
> > >  arch/x86/xen/trace.c:45:2: error: array index in initializer not=
 of integer type
> > >  arch/x86/xen/trace.c:45:2: error: (near initialization for =E2=80=
=98xen_hypercall_names=E2=80=99)
> >=20
> > Oh, that I haven't seen. Can you send me the .config for that pleas=
e.
>=20
> You can't be trying very hard then.  I see lots of these (but no,

Hm, It is not obvious to me what is causing that compile failure. Any i=
deas?

> I haven't reported them.  One can grow weary of reporting xen bugs.)
>=20
>=20
> > > even after:
> > >=20
> > >  b3c4b9825075: xen/tracing: fix compile errors when tracing is di=
sabled.
> > >=20
> > > Btw., that the heck is going on with the commit that introduced t=
he=20
> > > build failure:
> > >=20
> > >  commit bd9ddc875b6659f9f74dcfd285c472bc58041abd
> > >  Author:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
> > >  AuthorDate: Mon Jun 20 17:52:13 2011 -0700
> > >  Commit:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
> > >  CommitDate: Mon Jul 18 15:43:46 2011 -0700
> > >=20
> > > It was apparently rebased shortly before the merge window and sen=
t to=20
> >=20
> > Well, the rebase I get - it was done on top of the merge that intro=
duced
> > the new functionality.
> >=20
> > > Linus 3 days later, with little to no linux-next testing ...
> >=20
> > <Hmm> It did fix the compile problem.. albeit it created another on=
e.
> > >=20
> > > I'm absolutely unhappy about how the Xen tree is being run. It's=20
> > > using a sloppy, crappy workflow and it is producing crap.
> >=20
> > Do you have a manual of how you guys run your workflow?
>=20
> I just run 30-50 randconfigs per night (cron job).

Ok, do you have an mailing list where you send the output too?
