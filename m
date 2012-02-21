From: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH - linux-next] ARM: ptrace: Fix audit caused compile error
Date: Tue, 21 Feb 2012 08:35:50 -0500
Message-ID: <1329831350.2337.43.camel@localhost>
References: <1329825855-11902-1-git-send-email-peter.ujfalusi@ti.com>
	 <20120221131616.GI19696@mudshark.cambridge.arm.com>
	 <20120221133044.GN22562@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:29234 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752647Ab2BUNgg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Feb 2012 08:36:36 -0500
In-Reply-To: <20120221133044.GN22562@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Will Deacon <will.deacon@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-audit@redhat.com" <linux-audit@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nathaniel Husted <nhusted@gmail.com>

On Tue, 2012-02-21 at 13:30 +0000, Russell King - ARM Linux wrote:
> On Tue, Feb 21, 2012 at 01:16:17PM +0000, Will Deacon wrote:
> > On Tue, Feb 21, 2012 at 12:04:15PM +0000, Peter Ujfalusi wrote:
> > > While trying to compile the kernel for ARM (omap2plus_defconfig) =
the kernel
> > > build fails with:
> > >=20
> > > arch/arm/kernel/ptrace.c: In function =E2=80=98syscall_trace=E2=80=
=99:
> > > arch/arm/kernel/ptrace.c:920:3: error: implicit declaration of fu=
nction =E2=80=98audit_syscall_exit=E2=80=99
> > > arch/arm/kernel/ptrace.c:922:3: error: implicit declaration of fu=
nction =E2=80=98audit_syscall_entry=E2=80=99
> > > arch/arm/kernel/ptrace.c:922:23: error: =E2=80=98AUDIT_ARCH_ARMEB=
=E2=80=99 undeclared (first use in this function)
> > > arch/arm/kernel/ptrace.c:922:23: note: each undeclared identifier=
 is reported only once for each function it appears in
> > > make[1]: *** [arch/arm/kernel/ptrace.o] Error 1
> > >=20
> > > The issue created by commit:
> > > 29ef73b7 Kernel: Audit Support For The ARM Platform
> > >=20
> > > We need to include the linux/audit.h header to the arch/arm/kerne=
l/ptrace.c
> > > file to be able to compile the kernel.
> >=20
> > This was already reported and I think Russell was going to revert t=
he
> > offending commit, since it needed some rework to handle little-endi=
an
> > configurations.
> >=20
> > I can't see the revert in any of the trees I'm tracking though...
>=20
> I never pushed that out because I thought someone was going to fix it=
=2E
> Were any patches produced to fix it?  I can't see anything in the pat=
ch
> system and I couldn't see anything on the list.
>=20
> It seems the previous thread about it just died.  Oh well, I guess a
> revert is what's required after all.

http://marc.info/?l=3Dlinux-arm-kernel&m=3D132928424120369&w=3D2

???
