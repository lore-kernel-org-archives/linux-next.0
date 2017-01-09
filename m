From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 9 Jan 2017 15:09:20 +1100
Message-ID: <20170109150920.444b4560@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43669 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1031666AbdAIEJX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Jan 2017 23:09:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@linux.intel.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

lib/radix-tree.c: In function 'radix_tree_iter_delete':
lib/radix-tree.c:1952:3: error: too few arguments to function '__radix_tree_delete_node'
   __radix_tree_delete_node(root, node);
   ^
lib/radix-tree.c:1936:6: note: declared here
 void __radix_tree_delete_node(struct radix_tree_root *root,
      ^

Caused by patch

  "Reimplement IDR and IDA using the radix tree"

interacting with commit

  ea07b862ac8e ("mm: workingset: fix use-after-free in shadow node shrinker")

from Linus' tree.

I applied the following fixup patch (which may not be entirely complete,
of course).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Jan 2017 15:05:08 +1100
Subject: [PATCH] mm: merge fixup for "fix use-after-free in shadow node shrinker"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/radix-tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/radix-tree.c b/lib/radix-tree.c
index e563b5f50ace..4a8d206d508a 100644
--- a/lib/radix-tree.c
+++ b/lib/radix-tree.c
@@ -1949,7 +1949,7 @@ void radix_tree_iter_delete(struct radix_tree_root *root,
 	if (node) {
 		node->slots[iter_offset(iter)] = NULL;
 		node->count--;
-		__radix_tree_delete_node(root, node);
+		__radix_tree_delete_node(root, node, NULL, NULL);
 	} else {
 		root->rnode = NULL;
 	}
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
