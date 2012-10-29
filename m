From: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Subject: Re: [PATCH] s390: Add pmd_mknotpresent()
Date: Mon, 29 Oct 2012 15:00:48 +0100
Message-ID: <20121029150048.21c062cf@thinkpad>
References: <20121018172201.b81dcc8fe40868256f532364@canb.auug.org.au>
	<20121018182642.2a541275@thinkpad>
	<20121028131014.GA10754@gmail.com>
Reply-To: gerald.schaefer@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:55567 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755350Ab2J2OBD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Oct 2012 10:01:03 -0400
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <gerald.schaefer@de.ibm.com>;
	Mon, 29 Oct 2012 14:01:01 -0000
In-Reply-To: <20121028131014.GA10754@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Sun, 28 Oct 2012 14:10:14 +0100
Ingo Molnar <mingo@kernel.org> wrote:

> 
> There's a related problem on s390: other THP implementations 
> have pmd_mknotpresent() while s390 not, resulting in:
> 
>   mm/huge_memory.c:1543:2: error: implicit declaration of function 'pmd_mknotpresent'
> 
> The (untested!) patch below adds the s390 version of this 
> method.
> 
> Gerald, Martin, did I get the S390 details right?

The upstream thp patches for s390 fixed that by adding pmdp_invalidate() and
replacing the pmd_mknotpresent() in mm/huge_memory.c, see git commit 46dcde73.
The pmdp_invalidate() is already included linux-next, so it should be ok to
just change mm/huge_memory.c similar to upstream:

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f1c2679..842b6df 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1537,8 +1537,7 @@ static int __split_huge_page_map(struct page *page,
 	 * complete. The ptl also protects against concurrent faults due to
 	 * making the pmd not-present.
 	 */
-	set_pmd_at(mm, address, pmd, pmd_mknotpresent(*pmd));
-	flush_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
+	pmdp_invalidate(vma, address, pmd);
 	pmd_populate(mm, pmd, pgtable);
 	ret = 1;

With this, s390 does not need a pmd_mknotpresent(), and using
set_pmd_at(..., pmd_mknotpresent()) would be wrong on s390 anyway because
we need a flushing operation to change a valid pmd.


> 
> Thanks,
> 
> 	Ingo
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 098fc5a..b820ff1 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1310,6 +1310,12 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
>  	return pmd;
>  }
> 
> +static inline pmd_t pmd_mknotpresent(pmd_t pmd)
> +{
> +	pmd_val(pmd) &= ~_SEGMENT_ENTRY_ORIGIN;
> +	return pmd;
> +}
> +
>  #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
>  static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  					    unsigned long address, pmd_t *pmdp)
> 
