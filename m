From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Subject: [PATCH -mmotm] mm: fix kmemcheck.c build errors
Date: Fri,  5 Sep 2014 16:28:06 +0900
Message-ID: <1409902086-32311-1-git-send-email-iamjoonsoo.kim@lge.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lgeamrelo01.lge.com ([156.147.1.125]:58095 "EHLO
	lgeamrelo01.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbaIEH1Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Sep 2014 03:27:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, Pekka Enberg <penberg@kernel.org>, Vegard Nossum <vegardno@ifi.uio.no>, Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Randy Dunlap <rdunlap@infradead.org>

mm-slab_common-move-kmem_cache-definition-to-internal-header.patch
in mmotm makes following build failure.

../mm/kmemcheck.c:70:7: error: dereferencing pointer to incomplete type
../mm/kmemcheck.c:83:15: error: dereferencing pointer to incomplete type
../mm/kmemcheck.c:95:8: error: dereferencing pointer to incomplete type
../mm/kmemcheck.c:95:21: error: dereferencing pointer to incomplete type

../mm/slab.h: In function 'cache_from_obj':
../mm/slab.h:283:2: error: implicit declaration of function
'memcg_kmem_enabled' [-Werror=implicit-function-declaration]

Add header files to fix kmemcheck.c build errors.

[iamjoonsoo.kim@lge.com] move up memcontrol.h header
to fix build failure if CONFIG_MEMCG_KMEM=y too.
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Joonsoo Kim <iamjoonsoo.kim@lge.com>
---
 mm/kmemcheck.c |    1 +
 mm/slab.h      |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/mm/kmemcheck.c b/mm/kmemcheck.c
index fd814fd..cab58bb 100644
--- a/mm/kmemcheck.c
+++ b/mm/kmemcheck.c
@@ -2,6 +2,7 @@
 #include <linux/mm_types.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include "slab.h"
 #include <linux/kmemcheck.h>
 
 void kmemcheck_alloc_shadow(struct page *page, int order, gfp_t flags, int node)
diff --git a/mm/slab.h b/mm/slab.h
index 13845d0..963a3f8 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -37,6 +37,8 @@ struct kmem_cache {
 #include <linux/slub_def.h>
 #endif
 
+#include <linux/memcontrol.h>
+
 /*
  * State of the slab allocator.
  *
-- 
1.7.9.5
