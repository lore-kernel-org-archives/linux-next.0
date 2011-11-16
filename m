From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] mm: Fix alloc_vm_area for noMMU system
Date: Wed, 16 Nov 2011 09:11:47 -0500
Message-ID: <20111116141147.GA3931@phenom.dumpdata.com>
References: <1321429862-17703-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:33243 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757753Ab1KPOMF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2011 09:12:05 -0500
Content-Disposition: inline
In-Reply-To: <1321429862-17703-1-git-send-email-monstr@monstr.eu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-next@vger.kernel.org, sfr@canb.auug.org.au, David Vrabel <david.vrabel@citrix.com>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Nov 16, 2011 at 08:51:02AM +0100, Michal Simek wrote:
> Patch:
> "xen: map foreign pages for shared rings by updating the PTEs directly"
> (sha1: 5149c0d53f6959d6ab87b4702d544b17ebdc783e) changed number
> of argument for alloc_vm_area but forget to change it for noMMU systems.
> This patch fix it.
> 
> CC: David Vrabel <david.vrabel@citrix.com>
> CC: Andrew Morton <akpm@linux-foundation.org>

Andrew, I was thinking to send that "xen: map foreign pages.." to Linus
at some point.

Is it OK if I have your Ack on this patch and stick this with the
mentioned patch in my queue?

> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Michal Simek <monstr@monstr.eu>
> 
> ---
> It is for linux-next tree.
> 
> Michal
> ---
>  mm/nommu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 73419c5..b982290 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -454,7 +454,7 @@ void  __attribute__((weak)) vmalloc_sync_all(void)
>   *	between processes, it syncs the pagetable across all
>   *	processes.
>   */
> -struct vm_struct *alloc_vm_area(size_t size)
> +struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
>  {
>  	BUG();
>  	return NULL;
> -- 
> 1.7.5.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
