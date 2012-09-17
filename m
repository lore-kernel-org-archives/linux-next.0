From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] MIPS: ptrace: Add missing #include <asm/syscall.h>
Date: Mon, 17 Sep 2012 22:20:16 +0200
Message-ID: <1347913216-11140-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:53242 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755707Ab2IQUUY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Sep 2012 16:20:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

arch/mips/kernel/ptrace.c: In function =E2=80=98syscall_trace_enter=E2=80=
=99:
arch/mips/kernel/ptrace.c:664: error: implicit declaration of function =
=E2=80=98__syscall_get_arch=E2=80=99
make[2]: *** [arch/mips/kernel/ptrace.o] Error 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
E.g. http://kisskb.ellerman.id.au/kisskb/buildresult/7223557/

 arch/mips/kernel/ptrace.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 94fd0f4..cc7c44f 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -40,6 +40,7 @@
 #include <asm/uaccess.h>
 #include <asm/bootinfo.h>
 #include <asm/reg.h>
+#include <asm/syscall.h>
=20
 /*
  * Called by kernel/ptrace.c when detaching..
--=20
1.7.0.4
