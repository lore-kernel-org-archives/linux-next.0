From: Ley Foon Tan <lftan@altera.com>
Subject: Re: + nios2-convert-to-dma_map_ops.patch added to -mm tree
Date: Thu, 26 Nov 2015 12:59:08 +0800
Message-ID: <1448513948.31217.3.camel@leyfoon-vm>
References: <564b9e3d.3BEL45YWmXM6fCb+%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1on0085.outbound.protection.outlook.com ([157.56.110.85]:60026
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752031AbbKZE66 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2015 23:58:58 -0500
In-Reply-To: <564b9e3d.3BEL45YWmXM6fCb+%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: hch@lst.de
Cc: mm-commits@vger.kernel.org, linux-next@vger.kernel.org, akpm@linux-foundation.org

On Sel, 2015-11-17 at 13:38 -0800, akpm@linux-foundation.org wrote:
> The patch titled
>      Subject: nios2: convert to dma_map_ops
> has been added to the -mm tree.  Its filename is
>      nios2-convert-to-dma_map_ops.patch
> 
> This patch should soon appear at
>     http://ozlabs.org/~akpm/mmots/broken-out/nios2-convert-to-dma_map_ops.patch
> and later at
>     http://ozlabs.org/~akpm/mmotm/broken-out/nios2-convert-to-dma_map_ops.patch
> 
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
> 
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
> 
> The -mm tree is included into linux-next and is updated
> there every 3-4 working days
> 
> ------------------------------------------------------
> From: Christoph Hellwig <hch@lst.de>
> Subject: nios2: convert to dma_map_ops
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Cc: Ley Foon Tan <lftan@altera.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  arch/nios2/Kconfig                   |    1 
>  arch/nios2/include/asm/dma-mapping.h |  123 +-------------------
>  arch/nios2/mm/dma-mapping.c          |  147 +++++++++++++------------
>  3 files changed, 85 insertions(+), 186 deletions(-)
> 
> diff -puN arch/nios2/Kconfig~nios2-convert-to-dma_map_ops arch/nios2/Kconfig
> --- a/arch/nios2/Kconfig~nios2-convert-to-dma_map_ops
> +++ a/arch/nios2/Kconfig
> @@ -16,6 +16,7 @@ config NIOS2
>  	select SOC_BUS
>  	select SPARSE_IRQ
>  	select USB_ARCH_HAS_HCD if USB_SUPPORT
> +	select HAVE_DMA_ATTRS
>  
>  config GENERIC_CSUM
>  	def_bool y
> diff -puN arch/nios2/include/asm/dma-mapping.h~nios2-convert-to-dma_map_ops arch/nios2/include/asm/dma-mapping.h
> --- a/arch/nios2/include/asm/dma-mapping.h~nios2-convert-to-dma_map_ops
> +++ a/arch/nios2/include/asm/dma-mapping.h
> @@ -10,131 +10,20 @@
>  #ifndef _ASM_NIOS2_DMA_MAPPING_H
>  #define _ASM_NIOS2_DMA_MAPPING_H
>  
> -#include <linux/scatterlist.h>
> -#include <linux/cache.h>
> -#include <asm/cacheflush.h>
> +extern struct dma_map_ops nios2_dma_ops;
>  
> -static inline void __dma_sync_for_device(void *vaddr, size_t size,
> -			      enum dma_data_direction direction)
> +static inline struct dma_map_ops *get_dma_ops(struct device *dev)
>  {
> -	switch (direction) {
> -	case DMA_FROM_DEVICE:
> -		invalidate_dcache_range((unsigned long)vaddr,
> -			(unsigned long)(vaddr + size));
> -		break;
> -	case DMA_TO_DEVICE:
> -		/*
> -		 * We just need to flush the caches here , but Nios2 flush
> -		 * instruction will do both writeback and invalidate.
> -		 */
> -	case DMA_BIDIRECTIONAL: /* flush and invalidate */
> -		flush_dcache_range((unsigned long)vaddr,
> -			(unsigned long)(vaddr + size));
> -		break;
> -	default:
> -		BUG();
> -	}
> -}
> -
> -static inline void __dma_sync_for_cpu(void *vaddr, size_t size,
> -			      enum dma_data_direction direction)
> -{
> -	switch (direction) {
> -	case DMA_BIDIRECTIONAL:
> -	case DMA_FROM_DEVICE:
> -		invalidate_dcache_range((unsigned long)vaddr,
> -			(unsigned long)(vaddr + size));
> -		break;
> -	case DMA_TO_DEVICE:
> -		break;
> -	default:
> -		BUG();
> -	}
> -}
> -
> -#define dma_alloc_noncoherent(d, s, h, f) dma_alloc_coherent(d, s, h, f)
> -#define dma_free_noncoherent(d, s, v, h) dma_free_coherent(d, s, v, h)
> -
> -void *dma_alloc_coherent(struct device *dev, size_t size,
> -			   dma_addr_t *dma_handle, gfp_t flag);
> -
> -void dma_free_coherent(struct device *dev, size_t size,
> -			 void *vaddr, dma_addr_t dma_handle);
> -
> -static inline dma_addr_t dma_map_single(struct device *dev, void *ptr,
> -					size_t size,
> -					enum dma_data_direction direction)
> -{
> -	BUG_ON(!valid_dma_direction(direction));
> -	__dma_sync_for_device(ptr, size, direction);
> -	return virt_to_phys(ptr);
> -}
> -
> -static inline void dma_unmap_single(struct device *dev, dma_addr_t dma_addr,
> -				size_t size, enum dma_data_direction direction)
> -{
> -}
> -
> -extern int dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
> -	enum dma_data_direction direction);
> -extern dma_addr_t dma_map_page(struct device *dev, struct page *page,
> -	unsigned long offset, size_t size, enum dma_data_direction direction);
> -extern void dma_unmap_page(struct device *dev, dma_addr_t dma_address,
> -	size_t size, enum dma_data_direction direction);
> -extern void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> -	int nhwentries, enum dma_data_direction direction);
> -extern void dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
> -	size_t size, enum dma_data_direction direction);
> -extern void dma_sync_single_for_device(struct device *dev,
> -	dma_addr_t dma_handle, size_t size, enum dma_data_direction direction);
> -extern void dma_sync_single_range_for_cpu(struct device *dev,
> -	dma_addr_t dma_handle, unsigned long offset, size_t size,
> -	enum dma_data_direction direction);
> -extern void dma_sync_single_range_for_device(struct device *dev,
> -	dma_addr_t dma_handle, unsigned long offset, size_t size,
> -	enum dma_data_direction direction);
> -extern void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
> -	int nelems, enum dma_data_direction direction);
> -extern void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
> -	int nelems, enum dma_data_direction direction);
> -
> -static inline int dma_supported(struct device *dev, u64 mask)
> -{
> -	return 1;
> -}
> -
> -static inline int dma_set_mask(struct device *dev, u64 mask)
> -{
> -	if (!dev->dma_mask || !dma_supported(dev, mask))
> -		return -EIO;
> -
> -	*dev->dma_mask = mask;
> -
> -	return 0;
> -}
> -
> -static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
> -{
> -	return 0;
> +	return &nios2_dma_ops;
>  }
>  
>  /*
> -* dma_alloc_noncoherent() returns non-cacheable memory, so there's no need to
> -* do any flushing here.
> -*/
> + * dma_alloc_noncoherent() returns non-cacheable memory, so there's no need to
> + * do any flushing here.
> + */
>  static inline void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
>  				  enum dma_data_direction direction)
>  {
>  }
>  
> -/* drivers/base/dma-mapping.c */
> -extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
> -		void *cpu_addr, dma_addr_t dma_addr, size_t size);
> -extern int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
> -		void *cpu_addr, dma_addr_t dma_addr,
> -		size_t size);
> -
> -#define dma_mmap_coherent(d, v, c, h, s) dma_common_mmap(d, v, c, h, s)
> -#define dma_get_sgtable(d, t, v, h, s) dma_common_get_sgtable(d, t, v, h, s)
> -
>  #endif /* _ASM_NIOS2_DMA_MAPPING_H */
> diff -puN arch/nios2/mm/dma-mapping.c~nios2-convert-to-dma_map_ops arch/nios2/mm/dma-mapping.c
> --- a/arch/nios2/mm/dma-mapping.c~nios2-convert-to-dma_map_ops
> +++ a/arch/nios2/mm/dma-mapping.c
> @@ -20,9 +20,46 @@
>  #include <linux/cache.h>
>  #include <asm/cacheflush.h>
>  
> +static inline void __dma_sync_for_device(void *vaddr, size_t size,
> +			      enum dma_data_direction direction)
> +{
> +	switch (direction) {
> +	case DMA_FROM_DEVICE:
> +		invalidate_dcache_range((unsigned long)vaddr,
> +			(unsigned long)(vaddr + size));
> +		break;
> +	case DMA_TO_DEVICE:
> +		/*
> +		 * We just need to flush the caches here , but Nios2 flush
> +		 * instruction will do both writeback and invalidate.
> +		 */
> +	case DMA_BIDIRECTIONAL: /* flush and invalidate */
> +		flush_dcache_range((unsigned long)vaddr,
> +			(unsigned long)(vaddr + size));
> +		break;
> +	default:
> +		BUG();
> +	}
> +}
>  
> -void *dma_alloc_coherent(struct device *dev, size_t size,
> -			    dma_addr_t *dma_handle, gfp_t gfp)
> +static inline void __dma_sync_for_cpu(void *vaddr, size_t size,
> +			      enum dma_data_direction direction)
> +{
> +	switch (direction) {
> +	case DMA_BIDIRECTIONAL:
> +	case DMA_FROM_DEVICE:
> +		invalidate_dcache_range((unsigned long)vaddr,
> +			(unsigned long)(vaddr + size));
> +		break;
> +	case DMA_TO_DEVICE:
> +		break;
> +	default:
> +		BUG();
> +	}
> +}
> +
> +static void *nios2_dma_alloc(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
>  {
>  	void *ret;
>  
> @@ -45,24 +82,21 @@ void *dma_alloc_coherent(struct device *
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(dma_alloc_coherent);
>  
> -void dma_free_coherent(struct device *dev, size_t size, void *vaddr,
> -			dma_addr_t dma_handle)
> +static void nios2_dma_free(struct device *dev, size_t size, void *vaddr,
> +		dma_addr_t dma_handle, struct dma_attrs *attrs)
>  {
>  	unsigned long addr = (unsigned long) CAC_ADDR((unsigned long) vaddr);
>  
>  	free_pages(addr, get_order(size));
>  }
> -EXPORT_SYMBOL(dma_free_coherent);
>  
> -int dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
> -		enum dma_data_direction direction)
> +static int nios2_dma_map_sg(struct device *dev, struct scatterlist *sg,
> +		int nents, enum dma_data_direction direction,
> +		struct dma_attrs *attrs)
>  {
>  	int i;
>  
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	for_each_sg(sg, sg, nents, i) {
>  		void *addr;
>  
> @@ -75,40 +109,32 @@ int dma_map_sg(struct device *dev, struc
>  
>  	return nents;
>  }
> -EXPORT_SYMBOL(dma_map_sg);
>  
> -dma_addr_t dma_map_page(struct device *dev, struct page *page,
> +static dma_addr_t nios2_dma_map_page(struct device *dev, struct page *page,
>  			unsigned long offset, size_t size,
> -			enum dma_data_direction direction)
> +			enum dma_data_direction direction,
> +			struct dma_attrs *attrs)
>  {
> -	void *addr;
> -
> -	BUG_ON(!valid_dma_direction(direction));
> +	void *addr = page_address(page) + offset;
>  
> -	addr = page_address(page) + offset;
>  	__dma_sync_for_device(addr, size, direction);
> -
>  	return page_to_phys(page) + offset;
>  }
> -EXPORT_SYMBOL(dma_map_page);
>  
> -void dma_unmap_page(struct device *dev, dma_addr_t dma_address, size_t size,
> -		    enum dma_data_direction direction)
> +static void nios2_dma_unmap_page(struct device *dev, dma_addr_t dma_address,
> +		size_t size, enum dma_data_direction direction,
> +		struct dma_attrs *attrs)
>  {
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	__dma_sync_for_cpu(phys_to_virt(dma_address), size, direction);
>  }
> -EXPORT_SYMBOL(dma_unmap_page);
>  
> -void dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nhwentries,
> -		  enum dma_data_direction direction)
> +static void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> +		int nhwentries, enum dma_data_direction direction,
> +		struct dma_attrs *attrs)
>  {
>  	void *addr;
>  	int i;
>  
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	if (direction == DMA_TO_DEVICE)
>  		return;
>  
> @@ -118,69 +144,52 @@ void dma_unmap_sg(struct device *dev, st
>  			__dma_sync_for_cpu(addr, sg->length, direction);
>  	}
>  }
> -EXPORT_SYMBOL(dma_unmap_sg);
> -
> -void dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
> -			     size_t size, enum dma_data_direction direction)
> -{
> -	BUG_ON(!valid_dma_direction(direction));
>  
> -	__dma_sync_for_cpu(phys_to_virt(dma_handle), size, direction);
> -}
> -EXPORT_SYMBOL(dma_sync_single_for_cpu);
> -
> -void dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle,
> -				size_t size, enum dma_data_direction direction)
> -{
> -	BUG_ON(!valid_dma_direction(direction));
> -
> -	__dma_sync_for_device(phys_to_virt(dma_handle), size, direction);
> -}
> -EXPORT_SYMBOL(dma_sync_single_for_device);
> -
> -void dma_sync_single_range_for_cpu(struct device *dev, dma_addr_t dma_handle,
> -					unsigned long offset, size_t size,
> -					enum dma_data_direction direction)
> +static void nios2_dma_sync_single_for_cpu(struct device *dev,
> +		dma_addr_t dma_handle, size_t size,
> +		enum dma_data_direction direction)
>  {
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	__dma_sync_for_cpu(phys_to_virt(dma_handle), size, direction);
>  }
> -EXPORT_SYMBOL(dma_sync_single_range_for_cpu);
>  
> -void dma_sync_single_range_for_device(struct device *dev, dma_addr_t dma_handle,
> -					unsigned long offset, size_t size,
> -					enum dma_data_direction direction)
> +static void nios2_dma_sync_single_for_device(struct device *dev,
> +		dma_addr_t dma_handle, size_t size,
> +		enum dma_data_direction direction)
>  {
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	__dma_sync_for_device(phys_to_virt(dma_handle), size, direction);
>  }
> -EXPORT_SYMBOL(dma_sync_single_range_for_device);
>  
> -void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg, int nelems,
> -			 enum dma_data_direction direction)
> +static void nios2_dma_sync_sg_for_cpu(struct device *dev,
> +		struct scatterlist *sg, int nelems,
> +		enum dma_data_direction direction)
>  {
>  	int i;
>  
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	/* Make sure that gcc doesn't leave the empty loop body.  */
>  	for_each_sg(sg, sg, nelems, i)
>  		__dma_sync_for_cpu(sg_virt(sg), sg->length, direction);
>  }
> -EXPORT_SYMBOL(dma_sync_sg_for_cpu);
>  
> -void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
> -				int nelems, enum dma_data_direction direction)
> +static void nios2_dma_sync_sg_for_device(struct device *dev,
> +		struct scatterlist *sg, int nelems,
> +		enum dma_data_direction direction)
>  {
>  	int i;
>  
> -	BUG_ON(!valid_dma_direction(direction));
> -
>  	/* Make sure that gcc doesn't leave the empty loop body.  */
>  	for_each_sg(sg, sg, nelems, i)
>  		__dma_sync_for_device(sg_virt(sg), sg->length, direction);
>  
>  }
> -EXPORT_SYMBOL(dma_sync_sg_for_device);
> +
> +struct dma_map_ops nios2_dma_ops = {
> +	.alloc                  = nios2_dma_alloc,
> +	.free                   = nios2_dma_free,
> +	.map_page               = nios2_dma_map_page,
> +	.map_sg                 = nios2_dma_map_sg,
> +	.sync_single_for_device = nios2_dma_sync_single_for_device,
> +	.sync_single_for_cpu    = nios2_dma_sync_single_for_cpu,
> +	.sync_sg_for_cpu        = nios2_dma_sync_sg_for_cpu,
> +	.sync_sg_for_dev        = nios2_dma_sync_sg_for_device,
> +};
> +EXPORT_SYMBOL(nios2_dma_ops);
> _
> 
> Patches currently in -mm which might be from hch@lst.de are
> 
> dma-mapping-make-the-generic-coherent-dma-mmap-implementation-optional.patch
> arc-convert-to-dma_map_ops.patch
> avr32-convert-to-dma_map_ops.patch
> blackfin-convert-to-dma_map_ops.patch
> c6x-convert-to-dma_map_ops.patch
> cris-convert-to-dma_map_ops.patch
> nios2-convert-to-dma_map_ops.patch
> frv-convert-to-dma_map_ops.patch
> parisc-convert-to-dma_map_ops.patch
> mn10300-convert-to-dma_map_ops.patch
> m68k-convert-to-dma_map_ops.patch
> metag-convert-to-dma_map_ops.patch
> sparc-use-generic-dma_set_mask.patch
> tile-uninline-dma_set_mask.patch
> dma-mapping-always-provide-the-dma_map_ops-based-implementation.patch
> dma-mapping-remove-asm-generic-dma-coherenth.patch
Hi Christoph,

This patch in linux-next breaks Nios2 build.
Below is the fix.

Thanks.

Regards
Ley Foon

----------------------------

>From f85888156f397ade2015d3dc30302eacbd04e2ac Mon Sep 17 00:00:00 2001
From: Ley Foon Tan <lftan@altera.com>
Date: Thu, 26 Nov 2015 11:14:05 +0800
Subject: [PATCH] nios2: fix wreckage of conversion to dma_map_ops

Signed-off-by: Ley Foon Tan <lftan@altera.com>
---
 arch/nios2/mm/dma-mapping.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c
index 43c1149..1f81656 100644
--- a/arch/nios2/mm/dma-mapping.c
+++ b/arch/nios2/mm/dma-mapping.c
@@ -128,9 +128,10 @@ static void nios2_dma_unmap_page(struct device
*dev, dma_addr_t dma_address,
        __dma_sync_for_cpu(phys_to_virt(dma_address), size, direction);
 }

-static void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-               int nhwentries, enum dma_data_direction direction,
-               struct dma_attrs *attrs)
+static void nios2_dma_unmap_sg(struct device *dev, struct scatterlist
*sg,
+                              int nhwentries,
+                              enum dma_data_direction direction,
+                              struct dma_attrs *attrs)
 {
        void *addr;
        int i;
@@ -186,10 +187,12 @@ struct dma_map_ops nios2_dma_ops = {
        .alloc                  = nios2_dma_alloc,
        .free                   = nios2_dma_free,
        .map_page               = nios2_dma_map_page,
+       .unmap_page             = nios2_dma_unmap_page,
        .map_sg                 = nios2_dma_map_sg,
+       .unmap_sg               = nios2_dma_unmap_sg,
        .sync_single_for_device = nios2_dma_sync_single_for_device,
        .sync_single_for_cpu    = nios2_dma_sync_single_for_cpu,
        .sync_sg_for_cpu        = nios2_dma_sync_sg_for_cpu,
-       .sync_sg_for_dev        = nios2_dma_sync_sg_for_device,
+       .sync_sg_for_device     = nios2_dma_sync_sg_for_device,
 };
 EXPORT_SYMBOL(nios2_dma_ops);
-- 
1.8.2.1
