From: Ingo Molnar <mingo@kernel.org>
Subject: [PATCH] s390: Add pmd_mknotpresent()
Date: Sun, 28 Oct 2012 14:10:14 +0100
Message-ID: <20121028131014.GA10754@gmail.com>
References: <20121018172201.b81dcc8fe40868256f532364@canb.auug.org.au>
 <20121018182642.2a541275@thinkpad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:51994 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752094Ab2J1NKU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Oct 2012 09:10:20 -0400
Content-Disposition: inline
In-Reply-To: <20121018182642.2a541275@thinkpad>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>


There's a related problem on s390: other THP implementations 
have pmd_mknotpresent() while s390 not, resulting in:

  mm/huge_memory.c:1543:2: error: implicit declaration of function 'pmd_mknotpresent'

The (untested!) patch below adds the s390 version of this 
method.

Gerald, Martin, did I get the S390 details right?

Thanks,

	Ingo

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 098fc5a..b820ff1 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1310,6 +1310,12 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pmd;
 }
 
+static inline pmd_t pmd_mknotpresent(pmd_t pmd)
+{
+	pmd_val(pmd) &= ~_SEGMENT_ENTRY_ORIGIN;
+	return pmd;
+}
+
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
 static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address, pmd_t *pmdp)
