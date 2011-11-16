From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] mm: Fix alloc_vm_area for noMMU system
Date: Wed, 16 Nov 2011 09:18:48 -0500
Message-ID: <20111116141848.GA29081@phenom.dumpdata.com>
References: <1321429862-17703-1-git-send-email-monstr@monstr.eu>
 <20111116135900.GB6958@phenom.dumpdata.com>
 <4EC3C238.40103@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:41470 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757766Ab1KPOTG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2011 09:19:06 -0500
Content-Disposition: inline
In-Reply-To: <4EC3C238.40103@citrix.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@citrix.com>
Cc: Michal Simek <monstr@monstr.eu>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Nov 16, 2011 at 02:01:28PM +0000, David Vrabel wrote:
> On 16/11/11 13:59, Konrad Rzeszutek Wilk wrote:
> > On Wed, Nov 16, 2011 at 08:51:02AM +0100, Michal Simek wrote:
> >> Patch:
> >> "xen: map foreign pages for shared rings by updating the PTEs directly"
> >> (sha1: 5149c0d53f6959d6ab87b4702d544b17ebdc783e) changed number
> >> of argument for alloc_vm_area but forget to change it for noMMU systems.
> >> This patch fix it.
> > 
> > Duh!
> >>
> >> CC: David Vrabel <david.vrabel@citrix.com>
> >> CC: Andrew Morton <akpm@linux-foundation.org>
> >> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > 
> > Yes, please. Thank you!
> 
> Konrad, I would suggest folding this into the original patch to avoid
> breaking bisects for noMMU users unnecessarily.

Can't do. We would lose Michal authership that way and that is not good.

> 
> David
> 
> >> Signed-off-by: Michal Simek <monstr@monstr.eu>
> >>
> >> ---
> >> It is for linux-next tree.
> >>
> >> Michal
> >> ---
> >>  mm/nommu.c |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/mm/nommu.c b/mm/nommu.c
> >> index 73419c5..b982290 100644
> >> --- a/mm/nommu.c
> >> +++ b/mm/nommu.c
> >> @@ -454,7 +454,7 @@ void  __attribute__((weak)) vmalloc_sync_all(void)
> >>   *	between processes, it syncs the pagetable across all
> >>   *	processes.
> >>   */
> >> -struct vm_struct *alloc_vm_area(size_t size)
> >> +struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
> >>  {
> >>  	BUG();
> >>  	return NULL;
> >> -- 
> >> 1.7.5.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
