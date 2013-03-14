From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] m68k: Add missing cmpxchg64() if CONFIG_RMW_INSNS=y
Date: Thu, 14 Mar 2013 20:30:49 +0100
Message-ID: <1363289449-16116-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:34412 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136Ab3CNTa6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Mar 2013 15:30:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-m68k@lists.linux-m68k.org, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

If CONFIG_RMW_INSNS=3Dy:

drivers/block/blockconsole.c: In function =E2=80=98bcon_advance_console=
_bytes=E2=80=99:
drivers/block/blockconsole.c:164: error: implicit declaration of functi=
on =E2=80=98cmpxchg64=E2=80=99

Map cmpxchg64 to cmpxchg64_local, which is already mapped to
__cmpxchg64_local_generic, just like for the CONFIG_RMW_INSNS=3Dn case.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/8398995/

 arch/m68k/include/asm/cmpxchg.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/cmpxchg.h b/arch/m68k/include/asm/cm=
pxchg.h
index 5c81d0e..bc755bc 100644
--- a/arch/m68k/include/asm/cmpxchg.h
+++ b/arch/m68k/include/asm/cmpxchg.h
@@ -124,6 +124,9 @@ static inline unsigned long __cmpxchg(volatile void=
 *p, unsigned long old,
 #define cmpxchg_local(ptr, o, n)					    \
 	((__typeof__(*(ptr)))__cmpxchg((ptr), (unsigned long)(o),	    \
 			(unsigned long)(n), sizeof(*(ptr))))
+
+#define cmpxchg64(ptr, o, n)	cmpxchg64_local((ptr), (o), (n))
+
 #else
=20
 /*
--=20
1.7.0.4
