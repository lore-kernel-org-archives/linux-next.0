From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 9 Jan 2017 13:51:01 +1100
Message-ID: <20170109135101.3dfce262@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  include/linux/radix-tree.h

between commit:

  ea07b862ac8e ("mm: workingset: fix use-after-free in shadow node shrinker")

from Linus' tree and patch:

   "Reimplement IDR and IDA using the radix tree"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/radix-tree.h
index 52bda854593b,50aaac14a4f1..000000000000
--- a/include/linux/radix-tree.h
+++ b/include/linux/radix-tree.h
@@@ -306,9 -309,9 +309,11 @@@ void radix_tree_iter_replace(struct rad
  void radix_tree_replace_slot(struct radix_tree_root *root,
  			     void **slot, void *item);
  void __radix_tree_delete_node(struct radix_tree_root *root,
 -			      struct radix_tree_node *node);
 +			      struct radix_tree_node *node,
 +			      radix_tree_update_node_t update_node,
 +			      void *private);
+ void radix_tree_iter_delete(struct radix_tree_root *,
+ 				const struct radix_tree_iter *iter);
  void *radix_tree_delete_item(struct radix_tree_root *, unsigned long, void *);
  void *radix_tree_delete(struct radix_tree_root *, unsigned long);
  void radix_tree_clear_tags(struct radix_tree_root *root,
