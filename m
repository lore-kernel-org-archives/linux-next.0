From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Oct 2015 16:59:32 +1100
Message-ID: <20151021165932.3160cb59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37900 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753158AbbJUF7e (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Oct 2015 01:59:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Dufour <ldufour@linux.vnet.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Pavel Emelyanov <xemul@parallels.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
allnoconfig) failed like this:

In file included from arch/powerpc/include/asm/thread_info.h:34:0,
                 from include/linux/thread_info.h:54,
                 from include/asm-generic/preempt.h:4,
                 from arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:35,
                 from include/linux/time.h:5,
                 from include/uapi/linux/timex.h:56,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:19,
                 from arch/powerpc/kernel/asm-offsets.c:17:
arch/powerpc/include/asm/pgtable.h: In function 'pte_pgprot':
arch/powerpc/include/asm/pte-common.h:104:18: error: '_PAGE_SOFT_DIRTY' undeclared (first use in this function)
     _PAGE_EXEC | _PAGE_SOFT_DIRTY)
                  ^
arch/powerpc/include/asm/page.h:359:22: note: in definition of macro '__pgprot'
 #define __pgprot(x) (x)
                      ^
arch/powerpc/include/asm/pgtable.h:39:79: note: in expansion of macro 'PAGE_PROT_BITS'
 static inline pgprot_t pte_pgprot(pte_t pte) { return __pgprot(pte_val(pte) & PAGE_PROT_BITS); }
                                                                               ^
arch/powerpc/include/asm/pte-common.h:104:18: note: each undeclared identifier is reported only once for each function it appears in
     _PAGE_EXEC | _PAGE_SOFT_DIRTY) 
                  ^
arch/powerpc/include/asm/page.h:359:22: note: in definition of macro '__pgprot'
 #define __pgprot(x) (x)
                      ^
arch/powerpc/include/asm/pgtable.h:39:79: note: in expansion of macro 'PAGE_PROT_BITS'
 static inline pgprot_t pte_pgprot(pte_t pte) { return __pgprot(pte_val(pte) & PAGE_PROT_BITS); }
                                                                               ^
In file included from include/linux/mm.h:55:0,
                 from include/linux/mman.h:4,
                 from arch/powerpc/kernel/asm-offsets.c:22:
arch/powerpc/include/asm/pgtable.h: In function 'pte_mkdirty':
arch/powerpc/include/asm/pgtable.h:130:32: error: '_PAGE_SOFT_DIRTY' undeclared (first use in this function)
  pte_val(pte) |= _PAGE_DIRTY | _PAGE_SOFT_DIRTY; return pte; }
                                ^   
In file included from arch/powerpc/include/asm/pgtable-ppc32.h:123:0,
                 from arch/powerpc/include/asm/pgtable.h:19,
                 from include/linux/mm.h:55,
                 from include/linux/mman.h:4,
                 from arch/powerpc/kernel/asm-offsets.c:22:
arch/powerpc/include/asm/pgtable.h: In function 'pte_modify':
arch/powerpc/include/asm/pte-common.h:97:38: error: '_PAGE_SOFT_DIRTY' undeclared (first use in this function)
     _PAGE_ACCESSED | _PAGE_SPECIAL | _PAGE_SOFT_DIRTY)
                                      ^
arch/powerpc/include/asm/pgtable.h:139:33: note: in expansion of macro '_PAGE_CHG_MASK'
  pte_val(pte) = (pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot);
                                 ^  
./Kbuild:80: recipe for target 'arch/powerpc/kernel/asm-offsets.s' failed

Caused by commit

  8bd232790748 ("powerpc/mm: add page soft dirty tracking")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
