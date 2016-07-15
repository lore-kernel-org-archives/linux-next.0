From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the arm tree
Date: Fri, 15 Jul 2016 18:29:47 +1000
Message-ID: <20160715182947.2ce9825a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm/mm/dma-mapping.c

between commits:

  f12708965069 ("ARM: 8561/3: dma-mapping: Don't use outer_flush_range when the L2C is coherent")
  565068221b90 ("ARM: 8561/4: dma-mapping: Fix the coherent case when iommu is used")

from the arm tree and patch:

   "ARM: dma-mapping: use unsigned long for dma_attrs"

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mm/dma-mapping.c
index b7eed75960fe,ebb3fde99043..000000000000
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@@ -1273,8 -1252,7 +1272,8 @@@ static inline void __free_iova(struct d
  static const int iommu_order_array[] = { 9, 8, 4, 0 };
  
  static struct page **__iommu_alloc_buffer(struct device *dev, size_t size,
- 					  gfp_t gfp, struct dma_attrs *attrs,
 -					  gfp_t gfp, unsigned long attrs)
++					  gfp_t gfp, unsigned long attrs,
 +					  int coherent_flag)
  {
  	struct page **pages;
  	int count = size >> PAGE_SHIFT;
@@@ -1501,18 -1476,14 +1500,18 @@@ err_mapping
  }
  
  static void __iommu_free_atomic(struct device *dev, void *cpu_addr,
 -				dma_addr_t handle, size_t size)
 +			dma_addr_t handle, size_t size, int coherent_flag)
  {
  	__iommu_remove_mapping(dev, handle, size);
 -	__free_from_pool(cpu_addr, size);
 +	if (coherent_flag == COHERENT)
 +		__dma_free_buffer(virt_to_page(cpu_addr), size);
 +	else
 +		__free_from_pool(cpu_addr, size);
  }
  
 -static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
 -	    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 +static void *__arm_iommu_alloc_attrs(struct device *dev, size_t size,
- 	    dma_addr_t *handle, gfp_t gfp, struct dma_attrs *attrs,
++	    dma_addr_t *handle, gfp_t gfp, unsigned long attrs,
 +	    int coherent_flag)
  {
  	pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL);
  	struct page **pages;
@@@ -1559,21 -1529,9 +1558,21 @@@ err_buffer
  	return NULL;
  }
  
 -static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 +static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
- 		    dma_addr_t *handle, gfp_t gfp, struct dma_attrs *attrs)
++		    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 +{
 +	return __arm_iommu_alloc_attrs(dev, size, handle, gfp, attrs, NORMAL);
 +}
 +
 +static void *arm_coherent_iommu_alloc_attrs(struct device *dev, size_t size,
- 		    dma_addr_t *handle, gfp_t gfp, struct dma_attrs *attrs)
++		    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 +{
 +	return __arm_iommu_alloc_attrs(dev, size, handle, gfp, attrs, COHERENT);
 +}
 +
 +static int __arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
  		    void *cpu_addr, dma_addr_t dma_addr, size_t size,
- 		    struct dma_attrs *attrs)
+ 		    unsigned long attrs)
  {
  	unsigned long uaddr = vma->vm_start;
  	unsigned long usize = vma->vm_end - vma->vm_start;
@@@ -1601,28 -1561,13 +1600,28 @@@
  
  	return 0;
  }
 +static int arm_iommu_mmap_attrs(struct device *dev,
 +		struct vm_area_struct *vma, void *cpu_addr,
- 		dma_addr_t dma_addr, size_t size, struct dma_attrs *attrs)
++		dma_addr_t dma_addr, size_t size, unsigned long attrs)
 +{
 +	vma->vm_page_prot = __get_dma_pgprot(attrs, vma->vm_page_prot);
 +
 +	return __arm_iommu_mmap_attrs(dev, vma, cpu_addr, dma_addr, size, attrs);
 +}
 +
 +static int arm_coherent_iommu_mmap_attrs(struct device *dev,
 +		struct vm_area_struct *vma, void *cpu_addr,
- 		dma_addr_t dma_addr, size_t size, struct dma_attrs *attrs)
++		dma_addr_t dma_addr, size_t size, unsigned long attrs)
 +{
 +	return __arm_iommu_mmap_attrs(dev, vma, cpu_addr, dma_addr, size, attrs);
 +}
  
  /*
   * free a page as defined by the above mapping.
   * Must not be called with IRQs disabled.
   */
 -void arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 -			  dma_addr_t handle, unsigned long attrs)
 +void __arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
- 	dma_addr_t handle, struct dma_attrs *attrs, int coherent_flag)
++	dma_addr_t handle, unsigned long attrs, int coherent_flag)
  {
  	struct page **pages;
  	size = PAGE_ALIGN(size);
@@@ -1647,21 -1592,9 +1646,21 @@@
  	__iommu_free_buffer(dev, pages, size, attrs);
  }
  
 +void arm_iommu_free_attrs(struct device *dev, size_t size,
- 		    void *cpu_addr, dma_addr_t handle, struct dma_attrs *attrs)
++		    void *cpu_addr, dma_addr_t handle, unsigned long attrs)
 +{
 +	__arm_iommu_free_attrs(dev, size, cpu_addr, handle, attrs, NORMAL);
 +}
 +
 +void arm_coherent_iommu_free_attrs(struct device *dev, size_t size,
- 		    void *cpu_addr, dma_addr_t handle, struct dma_attrs *attrs)
++		    void *cpu_addr, dma_addr_t handle, unsigned long attrs)
 +{
 +	__arm_iommu_free_attrs(dev, size, cpu_addr, handle, attrs, COHERENT);
 +}
 +
  static int arm_iommu_get_sgtable(struct device *dev, struct sg_table *sgt,
  				 void *cpu_addr, dma_addr_t dma_addr,
- 				 size_t size, struct dma_attrs *attrs)
+ 				 size_t size, unsigned long attrs)
  {
  	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
  	struct page **pages = __iommu_get_pages(cpu_addr, attrs);
