From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 02 May 2016 16:47:10 +0530
Message-ID: <87h9egzp3d.fsf@skywalker.in.ibm.com>
References: <20160502183234.1dad8115@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:43035 "EHLO
	e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753619AbcEBLSP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 07:18:15 -0400
Received: from localhost
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Mon, 2 May 2016 21:18:12 +1000
In-Reply-To: <20160502183234.1dad8115@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ebru Akagunduz <ebru.akagunduz@gmail.com>, Rik van Riel <riel@redhat.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> allyesconfig and pseries_le_defconfig) failed like this:
>
> In file included from include/linux/mm.h:394:0,
>                  from mm/huge_memory.c:10:
> include/linux/huge_mm.h:53:22: error: initializer element is not constant
>  #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
>                       ^
> mm/huge_memory.c:104:62: note: in expansion of macro 'HPAGE_PMD_NR'
>  static unsigned int khugepaged_max_ptes_swap __read_mostly = HPAGE_PMD_NR/8;
>                                                               ^
>
> Caused by commit
>
>   6d34b9749be2 ("mm: make optimistic check for swapin readahead")
>
> interacting with commit
>
>   dd1842a2a448 ("powerpc/mm: Make page table size a variable")
>
> from the powerpc tree.
>
> I applied this fix patch for today (hopefully this is still initialised
> early enough):
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 May 2016 18:25:42 +1000
> Subject: [PATCH] mm: make optimistic check for swapin readahead fix
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>


Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

> ---
>  mm/huge_memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index f0cd9dbc1157..6aabfa166b6d 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -101,7 +101,7 @@ static DECLARE_WAIT_QUEUE_HEAD(khugepaged_wait);
>   * fault.
>   */
>  static unsigned int khugepaged_max_ptes_none __read_mostly;
> -static unsigned int khugepaged_max_ptes_swap __read_mostly = HPAGE_PMD_NR/8;
> +static unsigned int khugepaged_max_ptes_swap __read_mostly;
>  static unsigned long allocstall;
>
>  static int khugepaged(void *none);
> @@ -703,6 +703,7 @@ static int __init hugepage_init(void)
>
>  	khugepaged_pages_to_scan = HPAGE_PMD_NR * 8;
>  	khugepaged_max_ptes_none = HPAGE_PMD_NR - 1;
> +	khugepaged_max_ptes_swap = HPAGE_PMD_NR / 8;
>  	/*
>  	 * hugepages can't be allocated by the buddy allocator
>  	 */
> -- 
> 2.7.0
>
>
>
>
> -- 
> Cheers,
> Stephen Rothwell
