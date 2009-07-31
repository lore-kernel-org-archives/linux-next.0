From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] next-20090730 lguest build breaks with pfn_pmd()
Date: Fri, 31 Jul 2009 11:03:56 -0700
Message-ID: <20090731110356.cd0bc550.randy.dunlap@oracle.com>
References: <20090729173611.b82478cd.sfr@canb.auug.org.au>
	<20090730120533.GB4955@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:28466 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063AbZGaSEe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2009 14:04:34 -0400
In-Reply-To: <20090730120533.GB4955@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: rusty@rustcorp.com.au, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lguest@ozlabs.org, sfr@canb.auug.org.au

On Thu, 30 Jul 2009 17:35:33 +0530 Kamalesh Babulal wrote:

> Hi Rusty,
> 
> 	next-20090729 allmodconfig build breaks at
> 
> drivers/lguest/page_tables.c: In function 'setup_pagetables':
> drivers/lguest/page_tables.c:987: error: incompatible type for argument 2 of 'pfn_pmd'
> drivers/lguest/page_tables.c:994: error: expected ';' before ')' token
> drivers/lguest/page_tables.c:994: error: expected statement before ')' token
> make[2]: *** [drivers/lguest/page_tables.o] Error 1
> 
> build failure is introduced by commit e07dd6220a4bf81a2549e7e37523a2557547d9d7
> I have tested the patch for the build failure only.
> 
> Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
> --
>  drivers/lguest/page_tables.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/lguest/page_tables.c b/drivers/lguest/page_tables.c
> index 8c86446..c610b82 100644
> --- a/drivers/lguest/page_tables.c
> +++ b/drivers/lguest/page_tables.c
> @@ -984,14 +984,14 @@ static unsigned long setup_pagetables(struct lguest *lg,
>  	for (i = j = 0; i < mapped_pages && j < PTRS_PER_PMD;
>  	     i += PTRS_PER_PTE, j++) {
>  		pmd = pfn_pmd(((unsigned long)&linear[i] - mem_base)/PAGE_SIZE,
> -			      _PAGE_PRESENT | _PAGE_RW | _PAGE_USER);
> +			      __pgrot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER));

s/__pgrot/__pgprot/


>  
>  		if (copy_to_user(&pmds[j], &pmd, sizeof(pmd)) != 0)
>  			return -EFAULT;
>  	}
>  
>  	/* One PGD entry, pointing to that PMD page. */
> -	pgd = __pgd(((unsigned long)pmds - mem_base) | _PAGE_PRESENT));
> +	pgd = __pgd(((unsigned long)pmds - mem_base) | _PAGE_PRESENT);
>  	/* Copy it in as the first PGD entry (ie. addresses 0-1G). */
>  	if (copy_to_user(&pgdir[0], &pgd, sizeof(pgd)) != 0)
>  		return -EFAULT;


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
