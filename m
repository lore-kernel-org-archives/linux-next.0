From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the  tree
Date: Wed, 30 Oct 2013 17:35:39 +0000
Message-ID: <alpine.DEB.2.02.1310301734420.26077@kaball.uk.xensource.com>
References: <20131030160956.dfa5c1900c2decb0018061b9@canb.auug.org.au> <alpine.DEB.2.02.1310301733230.26077@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1310301733230.26077@kaball.uk.xensource.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Santosh Shilimkar <santosh.shilimkar@ti.com>
List-Id: linux-next.vger.kernel.org

On Wed, 30 Oct 2013, Stefano Stabellini wrote:
> Looks fine thanks!
> Just an heads up: I'll be updating the Xen code below soon so this
> conflict might come up again.

Just to be clear: I meant the dma_capable function.
Sorry for top posting.


> On Wed, 30 Oct 2013, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the xen-tip tree got a conflict in
> > arch/arm/include/asm/dma-mapping.h between commit 223016339ce7 ("ARM:
> > 7805/1: mm: change max*pfn to include the physical offset of memory")
> > from the arm tree and commit 06e6295bcece ("arm: make SWIOTLB available")
> > from the xen-tip tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > 
> > diff --cc arch/arm/include/asm/dma-mapping.h
> > index 863cd84eb1a2,f5945d4e4e9f..000000000000
> > --- a/arch/arm/include/asm/dma-mapping.h
> > +++ b/arch/arm/include/asm/dma-mapping.h
> > @@@ -87,13 -98,42 +99,49 @@@ static inline dma_addr_t virt_to_dma(st
> >   }
> >   #endif
> >   
> >  +/* The ARM override for dma_max_pfn() */
> >  +static inline unsigned long dma_max_pfn(struct device *dev)
> >  +{
> >  +	return PHYS_PFN_OFFSET + dma_to_pfn(dev, *dev->dma_mask);
> >  +}
> >  +#define dma_max_pfn(dev) dma_max_pfn(dev)
> >  +
> > + static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
> > + {
> > + 	unsigned int offset = paddr & ~PAGE_MASK;
> > + 	return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
> > + }
> > + 
> > + static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
> > + {
> > + 	unsigned int offset = dev_addr & ~PAGE_MASK;
> > + 	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
> > + }
> > + 
> > + static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> > + {
> > + 	u64 limit, mask;
> > + 	
> > + 	if (dev->dma_mask)
> > + 		mask = *dev->dma_mask;
> > + 	else 
> > + 		mask = dev->coherent_dma_mask;
> > + 
> > + 	if (mask == 0)
> > + 		return 0;
> > + 
> > + 	limit = (mask + 1) & ~mask;
> > + 	if (limit && size > limit)
> > + 		return 0;
> > + 
> > + 	if ((addr | (addr + size - 1)) & ~mask)
> > + 		return 0;
> > + 
> > + 	return 1;
> > + }
> > + 
> > + static inline void dma_mark_clean(void *addr, size_t size) { }
> > + 
> >   /*
> >    * DMA errors are defined by all-bits-set in the DMA address.
> >    */
> > 
> 
