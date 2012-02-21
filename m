From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH - linux-next] ARM: ptrace: Fix audit caused compile error
Date: Tue, 21 Feb 2012 14:04:15 +0200
Message-ID: <1329825855-11902-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog108.obsmtp.com ([74.125.149.199]:54282 "EHLO
	na3sys009aog108.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755155Ab2BUMES (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Feb 2012 07:04:18 -0500
Received: by lahi5 with SMTP id i5so9600197lah.32
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2012 04:04:15 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Eric Paris <eparis@redhat.com>, Nathaniel Husted <nhusted@gmail.com>, linux-audit@redhat.com, linux-arm-kernel@lists.infradead.org, peter.ujfalusi@ti.com

While trying to compile the kernel for ARM (omap2plus_defconfig) the ke=
rnel
build fails with:

arch/arm/kernel/ptrace.c: In function =E2=80=98syscall_trace=E2=80=99:
arch/arm/kernel/ptrace.c:920:3: error: implicit declaration of function=
 =E2=80=98audit_syscall_exit=E2=80=99
arch/arm/kernel/ptrace.c:922:3: error: implicit declaration of function=
 =E2=80=98audit_syscall_entry=E2=80=99
arch/arm/kernel/ptrace.c:922:23: error: =E2=80=98AUDIT_ARCH_ARMEB=E2=80=
=99 undeclared (first use in this function)
arch/arm/kernel/ptrace.c:922:23: note: each undeclared identifier is re=
ported only once for each function it appears in
make[1]: *** [arch/arm/kernel/ptrace.o] Error 1

The issue created by commit:
29ef73b7 Kernel: Audit Support For The ARM Platform

We need to include the linux/audit.h header to the arch/arm/kernel/ptra=
ce.c
file to be able to compile the kernel.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/kernel/ptrace.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index e33870f..8e41ad2 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -15,6 +15,7 @@
 #include <linux/elf.h>
 #include <linux/smp.h>
 #include <linux/ptrace.h>
+#include <linux/audit.h>
 #include <linux/user.h>
 #include <linux/security.h>
 #include <linux/init.h>
--=20
1.7.8.4
