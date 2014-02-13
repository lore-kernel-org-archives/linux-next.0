From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] samples/seccomp/Makefile: Do not build tests if cross-compiling for MIPS
Date: Thu, 13 Feb 2014 17:27:40 +0000
Message-ID: <1392312460-24902-1-git-send-email-markos.chandras@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:10963 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752342AbaBMR1f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Feb 2014 12:27:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-mips@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-next@vger.kernel.org, linux-kernel@linux-mips.org

The Makefile is designed to use the host toolchain so it may be
unsafe to build the tests if the kernel has been configured and built
for another architecture. This fixes a build problem when the kernel ha=
s
been configured and built for the MIPS architecture but the host is
not MIPS (cross-compiled). The MIPS syscalls are only defined
if one of the following is true:

1) _MIPS_SIM =3D=3D _MIPS_SIM_ABI64
2) _MIPS_SIM =3D=3D _MIPS_SIM_ABI32
3) _MIPS_SIM =3D=3D _MIPS_SIM_NABI32

Of course, none of these make sense on a non-MIPS toolchain and the
following build problem occurs when building on a non-MIPS host.

linux/usr/include/linux/kexec.h:50:
userspace cannot reference function or variable defined in the kernel
samples/seccomp/bpf-direct.c: In function =E2=80=98emulator=E2=80=99:
samples/seccomp/bpf-direct.c:76:17: error:
=E2=80=98__NR_write=E2=80=99 undeclared (first use in this function)

Cc: linux-next@vger.kernel.org
Cc: linux-kernel@linux-mips.org
Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This problem is only reproducible on the linux-next tree at the moment
---
 samples/seccomp/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
index 7203e66..f6bda1c 100644
--- a/samples/seccomp/Makefile
+++ b/samples/seccomp/Makefile
@@ -17,9 +17,14 @@ HOSTCFLAGS_bpf-direct.o +=3D -I$(objtree)/usr/includ=
e
 HOSTCFLAGS_bpf-direct.o +=3D -idirafter $(objtree)/include
 bpf-direct-objs :=3D bpf-direct.o
=20
+# MIPS system calls are defined based on the -mabi that is passed
+# to the toolchain which may or may not be a valid option
+# for the host toolchain. So disable tests if target architecture
+# is mips but the host isn't.
+ifndef CONFIG_MIPS
 # Try to match the kernel target.
-ifndef CONFIG_64BIT
 ifndef CROSS_COMPILE
+ifndef CONFIG_64BIT
=20
 # s390 has -m31 flag to build 31 bit binaries
 ifndef CONFIG_S390
@@ -40,3 +45,4 @@ endif
=20
 # Tell kbuild to always build the programs
 always :=3D $(hostprogs-y)
+endif
--=20
1.8.5.4
