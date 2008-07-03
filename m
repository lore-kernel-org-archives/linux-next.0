From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: inux-next: Tree for July 1
Date: Wed, 2 Jul 2008 21:58:46 -0700
Message-ID: <20080702215846.f6b0491b.akpm@linux-foundation.org>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au>
	<20080702215306.61367733.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:55348 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752929AbYGCFAt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 01:00:49 -0400
In-Reply-To: <20080702215306.61367733.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@d>

On Wed, 2 Jul 2008 21:53:06 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> s390 allmodconfig:
> 
> In file included from include/asm/pgtable.h:1087,
>                  from include/linux/mm.h:39,
>                  from arch/s390/mm/hugetlbpage.c:8:
> include/asm-generic/pgtable.h: In function '__ptep_modify_prot_start':
> include/asm-generic/pgtable.h:209: error: dereferencing pointer to incomplete type

OK, this wasn't very pretty:

--- a/include/asm-generic/pgtable.h~s390-build-fixes
+++ a/include/asm-generic/pgtable.h
@@ -197,17 +197,13 @@ static inline int pmd_none_or_clear_bad(
 }
 #endif /* CONFIG_MMU */
 
-static inline pte_t __ptep_modify_prot_start(struct mm_struct *mm,
-					     unsigned long addr,
-					     pte_t *ptep)
-{
-	/*
-	 * Get the current pte state, but zero it out to make it
-	 * non-present, preventing the hardware from asynchronously
-	 * updating it.
-	 */
-	return ptep_get_and_clear(mm, addr, ptep);
-}
+/*
+ * Get the current pte state, but zero it out to make it
+ * non-present, preventing the hardware from asynchronously
+ * updating it.
+ */
+#define __ptep_modify_prot_start(mm, addr, ptep)	\
+	ptep_get_and_clear(mm, addr, ptep)
 
 static inline void __ptep_modify_prot_commit(struct mm_struct *mm,
 					     unsigned long addr,
@@ -235,12 +231,8 @@ static inline void __ptep_modify_prot_co
  * queue the update to be done at some later time.  The update must be
  * actually committed before the pte lock is released, however.
  */
-static inline pte_t ptep_modify_prot_start(struct mm_struct *mm,
-					   unsigned long addr,
-					   pte_t *ptep)
-{
-	return __ptep_modify_prot_start(mm, addr, ptep);
-}
+#define ptep_modify_prot_start(mm, addr, ptep)		\
+	__ptep_modify_prot_start(mm, addr, ptep)
 
 /*
  * Commit an update to a pte, leaving any hardware-controlled bits in
_
