From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Subject: [PATCH] arch/*/io.h: Add ioremap_uc() to all architectures
Date: Tue, 28 Jul 2015 11:22:07 -0700
Message-ID: <1438107727-12287-1-git-send-email-mcgrof@do-not-panic.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33080 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751548AbbG1SYV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2015 14:24:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu
Cc: sfr@canb.auug.org.au, akpm@linux-foundation.org, bp@suse.de, tglx@linutronix.de, hpa@zytor.com, peterz@infradead.org, dan.j.williams@intel.com, linux-next@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, benh@kernel.crashing.org, "Luis R. Rodriguez" <mcgrof@suse.com>

From: "Luis R. Rodriguez" <mcgrof@suse.com>

This adds ioremap_uc() only for architectures that do not
include asm-generic.h/io.h as that already provides a default
definition for them for both cases where you have CONFIG_MMU
and you do not, and because of this, the number of architectures
this patch address is less than the architectures that the
ioremap_wt() patch addressed, "arch/*/io.h: Add ioremap_wt() to all
architectures").

In order to reduce the number of architectures we have to
modify when adding new architecture IO APIs we'll have to review
the architectures in this patch, see why they can't add
asm-generic.h/io.h or issues that would be created by doing
so and then spread a consistent inclusion of this header
towards the end of their own header. For instance arch/metag
includes the asm-generic/io.h *before* the ioremap*()
definitions, this should be the other way around but only
once we have guard wrappers for the non-MMU case also for
asm-generic/io.h.

Cc: Arnd Bergmann <arnd@arndb.de>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
---
 arch/avr32/include/asm/io.h   | 1 +
 arch/frv/include/asm/io.h     | 1 +
 arch/m32r/include/asm/io.h    | 1 +
 arch/m68k/include/asm/io_mm.h | 1 +
 arch/mn10300/include/asm/io.h | 1 +
 arch/powerpc/include/asm/io.h | 1 +
 arch/sh/include/asm/io.h      | 1 +
 arch/tile/include/asm/io.h    | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/avr32/include/asm/io.h b/arch/avr32/include/asm/io.h
index e998ff5d8e1a..f855646e0db7 100644
--- a/arch/avr32/include/asm/io.h
+++ b/arch/avr32/include/asm/io.h
@@ -297,6 +297,7 @@ extern void __iounmap(void __iomem *addr);
 
 #define ioremap_wc ioremap_nocache
 #define ioremap_wt ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 #define cached(addr) P1SEGADDR(addr)
 #define uncached(addr) P2SEGADDR(addr)
diff --git a/arch/frv/include/asm/io.h b/arch/frv/include/asm/io.h
index a31b63ec4930..70dfbea8c8d7 100644
--- a/arch/frv/include/asm/io.h
+++ b/arch/frv/include/asm/io.h
@@ -278,6 +278,7 @@ static inline void __iomem *ioremap_fullcache(unsigned long physaddr, unsigned l
 }
 
 #define ioremap_wc ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 extern void iounmap(void volatile __iomem *addr);
 
diff --git a/arch/m32r/include/asm/io.h b/arch/m32r/include/asm/io.h
index f8de767ce2bc..61b8931bc192 100644
--- a/arch/m32r/include/asm/io.h
+++ b/arch/m32r/include/asm/io.h
@@ -69,6 +69,7 @@ extern void iounmap(volatile void __iomem *addr);
 #define ioremap_nocache(off,size) ioremap(off,size)
 #define ioremap_wc ioremap_nocache
 #define ioremap_wt ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 /*
  * IO bus memory addresses are also 1:1 with the physical address
diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index f55cad529400..c98ac81582ac 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -468,6 +468,7 @@ static inline void __iomem *ioremap_nocache(unsigned long physaddr, unsigned lon
 {
 	return __ioremap(physaddr, size, IOMAP_NOCACHE_SER);
 }
+#define ioremap_uc ioremap_nocache
 static inline void __iomem *ioremap_wt(unsigned long physaddr,
 					 unsigned long size)
 {
diff --git a/arch/mn10300/include/asm/io.h b/arch/mn10300/include/asm/io.h
index 07c5b4a3903b..62189353d2f6 100644
--- a/arch/mn10300/include/asm/io.h
+++ b/arch/mn10300/include/asm/io.h
@@ -283,6 +283,7 @@ static inline void __iomem *ioremap_nocache(unsigned long offset, unsigned long
 
 #define ioremap_wc ioremap_nocache
 #define ioremap_wt ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 static inline void iounmap(void __iomem *addr)
 {
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index a8d2ef30d473..5879fde56f3c 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -721,6 +721,7 @@ extern void __iomem *ioremap_prot(phys_addr_t address, unsigned long size,
 				  unsigned long flags);
 extern void __iomem *ioremap_wc(phys_addr_t address, unsigned long size);
 #define ioremap_nocache(addr, size)	ioremap((addr), (size))
+#define ioremap_uc(addr, size)		ioremap((addr), (size))
 
 extern void iounmap(volatile void __iomem *addr);
 
diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index 728c4c571f40..93ec9066dbef 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -368,6 +368,7 @@ static inline int iounmap_fixed(void __iomem *addr) { return -EINVAL; }
 #endif
 
 #define ioremap_nocache	ioremap
+#define ioremap_uc	ioremap
 #define iounmap		__iounmap
 
 /*
diff --git a/arch/tile/include/asm/io.h b/arch/tile/include/asm/io.h
index dc61de15c1f9..322b5fe94781 100644
--- a/arch/tile/include/asm/io.h
+++ b/arch/tile/include/asm/io.h
@@ -55,6 +55,7 @@ extern void iounmap(volatile void __iomem *addr);
 #define ioremap_nocache(physaddr, size)		ioremap(physaddr, size)
 #define ioremap_wc(physaddr, size)		ioremap(physaddr, size)
 #define ioremap_wt(physaddr, size)		ioremap(physaddr, size)
+#define ioremap_uc(physaddr, size)		ioremap(physaddr, size)
 #define ioremap_fullcache(physaddr, size)	ioremap(physaddr, size)
 
 #define mmiowb()
-- 
2.3.2.209.gd67f9d5.dirty
