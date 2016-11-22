From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 22 Nov 2016 21:05:11 +1100
Message-ID: <20161122210511.024ec341@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932234AbcKVKFO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 05:05:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Alex Williamson <alex.williamson@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>, Neo Jia <cjia@nvidia.com>, Lorenzo Stoakes <lstoakes@gmail.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/vfio/vfio_iommu_type1.c: In function 'vaddr_get_pfn':
drivers/vfio/vfio_iommu_type1.c:364:9: error: too few arguments to function 'get_user_pages_remote'
   ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
         ^
In file included from include/linux/scatterlist.h:7:0,
                 from include/linux/iommu.h:26,
                 from drivers/vfio/vfio_iommu_type1.c:30:
include/linux/mm.h:1274:6: note: declared here
 long get_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
      ^

Caused by commit

  d6c547ad0c61 ("mm: add locked parameter to get_user_pages_remote()")

interacting with commit

  ea85cf353e4f ("vfio iommu type1: Update argument of vaddr_get_pfn()")

from the vfio tree.

I applied this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Nov 2016 20:54:27 +1100
Subject: [PATCH] vfio iommu type1: merge fix for get_user_pages_remote API
 change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/vfio/vfio_iommu_type1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 51810a95416e..cae2e9121e48 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -362,7 +362,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 
 		down_read(&mm->mmap_sem);
 		ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
-					    NULL);
+					    NULL, NULL);
 		up_read(&mm->mmap_sem);
 	}
 
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
