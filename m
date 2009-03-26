From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dwmw2-iommu tree with the iommu
 tree
Date: Thu, 26 Mar 2009 17:35:02 +1100
Message-ID: <20090326173502.6bddc56d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56740 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751770AbZCZGfI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 02:35:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hi David, Ingo,

Today's linux-next merge of the dwmw2-iommu tree got a conflict in
drivers/pci/intel-iommu.c between commits
160c1d8e40866edfeae7d68816b7005d70acf391 ("x86, ia64: convert to use
generic dma_map_ops struct") and d7ab5c46ae2743079a40bb4060e510418c0842b4
("intel-iommu: make dma mapping functions static") from the iommu tree
and commit 4cf2e75d0bec15d945972b005056c4a8731b82cf ("intel-iommu: Enable
DMAR on 32-bit kernel") from the dwmw2-iommu tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pci/intel-iommu.c
index 9dbd506,002c8b9..0000000
--- a/drivers/pci/intel-iommu.c
+++ b/drivers/pci/intel-iommu.c
@@@ -2282,11 -2471,8 +2320,9 @@@ static void intel_free_coherent(struct 
  	free_pages((unsigned long)vaddr, order);
  }
  
- #define SG_ENT_VIRT_ADDRESS(sg)	(sg_virt((sg)))
- 
 -void intel_unmap_sg(struct device *hwdev, struct scatterlist *sglist,
 -		    int nelems, int dir)
 +static void intel_unmap_sg(struct device *hwdev, struct scatterlist *sglist,
 +			   int nelems, enum dma_data_direction dir,
 +			   struct dma_attrs *attrs)
  {
  	int i;
  	struct pci_dev *pdev = to_pci_dev(hwdev);
@@@ -2343,10 -2529,10 +2379,10 @@@ static int intel_nontranslate_map_sg(st
  	return nelems;
  }
  
 -int intel_map_sg(struct device *hwdev, struct scatterlist *sglist, int nelems,
 -		 int dir)
 +static int intel_map_sg(struct device *hwdev, struct scatterlist *sglist, int nelems,
 +			enum dma_data_direction dir, struct dma_attrs *attrs)
  {
- 	void *addr;
+ 	phys_addr_t addr;
  	int i;
  	struct pci_dev *pdev = to_pci_dev(hwdev);
  	struct dmar_domain *domain;
