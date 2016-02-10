From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 10 Feb 2016 16:55:14 +1100
Message-ID: <20160210165514.412992a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44427 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753230AbcBJFzQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Feb 2016 00:55:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/include/asm/bug.h:35:0,
                 from include/linux/bug.h:4,
                 from include/linux/thread_info.h:11,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/radix-tree.h:25,
                 from kernel/memremap.c:13:
kernel/memremap.c: In function 'devm_memremap_pages_release':
kernel/memremap.c:230:54: error: expected ')' before '__func__'
   dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
                                                      ^
include/asm-generic/bug.h:74:69: note: in definition of macro '__WARN_printf'
 #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__, arg)
                                                                     ^
include/linux/device.h:1312:2: note: in expansion of macro 'WARN'
  WARN(condition, "%s %s: " format,   \
  ^
kernel/memremap.c:230:3: note: in expansion of macro 'dev_WARN'
   dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
   ^
include/linux/device.h:1312:18: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
  WARN(condition, "%s %s: " format,   \
                  ^
include/asm-generic/bug.h:74:69: note: in definition of macro '__WARN_printf'
 #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__, arg)
                                                                     ^
include/linux/device.h:1312:2: note: in expansion of macro 'WARN'
  WARN(condition, "%s %s: " format,   \
  ^
kernel/memremap.c:230:3: note: in expansion of macro 'dev_WARN'
   dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
   ^

Probably exposed by commit

  27ffb3827ac7 ("mm: CONFIG_NR_ZONES_EXTENDED")

originally caused by commit

  5c2c2587b132 ("mm, dax, pmem: introduce {get|put}_dev_pagemap() for dax-gup")

which was added in v4.5-rc1.

I added the below patch for today but then discovered the waiting patch
in the akpm tree ("kernel/memremap.c: add new arg to dev_WARN") which
should be sent to Linus ASAP (and should have appeared much earlier in
the series).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Feb 2016 16:42:47 +1100
Subject: [PATCH] kernel/memremap: fix up dev_WARN invocation

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/memremap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/memremap.c b/kernel/memremap.c
index 76fa01cee76b..ba845c368876 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -226,10 +226,9 @@ static void devm_memremap_pages_release(struct device *dev, void *data)
 	resource_size_t align_start, align_size;
 	struct dev_pagemap *pgmap = &page_map->pgmap;
 
-	if (percpu_ref_tryget_live(pgmap->ref)) {
-		dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
+	if (dev_WARN(dev, percpu_ref_tryget_live(pgmap->ref),
+		     "%s: page mapping is still live!\n", __func__))
 		percpu_ref_put(pgmap->ref);
-	}
 
 	/* pages are dead and unused, undo the arch mapping */
 	align_start = res->start & ~(SECTION_SIZE - 1);
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
