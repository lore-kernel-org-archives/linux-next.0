From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Date: Tue, 15 Dec 2015 17:44:39 +1100
Message-ID: <20151215174439.4fd3177c@canb.auug.org.au>
References: <20151215165342.15bb4526@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57699 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752273AbbLOGom (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Dec 2015 01:44:42 -0500
In-Reply-To: <20151215165342.15bb4526@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Andrew,

On Tue, 15 Dec 2015 16:53:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
> index 8b929e531758..4e69d9a273ed 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -48,9 +43,8 @@
>  /*
>   * set of bits not changed in pmd_modify.
>   */
> -#define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS |		\
> -			 _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPLITTING | \
> -			 _PAGE_THP_HUGE | _PAGE_PTE)
> +#define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS | _PAGE_DIRTY |
                                                                           ^
I missed a backslash here which I fixed up in my tree.

> +			 _PAGE_ACCESSED | _PAGE_THP_HUGE | _PAGE_PTE)
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
