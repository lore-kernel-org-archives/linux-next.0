From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] sparc32/sparc64: Provide cmpxchg64()
Date: Thu, 14 Mar 2013 20:42:08 +0100
Message-ID: <1363290128-21247-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:42466 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989Ab3CNTmZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Mar 2013 15:42:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

sparc/sparc64 allmodconfig:

drivers/block/blockconsole.c: In function =E2=80=98bcon_advance_console=
_bytes=E2=80=99:
drivers/block/blockconsole.c:164: error: implicit declaration of functi=
on
=E2=80=98cmpxchg64=E2=80=99

Map cmpxchg64 to cmpxchg64_local to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/8398811/
http://kisskb.ellerman.id.au/kisskb/buildresult/8398801/

 arch/sparc/include/asm/cmpxchg_32.h |    1 +
 arch/sparc/include/asm/cmpxchg_64.h |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/sparc/include/asm/cmpxchg_32.h b/arch/sparc/include/a=
sm/cmpxchg_32.h
index 1fae1a0..284fb96 100644
--- a/arch/sparc/include/asm/cmpxchg_32.h
+++ b/arch/sparc/include/asm/cmpxchg_32.h
@@ -81,5 +81,6 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsi=
gned long new_, int size)
 	((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr), (unsigned long)(o=
),\
 			(unsigned long)(n), sizeof(*(ptr))))
 #define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o=
), (n))
+#define cmpxchg64(ptr, o, n)	cmpxchg64_local((ptr), (o), (n))
=20
 #endif /* __ARCH_SPARC_CMPXCHG__ */
diff --git a/arch/sparc/include/asm/cmpxchg_64.h b/arch/sparc/include/a=
sm/cmpxchg_64.h
index b30eb37..4adefe8 100644
--- a/arch/sparc/include/asm/cmpxchg_64.h
+++ b/arch/sparc/include/asm/cmpxchg_64.h
@@ -141,5 +141,6 @@ static inline unsigned long __cmpxchg_local(volatil=
e void *ptr,
 	BUILD_BUG_ON(sizeof(*(ptr)) !=3D 8);				\
 	cmpxchg_local((ptr), (o), (n));					\
   })
+#define cmpxchg64(ptr, o, n)	cmpxchg64_local((ptr), (o), (n))
=20
 #endif /* __ARCH_SPARC64_CMPXCHG__ */
--=20
1.7.0.4
