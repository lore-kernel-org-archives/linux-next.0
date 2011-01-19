From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: build failure in Linus' tree
Date: Tue, 18 Jan 2011 22:12:40 -0500
Message-ID: <20110119031240.GA22583@dumpdata.com>
References: <20110115104004.64335bc5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:47150 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820Ab1ASDNh (ORCPT
	<rfc822;<linux-next@vger.kernel.org>>);
	Tue, 18 Jan 2011 22:13:37 -0500
Content-Disposition: inline
In-Reply-To: <20110115104004.64335bc5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Sat, Jan 15, 2011 at 10:40:04AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> While building Linus' tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "arbitrary_virt_to_machine" [drivers/xen/xen-gntdev.ko] undefined!
> 
> Caused by commit ba5d1012292403c8037adf4a54c4ec50dfe846c4 ("xen/gntdev:
> stop using "token" argument").
> 
> I have applied this patch for today:

Ok. Thanks for spotting that. I stuck it in my tree along with some other
patches for rc1.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Sat, 15 Jan 2011 10:36:26 +1100
> Subject: [PATCH] xen: export arbitrary_virt_to_machine
> 
> fixes build error:
> 
> ERROR: "arbitrary_virt_to_machine" [drivers/xen/xen-gntdev.ko] undefined!
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/xen/mmu.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu.c b/arch/x86/xen/mmu.c
> index 7575e55..5e92b61 100644
> --- a/arch/x86/xen/mmu.c
> +++ b/arch/x86/xen/mmu.c
> @@ -201,6 +201,7 @@ xmaddr_t arbitrary_virt_to_machine(void *vaddr)
>  	offset = address & ~PAGE_MASK;
>  	return XMADDR(((phys_addr_t)pte_mfn(*pte) << PAGE_SHIFT) + offset);
>  }
> +EXPORT_SYMBOL_GPL(arbitrary_virt_to_machine);
>  
>  void make_lowmem_page_readonly(void *vaddr)
>  {
> -- 
> 1.7.2.3
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
