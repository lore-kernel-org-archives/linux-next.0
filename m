From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build failure
Date: Wed, 15 Oct 2008 16:47:10 +1100
Message-ID: <20081015164710.de95b5e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33367 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138AbYJOGTn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 02:19:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org

Hi Avi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from arch/x86/kvm/../../../virt/kvm/vtd.c:28:
include/linux/intel-iommu.h:31:27: error: dma_remapping.h: No such file or directory
drivers/pci/intr_remapping.c:7:25: error: intel-iommu.h: No such file or directory

I applied the following patch (which will need some consideration).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 45b0d91c36c7318bb71510ff8662a7e1b9c1d410 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 16:43:17 +1100
Subject: [PATCH] kvm: fixes for movement of intel-iommu.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/dma_remapping.h   |  157 -----------------------------------------
 drivers/pci/intr_remapping.c  |    2 +-
 drivers/pci/intr_remapping.h  |    2 +-
 include/linux/dma_remapping.h |  157 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 159 insertions(+), 159 deletions(-)
 delete mode 100644 drivers/pci/dma_remapping.h
 create mode 100644 include/linux/dma_remapping.h

diff --git a/drivers/pci/dma_remapping.h b/drivers/pci/dma_remapping.h
deleted file mode 100644
index bff5c65..0000000
--- a/drivers/pci/dma_remapping.h
+++ /dev/null
@@ -1,157 +0,0 @@
-#ifndef _DMA_REMAPPING_H
-#define _DMA_REMAPPING_H
-
-/*
- * We need a fixed PAGE_SIZE of 4K irrespective of
- * arch PAGE_SIZE for IOMMU page tables.
- */
-#define PAGE_SHIFT_4K		(12)
-#define PAGE_SIZE_4K		(1UL << PAGE_SHIFT_4K)
-#define PAGE_MASK_4K		(((u64)-1) << PAGE_SHIFT_4K)
-#define PAGE_ALIGN_4K(addr)	(((addr) + PAGE_SIZE_4K - 1) & PAGE_MASK_4K)
-
-#define IOVA_PFN(addr)		((addr) >> PAGE_SHIFT_4K)
-#define DMA_32BIT_PFN		IOVA_PFN(DMA_32BIT_MASK)
-#define DMA_64BIT_PFN		IOVA_PFN(DMA_64BIT_MASK)
-
-
-/*
- * 0: Present
- * 1-11: Reserved
- * 12-63: Context Ptr (12 - (haw-1))
- * 64-127: Reserved
- */
-struct root_entry {
-	u64	val;
-	u64	rsvd1;
-};
-#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
-static inline bool root_present(struct root_entry *root)
-{
-	return (root->val & 1);
-}
-static inline void set_root_present(struct root_entry *root)
-{
-	root->val |= 1;
-}
-static inline void set_root_value(struct root_entry *root, unsigned long value)
-{
-	root->val |= value & PAGE_MASK_4K;
-}
-
-struct context_entry;
-static inline struct context_entry *
-get_context_addr_from_root(struct root_entry *root)
-{
-	return (struct context_entry *)
-		(root_present(root)?phys_to_virt(
-		root->val & PAGE_MASK_4K):
-		NULL);
-}
-
-/*
- * low 64 bits:
- * 0: present
- * 1: fault processing disable
- * 2-3: translation type
- * 12-63: address space root
- * high 64 bits:
- * 0-2: address width
- * 3-6: aval
- * 8-23: domain id
- */
-struct context_entry {
-	u64 lo;
-	u64 hi;
-};
-#define context_present(c) ((c).lo & 1)
-#define context_fault_disable(c) (((c).lo >> 1) & 1)
-#define context_translation_type(c) (((c).lo >> 2) & 3)
-#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
-#define context_address_width(c) ((c).hi &  7)
-#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
-
-#define context_set_present(c) do {(c).lo |= 1;} while (0)
-#define context_set_fault_enable(c) \
-	do {(c).lo &= (((u64)-1) << 2) | 1;} while (0)
-#define context_set_translation_type(c, val) \
-	do { \
-		(c).lo &= (((u64)-1) << 4) | 3; \
-		(c).lo |= ((val) & 3) << 2; \
-	} while (0)
-#define CONTEXT_TT_MULTI_LEVEL 0
-#define context_set_address_root(c, val) \
-	do {(c).lo |= (val) & PAGE_MASK_4K;} while (0)
-#define context_set_address_width(c, val) do {(c).hi |= (val) & 7;} while (0)
-#define context_set_domain_id(c, val) \
-	do {(c).hi |= ((val) & ((1 << 16) - 1)) << 8;} while (0)
-#define context_clear_entry(c) do {(c).lo = 0; (c).hi = 0;} while (0)
-
-/*
- * 0: readable
- * 1: writable
- * 2-6: reserved
- * 7: super page
- * 8-11: available
- * 12-63: Host physcial address
- */
-struct dma_pte {
-	u64 val;
-};
-#define dma_clear_pte(p)	do {(p).val = 0;} while (0)
-
-#define DMA_PTE_READ (1)
-#define DMA_PTE_WRITE (2)
-
-#define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while (0)
-#define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while (0)
-#define dma_set_pte_prot(p, prot) \
-		do {(p).val = ((p).val & ~3) | ((prot) & 3); } while (0)
-#define dma_pte_addr(p) ((p).val & PAGE_MASK_4K)
-#define dma_set_pte_addr(p, addr) do {\
-		(p).val |= ((addr) & PAGE_MASK_4K); } while (0)
-#define dma_pte_present(p) (((p).val & 3) != 0)
-
-struct intel_iommu;
-
-struct dmar_domain {
-	int	id;			/* domain id */
-	struct intel_iommu *iommu;	/* back pointer to owning iommu */
-
-	struct list_head devices; 	/* all devices' list */
-	struct iova_domain iovad;	/* iova's that belong to this domain */
-
-	struct dma_pte	*pgd;		/* virtual address */
-	spinlock_t	mapping_lock;	/* page table lock */
-	int		gaw;		/* max guest address width */
-
-	/* adjusted guest address width, 0 is level 2 30-bit */
-	int		agaw;
-
-#define DOMAIN_FLAG_MULTIPLE_DEVICES 1
-	int		flags;
-};
-
-/* PCI domain-device relationship */
-struct device_domain_info {
-	struct list_head link;	/* link to domain siblings */
-	struct list_head global; /* link to global list */
-	u8 bus;			/* PCI bus numer */
-	u8 devfn;		/* PCI devfn number */
-	struct pci_dev *dev; /* it's NULL for PCIE-to-PCI bridge */
-	struct dmar_domain *domain; /* pointer to domain */
-};
-
-extern int init_dmars(void);
-extern void free_dmar_iommu(struct intel_iommu *iommu);
-
-extern int dmar_disabled;
-
-#ifndef CONFIG_DMAR_GFX_WA
-static inline void iommu_prepare_gfx_mapping(void)
-{
-	return;
-}
-#endif /* !CONFIG_DMAR_GFX_WA */
-
-#endif
diff --git a/drivers/pci/intr_remapping.c b/drivers/pci/intr_remapping.c
index bb642cc..738d4c8 100644
--- a/drivers/pci/intr_remapping.c
+++ b/drivers/pci/intr_remapping.c
@@ -4,7 +4,7 @@
 #include <linux/pci.h>
 #include <linux/irq.h>
 #include <asm/io_apic.h>
-#include "intel-iommu.h"
+#include <linux/intel-iommu.h>
 #include "intr_remapping.h"
 
 static struct ioapic_scope ir_ioapic[MAX_IO_APICS];
diff --git a/drivers/pci/intr_remapping.h b/drivers/pci/intr_remapping.h
index 05f2635..ca48f0d 100644
--- a/drivers/pci/intr_remapping.h
+++ b/drivers/pci/intr_remapping.h
@@ -1,4 +1,4 @@
-#include "intel-iommu.h"
+#include <linux/intel-iommu.h>
 
 struct ioapic_scope {
 	struct intel_iommu *iommu;
diff --git a/include/linux/dma_remapping.h b/include/linux/dma_remapping.h
new file mode 100644
index 0000000..bff5c65
--- /dev/null
+++ b/include/linux/dma_remapping.h
@@ -0,0 +1,157 @@
+#ifndef _DMA_REMAPPING_H
+#define _DMA_REMAPPING_H
+
+/*
+ * We need a fixed PAGE_SIZE of 4K irrespective of
+ * arch PAGE_SIZE for IOMMU page tables.
+ */
+#define PAGE_SHIFT_4K		(12)
+#define PAGE_SIZE_4K		(1UL << PAGE_SHIFT_4K)
+#define PAGE_MASK_4K		(((u64)-1) << PAGE_SHIFT_4K)
+#define PAGE_ALIGN_4K(addr)	(((addr) + PAGE_SIZE_4K - 1) & PAGE_MASK_4K)
+
+#define IOVA_PFN(addr)		((addr) >> PAGE_SHIFT_4K)
+#define DMA_32BIT_PFN		IOVA_PFN(DMA_32BIT_MASK)
+#define DMA_64BIT_PFN		IOVA_PFN(DMA_64BIT_MASK)
+
+
+/*
+ * 0: Present
+ * 1-11: Reserved
+ * 12-63: Context Ptr (12 - (haw-1))
+ * 64-127: Reserved
+ */
+struct root_entry {
+	u64	val;
+	u64	rsvd1;
+};
+#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
+static inline bool root_present(struct root_entry *root)
+{
+	return (root->val & 1);
+}
+static inline void set_root_present(struct root_entry *root)
+{
+	root->val |= 1;
+}
+static inline void set_root_value(struct root_entry *root, unsigned long value)
+{
+	root->val |= value & PAGE_MASK_4K;
+}
+
+struct context_entry;
+static inline struct context_entry *
+get_context_addr_from_root(struct root_entry *root)
+{
+	return (struct context_entry *)
+		(root_present(root)?phys_to_virt(
+		root->val & PAGE_MASK_4K):
+		NULL);
+}
+
+/*
+ * low 64 bits:
+ * 0: present
+ * 1: fault processing disable
+ * 2-3: translation type
+ * 12-63: address space root
+ * high 64 bits:
+ * 0-2: address width
+ * 3-6: aval
+ * 8-23: domain id
+ */
+struct context_entry {
+	u64 lo;
+	u64 hi;
+};
+#define context_present(c) ((c).lo & 1)
+#define context_fault_disable(c) (((c).lo >> 1) & 1)
+#define context_translation_type(c) (((c).lo >> 2) & 3)
+#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
+#define context_address_width(c) ((c).hi &  7)
+#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
+
+#define context_set_present(c) do {(c).lo |= 1;} while (0)
+#define context_set_fault_enable(c) \
+	do {(c).lo &= (((u64)-1) << 2) | 1;} while (0)
+#define context_set_translation_type(c, val) \
+	do { \
+		(c).lo &= (((u64)-1) << 4) | 3; \
+		(c).lo |= ((val) & 3) << 2; \
+	} while (0)
+#define CONTEXT_TT_MULTI_LEVEL 0
+#define context_set_address_root(c, val) \
+	do {(c).lo |= (val) & PAGE_MASK_4K;} while (0)
+#define context_set_address_width(c, val) do {(c).hi |= (val) & 7;} while (0)
+#define context_set_domain_id(c, val) \
+	do {(c).hi |= ((val) & ((1 << 16) - 1)) << 8;} while (0)
+#define context_clear_entry(c) do {(c).lo = 0; (c).hi = 0;} while (0)
+
+/*
+ * 0: readable
+ * 1: writable
+ * 2-6: reserved
+ * 7: super page
+ * 8-11: available
+ * 12-63: Host physcial address
+ */
+struct dma_pte {
+	u64 val;
+};
+#define dma_clear_pte(p)	do {(p).val = 0;} while (0)
+
+#define DMA_PTE_READ (1)
+#define DMA_PTE_WRITE (2)
+
+#define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while (0)
+#define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while (0)
+#define dma_set_pte_prot(p, prot) \
+		do {(p).val = ((p).val & ~3) | ((prot) & 3); } while (0)
+#define dma_pte_addr(p) ((p).val & PAGE_MASK_4K)
+#define dma_set_pte_addr(p, addr) do {\
+		(p).val |= ((addr) & PAGE_MASK_4K); } while (0)
+#define dma_pte_present(p) (((p).val & 3) != 0)
+
+struct intel_iommu;
+
+struct dmar_domain {
+	int	id;			/* domain id */
+	struct intel_iommu *iommu;	/* back pointer to owning iommu */
+
+	struct list_head devices; 	/* all devices' list */
+	struct iova_domain iovad;	/* iova's that belong to this domain */
+
+	struct dma_pte	*pgd;		/* virtual address */
+	spinlock_t	mapping_lock;	/* page table lock */
+	int		gaw;		/* max guest address width */
+
+	/* adjusted guest address width, 0 is level 2 30-bit */
+	int		agaw;
+
+#define DOMAIN_FLAG_MULTIPLE_DEVICES 1
+	int		flags;
+};
+
+/* PCI domain-device relationship */
+struct device_domain_info {
+	struct list_head link;	/* link to domain siblings */
+	struct list_head global; /* link to global list */
+	u8 bus;			/* PCI bus numer */
+	u8 devfn;		/* PCI devfn number */
+	struct pci_dev *dev; /* it's NULL for PCIE-to-PCI bridge */
+	struct dmar_domain *domain; /* pointer to domain */
+};
+
+extern int init_dmars(void);
+extern void free_dmar_iommu(struct intel_iommu *iommu);
+
+extern int dmar_disabled;
+
+#ifndef CONFIG_DMAR_GFX_WA
+static inline void iommu_prepare_gfx_mapping(void)
+{
+	return;
+}
+#endif /* !CONFIG_DMAR_GFX_WA */
+
+#endif
-- 
1.5.6.5
