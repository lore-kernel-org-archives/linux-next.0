From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 20 Nov 2017 12:57:48 +1100
Message-ID: <20171120125748.156fa18b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

In file included from arch/powerpc/include/asm/book3s/64/mmu
-hash.h:24:0,
                 from arch/powerpc/include/asm/book3s/64/mmu.h:30,
                 from arch/powerpc/include/asm/mmu.h:305,
                 from arch/powerpc/include/asm/lppaca.h:36,
                 from arch/powerpc/include/asm/paca.h:21,
                 from arch/powerpc/include/asm/current.h:16,
                 from include/linux/sched.h:12,
                 from arch/powerpc/kernel/asm-offsets.c:17:
arch/powerpc/include/asm/book3s/64/pgtable.h:844:35: error: expected declaration specifiers or '...' before 'pud_pte'
 #define pud_write(pud)  pte_write(pud_pte(pud))
                                   ^
include/asm-generic/pgtable.h:817:19: note: in expansion of macro 'pud_write'
 static inline int pud_write(pud_t pud)
                   ^

Caused by commit

  5292abe86ee6 ("mm: fix device-dax pud write-faults triggered by get_user_pages()")

grep is your friend ... there may be more fixes needed.

I added the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Nov 2017 12:52:24 +1100
Subject: [PATCH] mm: fix device-dax pud write-faults triggered by
 get_user_pages() fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 1 +
 arch/powerpc/include/asm/nohash/64/pgtable.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 9a677cd5997f..700b26cbd867 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -841,6 +841,7 @@ static inline pud_t pte_pud(pte_t pte)
 {
 	return __pud_raw(pte_raw(pte));
 }
+#define __HAVE_ARCH_PUD_WRITE
 #define pud_write(pud)		pte_write(pud_pte(pud))
 
 static inline int pud_bad(pud_t pud)
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index abddf5830ad5..424053fdf8d2 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -144,6 +144,7 @@ static inline pud_t pte_pud(pte_t pte)
 {
 	return __pud(pte_val(pte));
 }
+#define __HAVE_ARCH_PUD_WRITE
 #define pud_write(pud)		pte_write(pud_pte(pud))
 #define pgd_write(pgd)		pte_write(pgd_pte(pgd))
 
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
