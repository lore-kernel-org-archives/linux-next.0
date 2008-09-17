From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Wed, 17 Sep 2008 15:50:01 +1000
Message-ID: <20080917155001.75f6009a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43700 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750695AbYIQFuL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 01:50:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@elte.hu>, "Kay, Allen M" <allen.m.kay@intel.com>

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
include/linux/intel-iommu.h and drivers/pci/intel-iommu.h between several
commits ("x64, x2apic/intr-remap: ...") from the x86 tree and commit
14f776b8e0aa6724069a35bf4e172d93be74ba90 ("VT-d: Changes to support KVM")
from the kvm tree.

Just overlapping additions (the latter also moved the file). I fixed it
up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/intel-iommu.h
index 2142c01,1490fc0..0000000
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@@ -282,26 -332,24 +282,38 @@@ struct intel_iommu 
  	unsigned char name[7];    /* Device Name */
  	struct msi_msg saved_msg;
  	struct sys_device sysdev;
 +#endif
 +	struct q_inval  *qi;            /* Queued invalidation info */
 +#ifdef CONFIG_INTR_REMAP
 +	struct ir_table *ir_table;	/* Interrupt remapping info */
 +#endif
  };
  
 -#ifndef CONFIG_DMAR_GFX_WA
 -static inline void iommu_prepare_gfx_mapping(void)
 +static inline void __iommu_flush_cache(
 +	struct intel_iommu *iommu, void *addr, int size)
  {
 -	return;
 +	if (!ecap_coherent(iommu->ecap))
 +		clflush_cache_range(addr, size);
  }
 -#endif /* !CONFIG_DMAR_GFX_WA */
 +
 +extern struct dmar_drhd_unit * dmar_find_matched_drhd_unit(struct pci_dev *dev);
 +
 +extern int alloc_iommu(struct dmar_drhd_unit *drhd);
 +extern void free_iommu(struct intel_iommu *iommu);
 +extern int dmar_enable_qi(struct intel_iommu *iommu);
 +extern void qi_global_iec(struct intel_iommu *iommu);
 +
 +extern void qi_submit_sync(struct qi_desc *desc, struct intel_iommu *iommu);
+ 
+ void intel_iommu_domain_exit(struct dmar_domain *domain);
+ struct dmar_domain *intel_iommu_domain_alloc(struct pci_dev *pdev);
+ int intel_iommu_context_mapping(struct dmar_domain *domain,
+ 				struct pci_dev *pdev);
+ int intel_iommu_page_mapping(struct dmar_domain *domain, dma_addr_t iova,
+ 			     u64 hpa, size_t size, int prot);
+ void intel_iommu_detach_dev(struct dmar_domain *domain, u8 bus, u8 devfn);
+ struct dmar_domain *intel_iommu_find_domain(struct pci_dev *pdev);
+ int intel_iommu_found(void);
+ u64 intel_iommu_iova_to_pfn(struct dmar_domain *domain, u64 iova);
+ 
  #endif
