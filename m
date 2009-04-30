From: Fenghua Yu <fenghua.yu@intel.com>
Subject: [PATCH] Fix for "undefined iommu_pass_through" compiling error
Date: Thu, 30 Apr 2009 15:54:30 -0700
Message-ID: <20090430225430.GA5691@linux-os.sc.intel.com>
References: <20090430131232.fb51742a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:43944 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756365AbZD3Wyb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 18:54:31 -0400
Content-Disposition: inline
In-Reply-To: <20090430131232.fb51742a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, iommu <iommu@lists.linux-foundation.org>

When CONFIG_DMAR is off, linux-next or iomm-2.6.git kernel build complains
"undefined iommu_pass_through" error.

This patch moves iommu_pass_through beyond CONFIG_DMAR and fixes this issue.

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Acked-by: Tony Luck <tony.luck@intel.com>

---

 arch/ia64/kernel/dma-mapping.c |    2 ++
 arch/x86/kernel/pci-dma.c      |    2 ++
 drivers/pci/intel-iommu.c      |    1 -
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/dma-mapping.c b/arch/ia64/kernel/dma-mapping.c
index 086a2ae..336ccdc 100644
--- a/arch/ia64/kernel/dma-mapping.c
+++ b/arch/ia64/kernel/dma-mapping.c
@@ -3,6 +3,8 @@
 /* Set this to 1 if there is a HW IOMMU in the system */
 int iommu_detected __read_mostly;
 
+int iommu_pass_through;
+
 struct dma_map_ops *dma_ops;
 EXPORT_SYMBOL(dma_ops);
 
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 8cad0d8..14fddef 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -32,6 +32,8 @@ int no_iommu __read_mostly;
 /* Set this to 1 if there is a HW IOMMU in the system */
 int iommu_detected __read_mostly = 0;
 
+int iommu_pass_through;
+
 dma_addr_t bad_dma_address __read_mostly = 0;
 EXPORT_SYMBOL(bad_dma_address);
 
diff --git a/drivers/pci/intel-iommu.c b/drivers/pci/intel-iommu.c
index 1312182..d3edd6a 100644
--- a/drivers/pci/intel-iommu.c
+++ b/drivers/pci/intel-iommu.c
@@ -288,7 +288,6 @@ int dmar_disabled = 1;
 static int __initdata dmar_map_gfx = 1;
 static int dmar_forcedac;
 static int intel_iommu_strict;
-int iommu_pass_through;
 
 #define DUMMY_DEVICE_DOMAIN_INFO ((struct device_domain_info *)(-1))
 static DEFINE_SPINLOCK(device_domain_lock);
