From: Sabrina Dubroca <sd@queasysnail.net>
Subject: Re: linux-next: Tree for Feb 13
Date: Fri, 13 Feb 2015 12:03:26 +0100
Message-ID: <20150213110326.GA26177@kria>
References: <20150213165615.1ad43047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:25952 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751465AbbBMLDd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2015 06:03:33 -0500
Content-Disposition: inline
In-Reply-To: <20150213165615.1ad43047@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

2015-02-13, 16:56:15 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 
> Changes since 20150212:

Hi Stephen,

Your conflict resolution in

8fe7fba50596 "Merge branch 'akpm-current/current'"

for mm/memory.c looks a bit off.  I get flooded with these messages:

  BUG: non-zero nr_pmds on freeing mm: 4

and fixed it with:


diff --git a/mm/memory.c b/mm/memory.c
index 450e4952c5ef..802adda2b0b6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3350,7 +3350,6 @@ int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 	smp_wmb(); /* See comment in __pte_alloc */
 
 	spin_lock(&mm->page_table_lock);
-	mm_inc_nr_pmds(mm);
 #ifndef __ARCH_HAS_4LEVEL_HACK
 	if (!pud_present(*pud)) {
 		mm_inc_nr_pmds(mm);


references:
http://www.spinics.net/lists/linux-mm/msg84294.html
dc6c9a35b66b "mm: account pmd page tables to the process"

[CC'ed Kirill A. Shutemov]


Thanks

-- 
Sabrina
