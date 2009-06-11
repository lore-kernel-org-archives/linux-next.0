From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] SLUB: fix build when !SLUB_DEBUG
Date: Thu, 11 Jun 2009 14:08:48 +0400
Message-ID: <1244714928-1050-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:58110 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757681AbZFKLUn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 07:20:43 -0400
Received: by bwz9 with SMTP id 9so1369360bwz.37
        for <linux-next@vger.kernel.org>; Thu, 11 Jun 2009 04:20:44 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: penberg@cs.helsinki.fi, mel@csn.ul.ie, Larry.Finger@lwfinger.net, linux-next@vger.kernel.org
Cc: Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error when CONFIG_SLUB_DEBUG is not set:
mm/slub.c: In function 'slab_out_of_memory':
mm/slub.c:1551: error: 'struct kmem_cache_node' has no member named 'nr_slabs'
mm/slub.c:1552: error: 'struct kmem_cache_node' has no member named 'total_objects'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 mm/slub.c |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 409e900..83c5c16 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1541,20 +1541,27 @@ slab_out_of_memory(struct kmem_cache *s, gfp_t gfpflags, int nid)
 
 	for_each_online_node(node) {
 		struct kmem_cache_node *n = get_node(s, node);
+		unsigned long nr_free;
+#ifdef CONFIG_SLUB_DEBUG
 		unsigned long nr_slabs;
 		unsigned long nr_objs;
-		unsigned long nr_free;
+#endif
 
 		if (!n)
 			continue;
 
+		nr_free = count_partial(n, count_free);
+#ifdef CONFIG_SLUB_DEBUG
 		nr_slabs = atomic_long_read(&n->nr_slabs);
 		nr_objs = atomic_long_read(&n->total_objects);
-		nr_free = count_partial(n, count_free);
 
 		printk(KERN_WARNING
 			"  node %d: slabs: %ld, objs: %ld, free: %ld\n",
 			node, nr_slabs, nr_objs, nr_free);
+#else
+		printk(KERN_WARNING "  node %d: free: %ld\n",
+			node, nr_free);
+#endif
 	}
 }
 
-- 
1.6.3.1
