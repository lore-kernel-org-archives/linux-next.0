From: matthieu castet <castet.matthieu@free.fr>
Subject: [PATCH 1/3 V2] [tip:x86/mm] Correcting improper large page preservation
Date: Mon, 06 Sep 2010 23:47:13 +0200
Message-ID: <4C856161.5040806@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080804020503030101040106"
Return-path: <linux-security-module-owner@vger.kernel.org>
Sender: linux-security-module-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org
Cc: Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------080804020503030101040106
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch fixes a bug in try_preserve_large_page() which may result
in improper large page preservation and improper application of page
attributes to the memory area outside of the original change request.
More specifically, the problem manifests itself when set_memory_*() is
called for several pages at the beginning of the large page and
try_preserve_large_page() erroneously concludes that the change can be
applied to whole large page.
The fix consists of 3 parts:
1. addition of "required" protection attributes in
static_protections(), so .data and .bss can be guaranteed to stay "RW"
2. static_protections() is now called for every small page within
large page to determine compatibility of new protection attributes
(instead of just small pages within the requested range).
3. large page can be preserved only if attribute change is
large-page-aligned and covers whole large page.

V1:  try_preserve_large_page() patch for Linux 2.6.34-rc2
V2:  replaced pfn check with address check for kernel rw-data

Signed-off-by: Siarhei Liakh <sliakh.lkml@gmail.com>
Signed-off-by: Xuxian Jiang <jiang@cs.ncsu.edu>
Reviewed-by: Suresh Siddha <suresh.b.siddha@intel.com>

--------------080804020503030101040106
Content-Type: text/x-diff;
 name="x86_page_preservation_fix.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="x86_page_preservation_fix.diff"

diff --git a/arch/x86/mm/pageattr.c b/arch/x86/mm/pageattr.c
index 532e793..91ce756 100644
--- a/arch/x86/mm/pageattr.c
+++ b/arch/x86/mm/pageattr.c
@@ -255,6 +255,7 @@ static inline pgprot_t static_protections(pgprot_t prot, unsigned long address,
 				   unsigned long pfn)
 {
 	pgprot_t forbidden = __pgprot(0);
+	pgprot_t required = __pgprot(0);
 
 	/*
 	 * The BIOS area between 640k and 1Mb needs to be executable for
@@ -278,6 +279,13 @@ static inline pgprot_t static_protections(pgprot_t prot, unsigned long address,
 	if (within(pfn, __pa((unsigned long)__start_rodata) >> PAGE_SHIFT,
 		   __pa((unsigned long)__end_rodata) >> PAGE_SHIFT))
 		pgprot_val(forbidden) |= _PAGE_RW;
+	/*
+	 * .data and .bss should always be writable.
+	 */
+	if (within(address, (unsigned long)_sdata, (unsigned long)_edata) ||
+	    within(address, (unsigned long)__bss_start,
+			(unsigned long)__bss_stop))
+		pgprot_val(required) |= _PAGE_RW;
 
 #if defined(CONFIG_X86_64) && defined(CONFIG_DEBUG_RODATA)
 	/*
@@ -317,6 +325,7 @@ static inline pgprot_t static_protections(pgprot_t prot, unsigned long address,
 #endif
 
 	prot = __pgprot(pgprot_val(prot) & ~pgprot_val(forbidden));
+	prot = __pgprot(pgprot_val(prot) | pgprot_val(required));
 
 	return prot;
 }
@@ -393,7 +402,7 @@ try_preserve_large_page(pte_t *kpte, unsigned long address,
 {
 	unsigned long nextpage_addr, numpages, pmask, psize, flags, addr, pfn;
 	pte_t new_pte, old_pte, *tmp;
-	pgprot_t old_prot, new_prot;
+	pgprot_t old_prot, new_prot, req_prot;
 	int i, do_split = 1;
 	unsigned int level;
 
@@ -438,10 +447,10 @@ try_preserve_large_page(pte_t *kpte, unsigned long address,
 	 * We are safe now. Check whether the new pgprot is the same:
 	 */
 	old_pte = *kpte;
-	old_prot = new_prot = pte_pgprot(old_pte);
+	old_prot = new_prot = req_prot = pte_pgprot(old_pte);
 
-	pgprot_val(new_prot) &= ~pgprot_val(cpa->mask_clr);
-	pgprot_val(new_prot) |= pgprot_val(cpa->mask_set);
+	pgprot_val(req_prot) &= ~pgprot_val(cpa->mask_clr);
+	pgprot_val(req_prot) |= pgprot_val(cpa->mask_set);
 
 	/*
 	 * old_pte points to the large page base address. So we need
@@ -450,17 +459,17 @@ try_preserve_large_page(pte_t *kpte, unsigned long address,
 	pfn = pte_pfn(old_pte) + ((address & (psize - 1)) >> PAGE_SHIFT);
 	cpa->pfn = pfn;
 
-	new_prot = static_protections(new_prot, address, pfn);
+	new_prot = static_protections(req_prot, address, pfn);
 
 	/*
 	 * We need to check the full range, whether
 	 * static_protection() requires a different pgprot for one of
 	 * the pages in the range we try to preserve:
 	 */
-	addr = address + PAGE_SIZE;
-	pfn++;
-	for (i = 1; i < cpa->numpages; i++, addr += PAGE_SIZE, pfn++) {
-		pgprot_t chk_prot = static_protections(new_prot, addr, pfn);
+	addr = address & pmask;
+	pfn = pte_pfn(old_pte);
+	for (i = 0; i < (psize >> PAGE_SHIFT); i++, addr += PAGE_SIZE, pfn++) {
+		pgprot_t chk_prot = static_protections(req_prot, addr, pfn);
 
 		if (pgprot_val(chk_prot) != pgprot_val(new_prot))
 			goto out_unlock;
@@ -483,7 +492,8 @@ try_preserve_large_page(pte_t *kpte, unsigned long address,
 	 * that we limited the number of possible pages already to
 	 * the number of pages in the large page.
 	 */
-	if (address == (nextpage_addr - psize) && cpa->numpages == numpages) {
+	if (address == (address & pmask) &&
+		cpa->numpages == (psize >> PAGE_SHIFT)) {
 		/*
 		 * The address is aligned and the number of pages
 		 * covers the full page.

--------------080804020503030101040106--
