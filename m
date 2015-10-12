From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the dwmw2-iommu tree
Date: Mon, 12 Oct 2015 18:32:57 +1100
Message-ID: <20151012183257.258edc4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50512 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751073AbbJLHdA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Oct 2015 03:33:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

After merging the dwmw2-iommu tree, today's linux-next build (i386
defconfig) failed like this:

In file included from drivers/gpu/drm/i915/i915_drv.h:50:0,
                 from drivers/gpu/drm/i915/i915_drv.c:34:
include/linux/intel-iommu.h:477:22: error: field 'notifier' has incomplete type
  struct mmu_notifier notifier;
                      ^

Caused by commit

  a7002bccff99 ("iommu/vt-d: Add intel_svm_{un,}bind_mm() functions")

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 Oct 2015 17:51:50 +1100
Subject: [PATCH] iommu/vt-d: fix for "Add intel_svm_{un,}bind_mm() functions"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/intel-iommu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index aa7e02d623c9..39a382cbbbd4 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -474,7 +474,9 @@ extern int intel_svm_finish_prq(struct intel_iommu *iommu);
 
 struct intel_svm {
 	struct kref kref;
+#ifdef CONFIG_MMU_NOTIFIER
 	struct mmu_notifier notifier;
+#endif
 	struct mm_struct *mm;
 	struct intel_iommu *iommu;
 	struct device *dev;
-- 
2.5.3




-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
