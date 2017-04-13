From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/4] mm/hmm: fix warnings and SECTION_SIZE definition overlap
Date: Wed, 12 Apr 2017 20:30:12 -0400
Message-ID: <20170413003014.4052-3-paul.gortmaker@windriver.com>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

SECTION_SIZE is defined twice in the same file; also it is already
used by arch specific headers, which leads to:

mm/hmm.c:34:0: warning: "SECTION_SIZE" redefined [enabled by default]
 #define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
 ^
arch/arm64/include/asm/pgtable-hwdef.h:87:0: note: this is the location of the previous definition
 #define SECTION_SIZE  (_AC(1, UL) << SECTION_SHIFT)

Replace instances of SECTION_SIZE with PA_SECTION_SIZE to avoid all
conflict and delete the 2nd instance of the definition in the file.

Also we see this warning:

mm/hmm.c: In function ‘hmm_devmem_release’:
mm/hmm.c:816:2: error: implicit declaration of function ‘arch_remove_memory’ [-Werror=implicit-function-declaration]
  arch_remove_memory(align_start, align_size, devmem->pagemap.type);

... which has two factors: (1) there is an implicit expectation of the
memory hotplug header being present, and (2) the arch_remove_memory()
support depends on CONFIG_MEMORY_HOTREMOVE.  So we fix that as well.

Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Evgeny Baskakov <ebaskakov@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Mark Hairgrove <mhairgrove@nvidia.com>
Cc: Sherry Cheung <SCheung@nvidia.com>
Cc: Subhash Gutti <sgutti@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 mm/hmm.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 8200cf275fb9..080d71e403e7 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -30,8 +30,9 @@
 #include <linux/hugetlb.h>
 #include <linux/memremap.h>
 #include <linux/mmu_notifier.h>
+#include <linux/memory_hotplug.h>
 
-#define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
+#define PA_SECTION_SIZE (1UL << PA_SECTION_SHIFT)
 
 static const struct mmu_notifier_ops hmm_mmu_notifier_ops;
 
@@ -781,18 +782,17 @@ static void hmm_devmem_free(struct page *page, void *data)
 
 static DEFINE_MUTEX(hmm_devmem_lock);
 static RADIX_TREE(hmm_devmem_radix, GFP_KERNEL);
-#define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
 
 static void hmm_devmem_radix_release(struct resource *resource)
 {
 	resource_size_t key, align_start, align_size, align_end;
 
-	align_start = resource->start & ~(SECTION_SIZE - 1);
-	align_size = ALIGN(resource_size(resource), SECTION_SIZE);
+	align_start = resource->start & ~(PA_SECTION_SIZE - 1);
+	align_size = ALIGN(resource_size(resource), PA_SECTION_SIZE);
 	align_end = align_start + align_size - 1;
 
 	mutex_lock(&hmm_devmem_lock);
-	for (key = resource->start; key <= resource->end; key += SECTION_SIZE)
+	for (key = resource->start; key <= resource->end; key += PA_SECTION_SIZE)
 		radix_tree_delete(&hmm_devmem_radix, key >> PA_SECTION_SHIFT);
 	mutex_unlock(&hmm_devmem_lock);
 }
@@ -809,12 +809,14 @@ static void hmm_devmem_release(struct device *dev, void *data)
 	}
 
 	/* pages are dead and unused, undo the arch mapping */
-	align_start = resource->start & ~(SECTION_SIZE - 1);
-	align_size = ALIGN(resource_size(resource), SECTION_SIZE);
+	align_start = resource->start & ~(PA_SECTION_SIZE - 1);
+	align_size = ALIGN(resource_size(resource), PA_SECTION_SIZE);
 
+#ifdef CONFIG_MEMORY_HOTREMOVE
 	mem_hotplug_begin();
 	arch_remove_memory(align_start, align_size, devmem->pagemap.type);
 	mem_hotplug_done();
+#endif
 
 	untrack_pfn(NULL, PHYS_PFN(align_start), align_size);
 	hmm_devmem_radix_release(resource);
@@ -835,10 +837,10 @@ static int hmm_devmem_pages_create(struct hmm_devmem *devmem)
 	int ret, nid, is_ram;
 	unsigned long pfn;
 
-	align_start = devmem->resource->start & ~(SECTION_SIZE - 1);
+	align_start = devmem->resource->start & ~(PA_SECTION_SIZE - 1);
 	align_size = ALIGN(devmem->resource->start +
 			   resource_size(devmem->resource),
-			   SECTION_SIZE) - align_start;
+			   PA_SECTION_SIZE) - align_start;
 
 	is_ram = region_intersects(align_start, align_size,
 				   IORESOURCE_SYSTEM_RAM,
@@ -861,7 +863,7 @@ static int hmm_devmem_pages_create(struct hmm_devmem *devmem)
 
 	mutex_lock(&hmm_devmem_lock);
 	align_end = align_start + align_size - 1;
-	for (key = align_start; key <= align_end; key += SECTION_SIZE) {
+	for (key = align_start; key <= align_end; key += PA_SECTION_SIZE) {
 		struct hmm_devmem *dup;
 
 		rcu_read_lock();
@@ -979,7 +981,7 @@ struct hmm_devmem *hmm_devmem_add(const struct hmm_devmem_ops *ops,
 	if (ret)
 		goto error_devm_add_action;
 
-	size = ALIGN(size, SECTION_SIZE);
+	size = ALIGN(size, PA_SECTION_SIZE);
 	addr = (iomem_resource.end + 1ULL) - size;
 
 	/*
-- 
2.11.0
