From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Wed, 21 Jun 2017 10:21:59 +0100
Message-ID: <20170621092158.GF3768@arm.com>
References: <20170619091942.GA2702@arm.com>
 <1497866790.22624.164.camel@linux.intel.com>
 <20170619102240.GC2702@arm.com>
 <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
 <20170620084007.GA30664@arm.com>
 <20170620084307.GA9703@lst.de>
 <1497948465.22624.167.camel@linux.intel.com>
 <25d08c14-eea7-8b58-675a-1124200b50a6@codeaurora.org>
 <20170620182034.GF28035@arm.com>
 <3a8d87ae-93ac-09a1-b653-94862ebdfb39@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:49190 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752037AbdFUJVr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 05:21:47 -0400
Content-Disposition: inline
In-Reply-To: <3a8d87ae-93ac-09a1-b653-94862ebdfb39@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Baicar, Tyler" <tbaicar@codeaurora.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Tyler,

On Tue, Jun 20, 2017 at 12:26:01PM -0600, Baicar, Tyler wrote:
> On 6/20/2017 12:20 PM, Will Deacon wrote:
> >On Tue, Jun 20, 2017 at 12:13:13PM -0600, Baicar, Tyler wrote:
> >>I have sent you the rebased patches. I took Christoph's uuid-types tree and
> >>added this patch onto it:
> >>
> >>7bf130e4a065 ("ACPI/APEI: Handle GSIV and GPIO notification types")
> >>
> >>And then added my patches onto that. This will hopefully now avoid conflicts
> >>with any other patch.
> >No, patch 6 fails to apply:
> >
> >On Tue, Jun 20, 2017 at 12:07:27PM -0600, Tyler Baicar wrote:
> >>diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> >>index 7e3ddbe..81ebb9b 100644
> >>--- a/drivers/acpi/apei/ghes.c
> >>+++ b/drivers/acpi/apei/ghes.c
> >>@@ -116,11 +116,7 @@ static inline bool is_hest_type_generic_v2(struct ghes *ghes)
> >>   * Two virtual pages are used, one for IRQ/PROCESS context, the other for
> >>   * NMI context (optionally).
> >>   */
> >>-#ifdef CONFIG_HAVE_ACPI_APEI_NMI
> >>  #define GHES_IOREMAP_PAGES           2
> >>-#else
> >>-#define GHES_IOREMAP_PAGES           1
> >>-#endif
> >>  #define GHES_IOREMAP_IRQ_PAGE(base)	(base)
> >>  #define GHES_IOREMAP_NMI_PAGE(base)	((base) + PAGE_SIZE)
> >>@@ -159,10 +155,14 @@ static void ghes_ioremap_exit(void)
> >>  static void __iomem *ghes_ioremap_pfn_nmi(u64 pfn)
> >>  {
> >>  	unsigned long vaddr;
> >>+	phys_addr_t paddr;
> >>+	pgprot_t prot;
> >>  	vaddr = (unsigned long)GHES_IOREMAP_NMI_PAGE(ghes_ioremap_area->addr);
> >>-	ioremap_page_range(vaddr, vaddr + PAGE_SIZE,
> >>-			   pfn << PAGE_SHIFT, PAGE_KERNEL);
> >>+
> >>+	paddr = pfn << PAGE_SHIFT;
> >>+	prot = arch_apei_get_mem_attribute(paddr);
> >>+	ioremap_page_range(vaddr, vaddr + PAGE_SIZE, paddr, prot);
> >>  	return (void __iomem *)vaddr;
> >>  }
> >>@@ -774,6 +774,50 @@ static int ghes_notify_hed(struct notifier_block *this, unsigned long event,
> >>  	.notifier_call = ghes_notify_hed,
> >In Christoph's tree, this line is:
> >
> >	.notifier_call = ghes_notify_sci,
> >
> >http://git.infradead.org/users/hch/uuid.git/blob/refs/heads/uuid-types:/drivers/acpi/apei/ghes.c#l720
> >
> >so something still isn't right. What did you actually base your patches
> >on?
> Yes, that line is changed in this patch 7bf130e4a065 ("ACPI/APEI: Handle
> GSIV and GPIO notification types")

Ok, but that's not in mainline, not in the arm64 tree and not in Christoph's
branch. I don't want to pull in random cherry-picks that are already in
-next via some other means (looks like this is via -tip?).

> It is the other patch that was conflicting with this patch series when we
> tried to marge although it was a trivial conflict. I applied this patch to
> Christoph's tree and then put my patches on top of that.

If the conflicts are trivial, just base on uuid-types (which I've merged
into the arm64 for-next/ras-apei branch). If they're not trivial, then you
need to co-ordinate better with other developers and I think this will have
to wait another release.

Will
