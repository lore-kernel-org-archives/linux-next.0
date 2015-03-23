From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH -next] metag: Fix ioremap_wc/ioremap_cached build errors
Date: Mon, 23 Mar 2015 12:26:15 +0000
Message-ID: <1427113575-29222-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:25473 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932080AbbCWM03 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2015 08:26:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-metag@vger.kernel.org
Cc: linux-next@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

When ioremap_wc() or ioremap_cached() are used without first including
asm/pgtable.h, the _PAGE_CACHEABLE or _PAGE_WR_COMBINE definitions
aren't found, resulting in build errors like the following (in
next-20150323 due to "lib: devres: add a helper function for
ioremap_wc"):

lib/devres.c: In function =E2=80=98devm_ioremap_wc=E2=80=99:
lib/devres.c:91: error: =E2=80=98_PAGE_WR_COMBINE=E2=80=99 undeclared

We can't easily include asm/pgtable.h in asm/io.h due to dependency
problems, so split out the _PAGE_* definitions from asm/pgtable.h into =
a
separate asm/pgtable-bits.h header (as a couple of other architectures
already do), and include that in io.h instead.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: linux-metag@vger.kernel.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
GregKH: I can apply this patch to the metag tree for 4.0. However commi=
t
34644524bce9 "lib: devres: add a helper function for ioremap_wc" in
your char-misc-next branch in next-20150323 will still break the metag
build until the two changes merge. How do you want to handle that?
---
 arch/metag/include/asm/io.h           |   1 +
 arch/metag/include/asm/pgtable-bits.h | 104 ++++++++++++++++++++++++++=
++++++++
 arch/metag/include/asm/pgtable.h      |  95 +-------------------------=
-----
 3 files changed, 106 insertions(+), 94 deletions(-)
 create mode 100644 arch/metag/include/asm/pgtable-bits.h

diff --git a/arch/metag/include/asm/io.h b/arch/metag/include/asm/io.h
index 9359e5048442..d5779b0ec573 100644
--- a/arch/metag/include/asm/io.h
+++ b/arch/metag/include/asm/io.h
@@ -2,6 +2,7 @@
 #define _ASM_METAG_IO_H
=20
 #include <linux/types.h>
+#include <asm/pgtable-bits.h>
=20
 #define IO_SPACE_LIMIT  0
=20
diff --git a/arch/metag/include/asm/pgtable-bits.h b/arch/metag/include=
/asm/pgtable-bits.h
new file mode 100644
index 000000000000..25ba6729f496
--- /dev/null
+++ b/arch/metag/include/asm/pgtable-bits.h
@@ -0,0 +1,104 @@
+/*
+ * Meta page table definitions.
+ */
+
+#ifndef _METAG_PGTABLE_BITS_H
+#define _METAG_PGTABLE_BITS_H
+
+#include <asm/metag_mem.h>
+
+/*
+ * Definitions for MMU descriptors
+ *
+ * These are the hardware bits in the MMCU pte entries.
+ * Derived from the Meta toolkit headers.
+ */
+#define _PAGE_PRESENT		MMCU_ENTRY_VAL_BIT
+#define _PAGE_WRITE		MMCU_ENTRY_WR_BIT
+#define _PAGE_PRIV		MMCU_ENTRY_PRIV_BIT
+/* Write combine bit - this can cause writes to occur out of order */
+#define _PAGE_WR_COMBINE	MMCU_ENTRY_WRC_BIT
+/* Sys coherent bit - this bit is never used by Linux */
+#define _PAGE_SYS_COHERENT	MMCU_ENTRY_SYS_BIT
+#define _PAGE_ALWAYS_ZERO_1	0x020
+#define _PAGE_CACHE_CTRL0	0x040
+#define _PAGE_CACHE_CTRL1	0x080
+#define _PAGE_ALWAYS_ZERO_2	0x100
+#define _PAGE_ALWAYS_ZERO_3	0x200
+#define _PAGE_ALWAYS_ZERO_4	0x400
+#define _PAGE_ALWAYS_ZERO_5	0x800
+
+/* These are software bits that we stuff into the gaps in the hardware
+ * pte entries that are not used.  Note, these DO get stored in the ac=
tual
+ * hardware, but the hardware just does not use them.
+ */
+#define _PAGE_ACCESSED		_PAGE_ALWAYS_ZERO_1
+#define _PAGE_DIRTY		_PAGE_ALWAYS_ZERO_2
+
+/* Pages owned, and protected by, the kernel. */
+#define _PAGE_KERNEL		_PAGE_PRIV
+
+/* No cacheing of this page */
+#define _PAGE_CACHE_WIN0	(MMCU_CWIN_UNCACHED << MMCU_ENTRY_CWIN_S)
+/* burst cacheing - good for data streaming */
+#define _PAGE_CACHE_WIN1	(MMCU_CWIN_BURST << MMCU_ENTRY_CWIN_S)
+/* One cache way per thread */
+#define _PAGE_CACHE_WIN2	(MMCU_CWIN_C1SET << MMCU_ENTRY_CWIN_S)
+/* Full on cacheing */
+#define _PAGE_CACHE_WIN3	(MMCU_CWIN_CACHED << MMCU_ENTRY_CWIN_S)
+
+#define _PAGE_CACHEABLE		(_PAGE_CACHE_WIN3 | _PAGE_WR_COMBINE)
+
+/* which bits are used for cache control ... */
+#define _PAGE_CACHE_MASK	(_PAGE_CACHE_CTRL0 | _PAGE_CACHE_CTRL1 | \
+				 _PAGE_WR_COMBINE)
+
+/* This is a mask of the bits that pte_modify is allowed to change. */
+#define _PAGE_CHG_MASK		(PAGE_MASK)
+
+#define _PAGE_SZ_SHIFT		1
+#define _PAGE_SZ_4K		(0x0)
+#define _PAGE_SZ_8K		(0x1 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_16K		(0x2 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_32K		(0x3 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_64K		(0x4 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_128K		(0x5 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_256K		(0x6 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_512K		(0x7 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_1M		(0x8 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_2M		(0x9 << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_4M		(0xa << _PAGE_SZ_SHIFT)
+#define _PAGE_SZ_MASK		(0xf << _PAGE_SZ_SHIFT)
+
+#if defined(CONFIG_PAGE_SIZE_4K)
+#define _PAGE_SZ		(_PAGE_SZ_4K)
+#elif defined(CONFIG_PAGE_SIZE_8K)
+#define _PAGE_SZ		(_PAGE_SZ_8K)
+#elif defined(CONFIG_PAGE_SIZE_16K)
+#define _PAGE_SZ		(_PAGE_SZ_16K)
+#endif
+#define _PAGE_TABLE		(_PAGE_SZ | _PAGE_PRESENT)
+
+#if defined(CONFIG_HUGETLB_PAGE_SIZE_8K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_8K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_16K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_16K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_32K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_32K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_64K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_64K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_128K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_128K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_256K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_256K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_512K)
+# define _PAGE_SZHUGE		(_PAGE_SZ_512K)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_1M)
+# define _PAGE_SZHUGE		(_PAGE_SZ_1M)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_2M)
+# define _PAGE_SZHUGE		(_PAGE_SZ_2M)
+#elif defined(CONFIG_HUGETLB_PAGE_SIZE_4M)
+# define _PAGE_SZHUGE		(_PAGE_SZ_4M)
+#endif
+
+#endif /* _METAG_PGTABLE_BITS_H */
diff --git a/arch/metag/include/asm/pgtable.h b/arch/metag/include/asm/=
pgtable.h
index d0604c0a8702..ffa3a3a2ecad 100644
--- a/arch/metag/include/asm/pgtable.h
+++ b/arch/metag/include/asm/pgtable.h
@@ -5,6 +5,7 @@
 #ifndef _METAG_PGTABLE_H
 #define _METAG_PGTABLE_H
=20
+#include <asm/pgtable-bits.h>
 #include <asm-generic/pgtable-nopmd.h>
=20
 /* Invalid regions on Meta: 0x00000000-0x001FFFFF and 0xFFFF0000-0xFFF=
=46FFFF */
@@ -21,100 +22,6 @@
 #endif
=20
 /*
- * Definitions for MMU descriptors
- *
- * These are the hardware bits in the MMCU pte entries.
- * Derived from the Meta toolkit headers.
- */
-#define _PAGE_PRESENT		MMCU_ENTRY_VAL_BIT
-#define _PAGE_WRITE		MMCU_ENTRY_WR_BIT
-#define _PAGE_PRIV		MMCU_ENTRY_PRIV_BIT
-/* Write combine bit - this can cause writes to occur out of order */
-#define _PAGE_WR_COMBINE	MMCU_ENTRY_WRC_BIT
-/* Sys coherent bit - this bit is never used by Linux */
-#define _PAGE_SYS_COHERENT	MMCU_ENTRY_SYS_BIT
-#define _PAGE_ALWAYS_ZERO_1	0x020
-#define _PAGE_CACHE_CTRL0	0x040
-#define _PAGE_CACHE_CTRL1	0x080
-#define _PAGE_ALWAYS_ZERO_2	0x100
-#define _PAGE_ALWAYS_ZERO_3	0x200
-#define _PAGE_ALWAYS_ZERO_4	0x400
-#define _PAGE_ALWAYS_ZERO_5	0x800
-
-/* These are software bits that we stuff into the gaps in the hardware
- * pte entries that are not used.  Note, these DO get stored in the ac=
tual
- * hardware, but the hardware just does not use them.
- */
-#define _PAGE_ACCESSED		_PAGE_ALWAYS_ZERO_1
-#define _PAGE_DIRTY		_PAGE_ALWAYS_ZERO_2
-
-/* Pages owned, and protected by, the kernel. */
-#define _PAGE_KERNEL		_PAGE_PRIV
-
-/* No cacheing of this page */
-#define _PAGE_CACHE_WIN0	(MMCU_CWIN_UNCACHED << MMCU_ENTRY_CWIN_S)
-/* burst cacheing - good for data streaming */
-#define _PAGE_CACHE_WIN1	(MMCU_CWIN_BURST << MMCU_ENTRY_CWIN_S)
-/* One cache way per thread */
-#define _PAGE_CACHE_WIN2	(MMCU_CWIN_C1SET << MMCU_ENTRY_CWIN_S)
-/* Full on cacheing */
-#define _PAGE_CACHE_WIN3	(MMCU_CWIN_CACHED << MMCU_ENTRY_CWIN_S)
-
-#define _PAGE_CACHEABLE		(_PAGE_CACHE_WIN3 | _PAGE_WR_COMBINE)
-
-/* which bits are used for cache control ... */
-#define _PAGE_CACHE_MASK	(_PAGE_CACHE_CTRL0 | _PAGE_CACHE_CTRL1 | \
-				 _PAGE_WR_COMBINE)
-
-/* This is a mask of the bits that pte_modify is allowed to change. */
-#define _PAGE_CHG_MASK		(PAGE_MASK)
-
-#define _PAGE_SZ_SHIFT		1
-#define _PAGE_SZ_4K		(0x0)
-#define _PAGE_SZ_8K		(0x1 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_16K		(0x2 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_32K		(0x3 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_64K		(0x4 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_128K		(0x5 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_256K		(0x6 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_512K		(0x7 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_1M		(0x8 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_2M		(0x9 << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_4M		(0xa << _PAGE_SZ_SHIFT)
-#define _PAGE_SZ_MASK		(0xf << _PAGE_SZ_SHIFT)
-
-#if defined(CONFIG_PAGE_SIZE_4K)
-#define _PAGE_SZ		(_PAGE_SZ_4K)
-#elif defined(CONFIG_PAGE_SIZE_8K)
-#define _PAGE_SZ		(_PAGE_SZ_8K)
-#elif defined(CONFIG_PAGE_SIZE_16K)
-#define _PAGE_SZ		(_PAGE_SZ_16K)
-#endif
-#define _PAGE_TABLE		(_PAGE_SZ | _PAGE_PRESENT)
-
-#if defined(CONFIG_HUGETLB_PAGE_SIZE_8K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_8K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_16K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_16K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_32K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_32K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_64K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_64K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_128K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_128K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_256K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_256K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_512K)
-# define _PAGE_SZHUGE		(_PAGE_SZ_512K)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_1M)
-# define _PAGE_SZHUGE		(_PAGE_SZ_1M)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_2M)
-# define _PAGE_SZHUGE		(_PAGE_SZ_2M)
-#elif defined(CONFIG_HUGETLB_PAGE_SIZE_4M)
-# define _PAGE_SZHUGE		(_PAGE_SZ_4M)
-#endif
-
-/*
  * The Linux memory management assumes a three-level page table setup.=
 On
  * Meta, we use that, but "fold" the mid level into the top-level page
  * table.
--=20
2.0.5
