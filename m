From: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (tip/s390 trees related)
Date: Thu, 18 Oct 2012 18:26:42 +0200
Message-ID: <20121018182642.2a541275@thinkpad>
References: <20121018172201.b81dcc8fe40868256f532364@canb.auug.org.au>
Reply-To: gerald.schaefer@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:34483 "EHLO
	e06smtp10.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756258Ab2JRQ0u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Oct 2012 12:26:50 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <gerald.schaefer@de.ibm.com>;
	Thu, 18 Oct 2012 17:26:48 +0100
In-Reply-To: <20121018172201.b81dcc8fe40868256f532364@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

On Thu, 18 Oct 2012 17:22:01 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (s390 allyesconfig)
> failed like this:
> 
> mm/huge_memory.c:1424:2: error: implicit declaration of function 'pmd_pgprot' [-Werror=implicit-function-declaration]
> mm/huge_memory.c:1424:7: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
> 
> (see http://kisskb.ellerman.id.au/kisskb/buildresult/7383823/)
> 
> Caused by commit 35d3d3427314 ("s390/thp: select
> HAVE_ARCH_TRANSPARENT_HUGEPAGE") from the s390 tree interacting with
> commit 93c9d633bd9e ("mm/thp: Preserve pgprot across huge page split")
> from the tip tree.
> 
> N.B. Mips also selects HAVE_ARCH_TRANSPARENT_HUGEPAGE as of commit
> e21a828a1bba ("MIPS: Transparent Huge Pages support") from the mips tree
> and so will be broken in some configs now as well.
> 
> Anyone have suggested merge fix patches I can apply?

Subject: [PATCH] s390/thp: implement pmd_pgprot() for s390

git commit "mm/thp: Preserve pgprot across huge page split" in
linux-next introduced a pmd_pgprot() function, which is missing on
s390, resulting in a compile error when transparent huge pages are
enabled. This patch adds an implementation of pmd_pgprot() for s390.

Signed-off-by: Gerald Schaefer <gerald.schaefer@de.ibm.com>
---
 arch/s390/include/asm/pgtable.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index f8887ab..2846920 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1250,6 +1250,19 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	*pmdp = entry;
 }
 
+static inline pgprot_t pmd_pgprot(pmd_t pmd)
+{
+	pgprot_t prot = PAGE_RW;
+
+	if (pmd_val(pmd) & _SEGMENT_ENTRY_RO) {
+		if (pmd_val(pmd) & _SEGMENT_ENTRY_INV)
+			prot = PAGE_NONE;
+		else
+			prot = PAGE_RO;
+	}
+	return prot;
+}
+
 static inline unsigned long massage_pgprot_pmd(pgprot_t pgprot)
 {
 	unsigned long pgprot_pmd = 0;
-- 
1.7.11.7
