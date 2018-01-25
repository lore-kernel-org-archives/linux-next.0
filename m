From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Thu, 25 Jan 2018 08:58:40 -0600
Message-ID: <20180125145840.GA51505@bhelgaas-glaptop.roam.corp.google.com>
References: <20180125164937.32fef5a8@canb.auug.org.au>
 <CAL_JsqKfKHL8fUxEwhrfytLfWgMLLtbBm2J6vf0Ab1t4i28nRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751256AbeAYO6m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 09:58:42 -0500
Content-Disposition: inline
In-Reply-To: <CAL_JsqKfKHL8fUxEwhrfytLfWgMLLtbBm2J6vf0Ab1t4i28nRA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 25, 2018 at 07:55:58AM -0600, Rob Herring wrote:
> On Wed, Jan 24, 2018 at 11:49 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Bjorn,
> >
> > After merging the pci tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > arch/powerpc/kernel/pci-common.c: In function 'pcibios_setup
> > _device':
> > arch/powerpc/kernel/pci-common.c:406:15: error: 'virq' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >   pci_dev->irq = virq;
> >   ~~~~~~~~~~~~~^~~~~~
> > arch/powerpc/kernel/pci-common.c:365:15: note: 'virq' was declared here
> >   unsigned int virq;
> >                ^~~~
> 
> I guess I need to update my PPC compiler from 4.8.0. It doesn't warn
> or error on this. Neither did 0-day.
> 
> >
> > Caused by commit
> >
> >   c5042ac60fe5 ("powerpc/pci: Use of_irq_parse_and_map_pci() helper")
> >
> > I have applied the following patch for today:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 25 Jan 2018 16:44:19 +1100
> > Subject: [PATCH] powerpc/pci: fix for "Use of_irq_parse_and_map_pci() helper"
> >
> > Fixes: c5042ac60fe5 ("powerpc/pci: Use of_irq_parse_and_map_pci() helper")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/powerpc/kernel/pci-common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> >
> > diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> > index 6be3f2c22a9b..ae2ede4de6be 100644
> > --- a/arch/powerpc/kernel/pci-common.c
> > +++ b/arch/powerpc/kernel/pci-common.c
> > @@ -362,7 +362,7 @@ struct pci_controller* pci_find_hose_for_OF_device(struct device_node* node)
> >   */
> >  static int pci_read_irq_line(struct pci_dev *pci_dev)
> >  {
> > -       unsigned int virq;
> > +       unsigned int virq = 0;
> >
> >         pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
> >

I folded this fix into my branch, so it should be fixed tonight.
Thanks!
