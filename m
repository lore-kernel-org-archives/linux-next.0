From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 9 Feb 2015 03:53:07 +0000
Message-ID: <20150209035306.GA9001@e102568-lin.cambridge.arm.com>
References: <20150209132642.0d61b6ed@canb.auug.org.au>
 <38500087.9UIeKqQhFX@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:56332 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754797AbbBIDxR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Feb 2015 22:53:17 -0500
In-Reply-To: <38500087.9UIeKqQhFX@vostro.rjw.lan>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>

On Mon, Feb 09, 2015 at 03:19:33AM +0000, Rafael J. Wysocki wrote:
> On Monday, February 09, 2015 01:26:42 PM Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > After merging the pm tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > In file included from drivers/of/of_pci.c:1:0:
> > drivers/of/of_pci.c: In function 'of_pci_get_host_bridge_resources':
> > include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
> >   for (pos = list_first_entry(head, typeof(*pos), member); \
> >                                            ^
> 
> [cut]
> 
> > 
> > Caused by commit 14d76b68f281 ("PCI: Use common resource list
> > management code instead of private implementation") interacting with
> > commit d2be00c0fb5a ("of/pci: Free resources on failure in
> > of_pci_get_host_bridge_resources()") from the pci tree.
> 
> Thanks for identifying this!

Thank you !

> > I applied the following merge fix patch (which may need more work?).
> > Someone needs to remember to tell Linus about this fix (or similar)
> > when these trees get merged.
> 
> The patch looks correct to me, so I did the following.
> 
> I pulled the Bjorn's pci/host-generic branch that contained just that one
> commit which conflicted with the Gerry's one into my acpi-resources branch
> and folded the patch below into the merge.
> 

It looks fine to me, thank you.

Lorenzo

> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 9 Feb 2015 13:08:24 +1100
> > Subject: [PATCH] of/pci: fix up for "PCI: Use common resource list management
> >  code instead of private implementation"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/of/of_pci.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> > index 60dc36c865b5..110fece2ff53 100644
> > --- a/drivers/of/of_pci.c
> > +++ b/drivers/of/of_pci.c
> > @@ -140,7 +140,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
> >  			unsigned char busno, unsigned char bus_max,
> >  			struct list_head *resources, resource_size_t *io_base)
> >  {
> > -	struct pci_host_bridge_window *window;
> > +	struct resource_entry *window;
> >  	struct resource *res;
> >  	struct resource *bus_range;
> >  	struct of_pci_range range;
> > @@ -226,7 +226,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
> >  conversion_failed:
> >  	kfree(res);
> >  parse_failed:
> > -	list_for_each_entry(window, resources, list)
> > +	resource_list_for_each_entry(window, resources)
> >  		kfree(window->res);
> >  	pci_free_resource_list(resources);
> >  	kfree(bus_range);
> > 
> 
> -- 
> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.
