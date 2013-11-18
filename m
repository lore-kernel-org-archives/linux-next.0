From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: RE: linux-next: build failure after merge of the final tree
Date: Mon, 18 Nov 2013 10:49:41 +0200 (EET)
Message-ID: <20131118084941.A9C76E0090@blue.fi.intel.com>
References: <20131118141933.7314374b0157183e0613599d@canb.auug.org.au>
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:54539 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750836Ab3KRItz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Nov 2013 03:49:55 -0500
In-Reply-To: <20131118141933.7314374b0157183e0613599d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "David S. Miller" <davem@davemloft.net>

Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> arch/sparc/mm/init_64.c: In function 'pte_alloc_one':
> arch/sparc/mm/init_64.c:2568:9: error: unused variable 'pte' [-Werror=unused-variable]
> 
> Caused by the merge between commit 37b3a8ff3e08 ("sparc64: Move from 4MB
> to 8MB huge pages") and commit 1ae9ae5f7df7 ("sparc: handle
> pgtable_page_ctor() fail") (I had the following merge fix in linux-next,
> but it didn't seem to propagate upstream - may have forgotten to point it
> out :-().
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Nov 2013 14:16:40 +1100
> Subject: [PATCH] sparc64: merge fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

> ---
>  arch/sparc/mm/init_64.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 6b643790e4fe..5322e530d09c 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2565,8 +2565,6 @@ pgtable_t pte_alloc_one(struct mm_struct *mm,
>  {
>  	struct page *page = alloc_page(GFP_KERNEL | __GFP_NOTRACK |
>  				       __GFP_REPEAT | __GFP_ZERO);
> -	pte_t *pte = NULL;
> -
>  	if (!page)
>  		return NULL;
>  	if (!pgtable_page_ctor(page)) {
> -- 
> 1.8.4.3
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

-- 
 Kirill A. Shutemov
