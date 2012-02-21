From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH - linux-next] ARM: ptrace: Fix audit caused compile error
Date: Tue, 21 Feb 2012 13:16:17 +0000
Message-ID: <20120221131616.GI19696@mudshark.cambridge.arm.com>
References: <1329825855-11902-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:54867 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753717Ab2BUNQp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Feb 2012 08:16:45 -0500
Content-Disposition: inline
In-Reply-To: <1329825855-11902-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Eric Paris <eparis@redhat.com>, "linux-audit@redhat.com" <linux-audit@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nathaniel Husted <nhusted@gmail.com>

On Tue, Feb 21, 2012 at 12:04:15PM +0000, Peter Ujfalusi wrote:
> While trying to compile the kernel for ARM (omap2plus_defconfig) the =
kernel
> build fails with:
>=20
> arch/arm/kernel/ptrace.c: In function =E2=80=98syscall_trace=E2=80=99=
:
> arch/arm/kernel/ptrace.c:920:3: error: implicit declaration of functi=
on =E2=80=98audit_syscall_exit=E2=80=99
> arch/arm/kernel/ptrace.c:922:3: error: implicit declaration of functi=
on =E2=80=98audit_syscall_entry=E2=80=99
> arch/arm/kernel/ptrace.c:922:23: error: =E2=80=98AUDIT_ARCH_ARMEB=E2=80=
=99 undeclared (first use in this function)
> arch/arm/kernel/ptrace.c:922:23: note: each undeclared identifier is =
reported only once for each function it appears in
> make[1]: *** [arch/arm/kernel/ptrace.o] Error 1
>=20
> The issue created by commit:
> 29ef73b7 Kernel: Audit Support For The ARM Platform
>=20
> We need to include the linux/audit.h header to the arch/arm/kernel/pt=
race.c
> file to be able to compile the kernel.

This was already reported and I think Russell was going to revert the
offending commit, since it needed some rework to handle little-endian
configurations.

I can't see the revert in any of the trees I'm tracking though...

Will
