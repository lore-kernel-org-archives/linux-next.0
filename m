Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252618787A;
	Mon, 23 Feb 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771852542; cv=none; b=mV8H4JBzmDW0yXRP2A5liQS/wJFuatRWFgfjQnm5Uh9bh1adcLjECoMc6kUz+ixxPdoxv6R0beSTqbOFgvKqSyu3BDHlN6hNZFBGtsUROdxZA3YHGyeA7j1tZcbtWQyzvDQY3NXX3VXEhz8ZKTekuA70YxqoPy3JKPfcEYzMi6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771852542; c=relaxed/simple;
	bh=7qbDC0Kc7/F2oKms8dmSw0lFNsPLif88sQn8WXRjClQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s68WCt0AVbrIQEk7KszpJsv6yKn2GcNgxde0WkTBorZ44c7MHzYuGA+pHUBJRbIYKcPsxDXQXqnLPE9riNTkZ43PyNpZfvkyhUhhpJ0IbMQSCPHG6lK7MNH0evOCLFo0n82oUr+xz4JMO2wAq42pwU/+s0nD2ld82OWRhZvysLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuBgJlQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuBgJlQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BABC116C6;
	Mon, 23 Feb 2026 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771852541;
	bh=7qbDC0Kc7/F2oKms8dmSw0lFNsPLif88sQn8WXRjClQ=;
	h=Date:From:To:Cc:Subject:From;
	b=TuBgJlQBWoX2B8DjLmuhQRdsiq6GLm/M5zNEiOQTA7/X1EsQkYsVQDUcLTbJcg5cw
	 tOZlhSqpfQnrP1GH93ZFouDC+N0d7ns0l/gg9/OHJ9XDC5GDXsZZ3wbdKHFOsJ2PC4
	 d9/rNGvWqaaQema05NgZMLLruYnpzMUhxtghHYMtOqw5Pm9PpSeVqGBIeNh52jWFVO
	 xDfChe31wmvbfI9DZAqWTWMADmdxWYIneTFX+AJ1UWwvbceworHPAPDQfqkoXI4xO5
	 R/wzUaN5PdrpnmHbx2/WOLLMKIu63YiOI0WxiK07v+qMntRjl6XleZMfjEw8uJT+mC
	 wlGUtco6LX1BQ==
Date: Mon, 23 Feb 2026 13:15:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Miu <jasonmiu@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 origin tree
Message-ID: <aZxS-VCXOieQ0mG0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3P6RfSBncHYw2Od"
Content-Disposition: inline


--n3P6RfSBncHYw2Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  kernel/liveupdate/kexec_handover.c

between commit:

  bf4afc53b77ae ("Convert 'alloc_obj' family to use the new default GFP_KER=
NEL argument")

=66rom the origin tree and commit:

  0dfbae48e1f5d ("kho: adopt radix tree for preserved memory tracking")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(the actual conflict should be trivial, this is a diff -c to get a
non-empty diff)

diff --combined kernel/liveupdate/kexec_handover.c
index cc68a3692905d,59b47fa077198..0000000000000
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@@ -5,6 -5,7 +5,7 @@@
   * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.o=
rg>
   * Copyright (C) 2025 Google LLC, Changyuan Lyu <changyuanl@google.com>
   * Copyright (C) 2025 Pasha Tatashin <pasha.tatashin@soleen.com>
+  * Copyright (C) 2026 Google LLC, Jason Miu <jasonmiu@google.com>
   */
 =20
  #define pr_fmt(fmt) "KHO: " fmt
@@@ -15,6 -16,7 +16,7 @@@
  #include <linux/count_zeros.h>
  #include <linux/kexec.h>
  #include <linux/kexec_handover.h>
+ #include <linux/kho_radix_tree.h>
  #include <linux/kho/abi/kexec_handover.h>
  #include <linux/libfdt.h>
  #include <linux/list.h>
@@@ -64,163 -66,316 +66,316 @@@ static int __init kho_parse_enable(cha
  }
  early_param("kho", kho_parse_enable);
 =20
- /*
-  * Keep track of memory that is to be preserved across KHO.
-  *
-  * The serializing side uses two levels of xarrays to manage chunks of pe=
r-order
-  * PAGE_SIZE byte bitmaps. For instance if PAGE_SIZE =3D 4096, the entire=
 1G order
-  * of a 8TB system would fit inside a single 4096 byte bitmap. For order 0
-  * allocations each bitmap will cover 128M of address space. Thus, for 16=
G of
-  * memory at most 512K of bitmap memory will be needed for order 0.
-  *
-  * This approach is fully incremental, as the serialization progresses fo=
lios
-  * can continue be aggregated to the tracker. The final step, immediately=
 prior
-  * to kexec would serialize the xarray information into a linked list for=
 the
-  * successor kernel to parse.
-  */
-=20
- #define PRESERVE_BITS (PAGE_SIZE * 8)
-=20
- struct kho_mem_phys_bits {
- 	DECLARE_BITMAP(preserve, PRESERVE_BITS);
- };
-=20
- static_assert(sizeof(struct kho_mem_phys_bits) =3D=3D PAGE_SIZE);
-=20
- struct kho_mem_phys {
- 	/*
- 	 * Points to kho_mem_phys_bits, a sparse bitmap array. Each bit is sized
- 	 * to order.
- 	 */
- 	struct xarray phys_bits;
- };
-=20
- struct kho_mem_track {
- 	/* Points to kho_mem_phys, each order gets its own bitmap tree */
- 	struct xarray orders;
- };
-=20
- struct khoser_mem_chunk;
-=20
  struct kho_out {
  	void *fdt;
- 	bool finalized;
- 	struct mutex lock; /* protects KHO FDT finalization */
+ 	struct mutex lock; /* protects KHO FDT */
 =20
- 	struct kho_mem_track track;
+ 	struct kho_radix_tree radix_tree;
  	struct kho_debugfs dbg;
  };
 =20
  static struct kho_out kho_out =3D {
  	.lock =3D __MUTEX_INITIALIZER(kho_out.lock),
- 	.track =3D {
- 		.orders =3D XARRAY_INIT(kho_out.track.orders, 0),
+ 	.radix_tree =3D {
+ 		.lock =3D __MUTEX_INITIALIZER(kho_out.radix_tree.lock),
  	},
- 	.finalized =3D false,
  };
 =20
- static void *xa_load_or_alloc(struct xarray *xa, unsigned long index)
+ /**
+  * kho_radix_encode_key - Encodes a physical address and order into a rad=
ix key.
+  * @phys: The physical address of the page.
+  * @order: The order of the page.
+  *
+  * This function combines a page's physical address and its order into a
+  * single unsigned long, which is used as a key for all radix tree
+  * operations.
+  *
+  * Return: The encoded unsigned long radix key.
+  */
+ static unsigned long kho_radix_encode_key(phys_addr_t phys, unsigned int =
order)
  {
- 	void *res =3D xa_load(xa, index);
+ 	/* Order bits part */
+ 	unsigned long h =3D 1UL << (KHO_ORDER_0_LOG2 - order);
+ 	/* Shifted physical address part */
+ 	unsigned long l =3D phys >> (PAGE_SHIFT + order);
 =20
- 	if (res)
- 		return res;
-=20
- 	void *elm __free(free_page) =3D (void *)get_zeroed_page(GFP_KERNEL);
-=20
- 	if (!elm)
- 		return ERR_PTR(-ENOMEM);
-=20
- 	if (WARN_ON(kho_scratch_overlap(virt_to_phys(elm), PAGE_SIZE)))
- 		return ERR_PTR(-EINVAL);
-=20
- 	res =3D xa_cmpxchg(xa, index, NULL, elm, GFP_KERNEL);
- 	if (xa_is_err(res))
- 		return ERR_PTR(xa_err(res));
- 	else if (res)
- 		return res;
-=20
- 	return no_free_ptr(elm);
+ 	return h | l;
  }
 =20
- static void __kho_unpreserve_order(struct kho_mem_track *track, unsigned =
long pfn,
- 				   unsigned int order)
+ /**
+  * kho_radix_decode_key - Decodes a radix key back into a physical addres=
s and order.
+  * @key: The unsigned long key to decode.
+  * @order: An output parameter, a pointer to an unsigned int where the de=
coded
+  *         page order will be stored.
+  *
+  * This function reverses the encoding performed by kho_radix_encode_key(=
),
+  * extracting the original physical address and page order from a given k=
ey.
+  *
+  * Return: The decoded physical address.
+  */
+ static phys_addr_t kho_radix_decode_key(unsigned long key, unsigned int *=
order)
  {
- 	struct kho_mem_phys_bits *bits;
- 	struct kho_mem_phys *physxa;
- 	const unsigned long pfn_high =3D pfn >> order;
+ 	unsigned int order_bit =3D fls64(key);
+ 	phys_addr_t phys;
 =20
- 	physxa =3D xa_load(&track->orders, order);
- 	if (WARN_ON_ONCE(!physxa))
- 		return;
+ 	/* order_bit is numbered starting at 1 from fls64 */
+ 	*order =3D KHO_ORDER_0_LOG2 - order_bit + 1;
+ 	/* The order is discarded by the shift */
+ 	phys =3D key << (PAGE_SHIFT + *order);
 =20
- 	bits =3D xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
- 	if (WARN_ON_ONCE(!bits))
- 		return;
-=20
- 	clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+ 	return phys;
  }
 =20
- static void __kho_unpreserve(struct kho_mem_track *track, unsigned long p=
fn,
- 			     unsigned long end_pfn)
+ static unsigned long kho_radix_get_bitmap_index(unsigned long key)
+ {
+ 	return key % (1 << KHO_BITMAP_SIZE_LOG2);
+ }
+=20
+ static unsigned long kho_radix_get_table_index(unsigned long key,
+ 					       unsigned int level)
+ {
+ 	int s;
+=20
+ 	s =3D ((level - 1) * KHO_TABLE_SIZE_LOG2) + KHO_BITMAP_SIZE_LOG2;
+ 	return (key >> s) % (1 << KHO_TABLE_SIZE_LOG2);
+ }
+=20
+ /**
+  * kho_radix_add_page - Marks a page as preserved in the radix tree.
+  * @tree: The KHO radix tree.
+  * @pfn: The page frame number of the page to preserve.
+  * @order: The order of the page.
+  *
+  * This function traverses the radix tree based on the key derived from @=
pfn
+  * and @order. It sets the corresponding bit in the leaf bitmap to mark t=
he
+  * page for preservation. If intermediate nodes do not exist along the pa=
th,
+  * they are allocated and added to the tree.
+  *
+  * Return: 0 on success, or a negative error code on failure.
+  */
+ int kho_radix_add_page(struct kho_radix_tree *tree,
+ 		       unsigned long pfn, unsigned int order)
+ {
+ 	/* Newly allocated nodes for error cleanup */
+ 	struct kho_radix_node *intermediate_nodes[KHO_TREE_MAX_DEPTH] =3D { 0 };
+ 	unsigned long key =3D kho_radix_encode_key(PFN_PHYS(pfn), order);
+ 	struct kho_radix_node *anchor_node =3D NULL;
+ 	struct kho_radix_node *node =3D tree->root;
+ 	struct kho_radix_node *new_node;
+ 	unsigned int i, idx, anchor_idx;
+ 	struct kho_radix_leaf *leaf;
+ 	int err =3D 0;
+=20
+ 	if (WARN_ON_ONCE(!tree->root))
+ 		return -EINVAL;
+=20
+ 	might_sleep();
+=20
+ 	guard(mutex)(&tree->lock);
+=20
+ 	/* Go from high levels to low levels */
+ 	for (i =3D KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+ 		idx =3D kho_radix_get_table_index(key, i);
+=20
+ 		if (node->table[idx]) {
+ 			node =3D phys_to_virt(node->table[idx]);
+ 			continue;
+ 		}
+=20
+ 		/* Next node is empty, create a new node for it */
+ 		new_node =3D (struct kho_radix_node *)get_zeroed_page(GFP_KERNEL);
+ 		if (!new_node) {
+ 			err =3D -ENOMEM;
+ 			goto err_free_nodes;
+ 		}
+=20
+ 		node->table[idx] =3D virt_to_phys(new_node);
+=20
+ 		/*
+ 		 * Capture the node where the new branch starts for cleanup
+ 		 * if allocation fails.
+ 		 */
+ 		if (!anchor_node) {
+ 			anchor_node =3D node;
+ 			anchor_idx =3D idx;
+ 		}
+ 		intermediate_nodes[i] =3D new_node;
+=20
+ 		node =3D new_node;
+ 	}
+=20
+ 	/* Handle the leaf level bitmap (level 0) */
+ 	idx =3D kho_radix_get_bitmap_index(key);
+ 	leaf =3D (struct kho_radix_leaf *)node;
+ 	__set_bit(idx, leaf->bitmap);
+=20
+ 	return 0;
+=20
+ err_free_nodes:
+ 	for (i =3D KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+ 		if (intermediate_nodes[i])
+ 			free_page((unsigned long)intermediate_nodes[i]);
+ 	}
+ 	if (anchor_node)
+ 		anchor_node->table[anchor_idx] =3D 0;
+=20
+ 	return err;
+ }
+ EXPORT_SYMBOL_GPL(kho_radix_add_page);
+=20
+ /**
+  * kho_radix_del_page - Removes a page's preservation status from the rad=
ix tree.
+  * @tree: The KHO radix tree.
+  * @pfn: The page frame number of the page to unpreserve.
+  * @order: The order of the page.
+  *
+  * This function traverses the radix tree and clears the bit correspondin=
g to
+  * the page, effectively removing its "preserved" status. It does not free
+  * the tree's intermediate nodes, even if they become empty.
+  */
+ void kho_radix_del_page(struct kho_radix_tree *tree, unsigned long pfn,
+ 			unsigned int order)
+ {
+ 	unsigned long key =3D kho_radix_encode_key(PFN_PHYS(pfn), order);
+ 	struct kho_radix_node *node =3D tree->root;
+ 	struct kho_radix_leaf *leaf;
+ 	unsigned int i, idx;
+=20
+ 	if (WARN_ON_ONCE(!tree->root))
+ 		return;
+=20
+ 	might_sleep();
+=20
+ 	guard(mutex)(&tree->lock);
+=20
+ 	/* Go from high levels to low levels */
+ 	for (i =3D KHO_TREE_MAX_DEPTH - 1; i > 0; i--) {
+ 		idx =3D kho_radix_get_table_index(key, i);
+=20
+ 		/*
+ 		 * Attempting to delete a page that has not been preserved,
+ 		 * return with a warning.
+ 		 */
+ 		if (WARN_ON(!node->table[idx]))
+ 			return;
+=20
+ 		node =3D phys_to_virt(node->table[idx]);
+ 	}
+=20
+ 	/* Handle the leaf level bitmap (level 0) */
+ 	leaf =3D (struct kho_radix_leaf *)node;
+ 	idx =3D kho_radix_get_bitmap_index(key);
+ 	__clear_bit(idx, leaf->bitmap);
+ }
+ EXPORT_SYMBOL_GPL(kho_radix_del_page);
+=20
+ static int kho_radix_walk_leaf(struct kho_radix_leaf *leaf,
+ 			       unsigned long key,
+ 			       kho_radix_tree_walk_callback_t cb)
+ {
+ 	unsigned long *bitmap =3D (unsigned long *)leaf;
+ 	unsigned int order;
+ 	phys_addr_t phys;
+ 	unsigned int i;
+ 	int err;
+=20
+ 	for_each_set_bit(i, bitmap, PAGE_SIZE * BITS_PER_BYTE) {
+ 		phys =3D kho_radix_decode_key(key | i, &order);
+ 		err =3D cb(phys, order);
+ 		if (err)
+ 			return err;
+ 	}
+=20
+ 	return 0;
+ }
+=20
+ static int __kho_radix_walk_tree(struct kho_radix_node *root,
+ 				 unsigned int level, unsigned long start,
+ 				 kho_radix_tree_walk_callback_t cb)
+ {
+ 	struct kho_radix_node *node;
+ 	struct kho_radix_leaf *leaf;
+ 	unsigned long key, i;
+ 	unsigned int shift;
+ 	int err;
+=20
+ 	for (i =3D 0; i < PAGE_SIZE / sizeof(phys_addr_t); i++) {
+ 		if (!root->table[i])
+ 			continue;
+=20
+ 		shift =3D ((level - 1) * KHO_TABLE_SIZE_LOG2) +
+ 			KHO_BITMAP_SIZE_LOG2;
+ 		key =3D start | (i << shift);
+=20
+ 		node =3D phys_to_virt(root->table[i]);
+=20
+ 		if (level =3D=3D 1) {
+ 			/*
+ 			 * we are at level 1,
+ 			 * node is pointing to the level 0 bitmap.
+ 			 */
+ 			leaf =3D (struct kho_radix_leaf *)node;
+ 			err =3D kho_radix_walk_leaf(leaf, key, cb);
+ 		} else {
+ 			err  =3D __kho_radix_walk_tree(node, level - 1,
+ 						     key, cb);
+ 		}
+=20
+ 		if (err)
+ 			return err;
+ 	}
+=20
+ 	return 0;
+ }
+=20
+ /**
+  * kho_radix_walk_tree - Traverses the radix tree and calls a callback fo=
r each preserved page.
+  * @tree: A pointer to the KHO radix tree to walk.
+  * @cb: A callback function of type kho_radix_tree_walk_callback_t that w=
ill be
+  *      invoked for each preserved page found in the tree. The callback r=
eceives
+  *      the physical address and order of the preserved page.
+  *
+  * This function walks the radix tree, searching from the specified top l=
evel
+  * down to the lowest level (level 0). For each preserved page found, it =
invokes
+  * the provided callback, passing the page's physical address and order.
+  *
+  * Return: 0 if the walk completed the specified tree, or the non-zero re=
turn
+  *         value from the callback that stopped the walk.
+  */
+ int kho_radix_walk_tree(struct kho_radix_tree *tree,
+ 			kho_radix_tree_walk_callback_t cb)
+ {
+ 	if (WARN_ON_ONCE(!tree->root))
+ 		return -EINVAL;
+=20
+ 	guard(mutex)(&tree->lock);
+=20
+ 	return __kho_radix_walk_tree(tree->root, KHO_TREE_MAX_DEPTH - 1, 0, cb);
+ }
+ EXPORT_SYMBOL_GPL(kho_radix_walk_tree);
+=20
+ static void __kho_unpreserve(struct kho_radix_tree *tree,
+ 			     unsigned long pfn, unsigned long end_pfn)
  {
  	unsigned int order;
 =20
  	while (pfn < end_pfn) {
  		order =3D min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
 =20
- 		__kho_unpreserve_order(track, pfn, order);
+ 		kho_radix_del_page(tree, pfn, order);
 =20
  		pfn +=3D 1 << order;
  	}
  }
 =20
- static int __kho_preserve_order(struct kho_mem_track *track, unsigned lon=
g pfn,
- 				unsigned int order)
- {
- 	struct kho_mem_phys_bits *bits;
- 	struct kho_mem_phys *physxa, *new_physxa;
- 	const unsigned long pfn_high =3D pfn >> order;
-=20
- 	might_sleep();
- 	physxa =3D xa_load(&track->orders, order);
- 	if (!physxa) {
- 		int err;
-=20
- 		new_physxa =3D kzalloc_obj(*physxa);
- 		if (!new_physxa)
- 			return -ENOMEM;
-=20
- 		xa_init(&new_physxa->phys_bits);
- 		physxa =3D xa_cmpxchg(&track->orders, order, NULL, new_physxa,
- 				    GFP_KERNEL);
-=20
- 		err =3D xa_err(physxa);
- 		if (err || physxa) {
- 			xa_destroy(&new_physxa->phys_bits);
- 			kfree(new_physxa);
-=20
- 			if (err)
- 				return err;
- 		} else {
- 			physxa =3D new_physxa;
- 		}
- 	}
-=20
- 	bits =3D xa_load_or_alloc(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
- 	if (IS_ERR(bits))
- 		return PTR_ERR(bits);
-=20
- 	set_bit(pfn_high % PRESERVE_BITS, bits->preserve);
-=20
- 	return 0;
- }
-=20
  /* For physically contiguous 0-order pages. */
  static void kho_init_pages(struct page *page, unsigned long nr_pages)
  {
- 	for (unsigned long i =3D 0; i < nr_pages; i++)
+ 	for (unsigned long i =3D 0; i < nr_pages; i++) {
  		set_page_count(page + i, 1);
+ 		/* Clear each page's codetag to avoid accounting mismatch. */
+ 		clear_page_tag_ref(page + i);
+ 	}
  }
 =20
  static void kho_init_folio(struct page *page, unsigned int order)
@@@ -229,6 -384,8 +384,8 @@@
 =20
  	/* Head page gets refcount of 1. */
  	set_page_count(page, 1);
+ 	/* Clear head page's codetag to avoid accounting mismatch. */
+ 	clear_page_tag_ref(page);
 =20
  	/* For higher order folios, tail pages get a page count of zero. */
  	for (unsigned long i =3D 1; i < nr_pages; i++)
@@@ -265,14 -422,6 +422,6 @@@ static struct page *kho_restore_page(ph
  	else
  		kho_init_pages(page, nr_pages);
 =20
- 	/* Always mark headpage's codetag as empty to avoid accounting mismatch =
*/
- 	clear_page_tag_ref(page);
- 	if (!is_folio) {
- 		/* Also do that for the non-compound tail pages */
- 		for (unsigned int i =3D 1; i < nr_pages; i++)
- 			clear_page_tag_ref(page + i);
- 	}
-=20
  	adjust_managed_page_count(page, nr_pages);
  	return page;
  }
@@@ -321,161 -470,24 +470,24 @@@ struct page *kho_restore_pages(phys_add
  }
  EXPORT_SYMBOL_GPL(kho_restore_pages);
 =20
- /* Serialize and deserialize struct kho_mem_phys across kexec
-  *
-  * Record all the bitmaps in a linked list of pages for the next kernel to
-  * process. Each chunk holds bitmaps of the same order and each block of =
bitmaps
-  * starts at a given physical address. This allows the bitmaps to be spar=
se. The
-  * xarray is used to store them in a tree while building up the data stru=
cture,
-  * but the KHO successor kernel only needs to process them once in order.
-  *
-  * All of this memory is normal kmalloc() memory and is not marked for
-  * preservation. The successor kernel will remain isolated to the scratch=
 space
-  * until it completes processing this list. Once processed all the memory
-  * storing these ranges will be marked as free.
-  */
-=20
- struct khoser_mem_bitmap_ptr {
- 	phys_addr_t phys_start;
- 	DECLARE_KHOSER_PTR(bitmap, struct kho_mem_phys_bits *);
- };
-=20
- struct khoser_mem_chunk_hdr {
- 	DECLARE_KHOSER_PTR(next, struct khoser_mem_chunk *);
- 	unsigned int order;
- 	unsigned int num_elms;
- };
-=20
- #define KHOSER_BITMAP_SIZE                                   \
- 	((PAGE_SIZE - sizeof(struct khoser_mem_chunk_hdr)) / \
- 	 sizeof(struct khoser_mem_bitmap_ptr))
-=20
- struct khoser_mem_chunk {
- 	struct khoser_mem_chunk_hdr hdr;
- 	struct khoser_mem_bitmap_ptr bitmaps[KHOSER_BITMAP_SIZE];
- };
-=20
- static_assert(sizeof(struct khoser_mem_chunk) =3D=3D PAGE_SIZE);
-=20
- static struct khoser_mem_chunk *new_chunk(struct khoser_mem_chunk *cur_ch=
unk,
- 					  unsigned long order)
+ static int __init kho_preserved_memory_reserve(phys_addr_t phys,
+ 					       unsigned int order)
  {
- 	struct khoser_mem_chunk *chunk __free(free_page) =3D NULL;
+ 	union kho_page_info info;
+ 	struct page *page;
+ 	u64 sz;
 =20
- 	chunk =3D (void *)get_zeroed_page(GFP_KERNEL);
- 	if (!chunk)
- 		return ERR_PTR(-ENOMEM);
+ 	sz =3D 1 << (order + PAGE_SHIFT);
+ 	page =3D phys_to_page(phys);
 =20
- 	if (WARN_ON(kho_scratch_overlap(virt_to_phys(chunk), PAGE_SIZE)))
- 		return ERR_PTR(-EINVAL);
-=20
- 	chunk->hdr.order =3D order;
- 	if (cur_chunk)
- 		KHOSER_STORE_PTR(cur_chunk->hdr.next, chunk);
- 	return no_free_ptr(chunk);
- }
-=20
- static void kho_mem_ser_free(struct khoser_mem_chunk *first_chunk)
- {
- 	struct khoser_mem_chunk *chunk =3D first_chunk;
-=20
- 	while (chunk) {
- 		struct khoser_mem_chunk *tmp =3D chunk;
-=20
- 		chunk =3D KHOSER_LOAD_PTR(chunk->hdr.next);
- 		free_page((unsigned long)tmp);
- 	}
- }
-=20
- /*
-  *  Update memory map property, if old one is found discard it via
-  *  kho_mem_ser_free().
-  */
- static void kho_update_memory_map(struct khoser_mem_chunk *first_chunk)
- {
- 	void *ptr;
- 	u64 phys;
-=20
- 	ptr =3D fdt_getprop_w(kho_out.fdt, 0, KHO_FDT_MEMORY_MAP_PROP_NAME, NULL=
);
-=20
- 	/* Check and discard previous memory map */
- 	phys =3D get_unaligned((u64 *)ptr);
- 	if (phys)
- 		kho_mem_ser_free((struct khoser_mem_chunk *)phys_to_virt(phys));
-=20
- 	/* Update with the new value */
- 	phys =3D first_chunk ? (u64)virt_to_phys(first_chunk) : 0;
- 	put_unaligned(phys, (u64 *)ptr);
- }
-=20
- static int kho_mem_serialize(struct kho_out *kho_out)
- {
- 	struct khoser_mem_chunk *first_chunk =3D NULL;
- 	struct khoser_mem_chunk *chunk =3D NULL;
- 	struct kho_mem_phys *physxa;
- 	unsigned long order;
- 	int err =3D -ENOMEM;
-=20
- 	xa_for_each(&kho_out->track.orders, order, physxa) {
- 		struct kho_mem_phys_bits *bits;
- 		unsigned long phys;
-=20
- 		chunk =3D new_chunk(chunk, order);
- 		if (IS_ERR(chunk)) {
- 			err =3D PTR_ERR(chunk);
- 			goto err_free;
- 		}
-=20
- 		if (!first_chunk)
- 			first_chunk =3D chunk;
-=20
- 		xa_for_each(&physxa->phys_bits, phys, bits) {
- 			struct khoser_mem_bitmap_ptr *elm;
-=20
- 			if (chunk->hdr.num_elms =3D=3D ARRAY_SIZE(chunk->bitmaps)) {
- 				chunk =3D new_chunk(chunk, order);
- 				if (IS_ERR(chunk)) {
- 					err =3D PTR_ERR(chunk);
- 					goto err_free;
- 				}
- 			}
-=20
- 			elm =3D &chunk->bitmaps[chunk->hdr.num_elms];
- 			chunk->hdr.num_elms++;
- 			elm->phys_start =3D (phys * PRESERVE_BITS)
- 					  << (order + PAGE_SHIFT);
- 			KHOSER_STORE_PTR(elm->bitmap, bits);
- 		}
- 	}
-=20
- 	kho_update_memory_map(first_chunk);
+ 	/* Reserve the memory preserved in KHO in memblock */
+ 	memblock_reserve(phys, sz);
+ 	memblock_reserved_mark_noinit(phys, sz);
+ 	info.magic =3D KHO_PAGE_MAGIC;
+ 	info.order =3D order;
+ 	page->private =3D info.page_private;
 =20
  	return 0;
-=20
- err_free:
- 	kho_mem_ser_free(first_chunk);
- 	return err;
- }
-=20
- static void __init deserialize_bitmap(unsigned int order,
- 				      struct khoser_mem_bitmap_ptr *elm)
- {
- 	struct kho_mem_phys_bits *bitmap =3D KHOSER_LOAD_PTR(elm->bitmap);
- 	unsigned long bit;
-=20
- 	for_each_set_bit(bit, bitmap->preserve, PRESERVE_BITS) {
- 		int sz =3D 1 << (order + PAGE_SHIFT);
- 		phys_addr_t phys =3D
- 			elm->phys_start + (bit << (order + PAGE_SHIFT));
- 		struct page *page =3D phys_to_page(phys);
- 		union kho_page_info info;
-=20
- 		memblock_reserve(phys, sz);
- 		memblock_reserved_mark_noinit(phys, sz);
- 		info.magic =3D KHO_PAGE_MAGIC;
- 		info.order =3D order;
- 		page->private =3D info.page_private;
- 	}
  }
 =20
  /* Returns physical address of the preserved memory map from FDT */
@@@ -486,25 -498,13 +498,13 @@@ static phys_addr_t __init kho_get_mem_m
 =20
  	mem_ptr =3D fdt_getprop(fdt, 0, KHO_FDT_MEMORY_MAP_PROP_NAME, &len);
  	if (!mem_ptr || len !=3D sizeof(u64)) {
- 		pr_err("failed to get preserved memory bitmaps\n");
+ 		pr_err("failed to get preserved memory map\n");
  		return 0;
  	}
 =20
  	return get_unaligned((const u64 *)mem_ptr);
  }
 =20
- static void __init kho_mem_deserialize(struct khoser_mem_chunk *chunk)
- {
- 	while (chunk) {
- 		unsigned int i;
-=20
- 		for (i =3D 0; i !=3D chunk->hdr.num_elms; i++)
- 			deserialize_bitmap(chunk->hdr.order,
- 					   &chunk->bitmaps[i]);
- 		chunk =3D KHOSER_LOAD_PTR(chunk->hdr.next);
- 	}
- }
-=20
  /*
   * With KHO enabled, memory can become fragmented because KHO regions may
   * be anywhere in physical address space. The scratch regions give us a
@@@ -815,14 -815,14 +815,14 @@@ EXPORT_SYMBOL_GPL(kho_remove_subtree)
   */
  int kho_preserve_folio(struct folio *folio)
  {
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	const unsigned long pfn =3D folio_pfn(folio);
  	const unsigned int order =3D folio_order(folio);
- 	struct kho_mem_track *track =3D &kho_out.track;
 =20
  	if (WARN_ON(kho_scratch_overlap(pfn << PAGE_SHIFT, PAGE_SIZE << order)))
  		return -EINVAL;
 =20
- 	return __kho_preserve_order(track, pfn, order);
+ 	return kho_radix_add_page(tree, pfn, order);
  }
  EXPORT_SYMBOL_GPL(kho_preserve_folio);
 =20
@@@ -836,11 -836,11 +836,11 @@@
   */
  void kho_unpreserve_folio(struct folio *folio)
  {
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	const unsigned long pfn =3D folio_pfn(folio);
  	const unsigned int order =3D folio_order(folio);
- 	struct kho_mem_track *track =3D &kho_out.track;
 =20
- 	__kho_unpreserve_order(track, pfn, order);
+ 	kho_radix_del_page(tree, pfn, order);
  }
  EXPORT_SYMBOL_GPL(kho_unpreserve_folio);
 =20
@@@ -856,7 -856,7 +856,7 @@@
   */
  int kho_preserve_pages(struct page *page, unsigned long nr_pages)
  {
- 	struct kho_mem_track *track =3D &kho_out.track;
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	const unsigned long start_pfn =3D page_to_pfn(page);
  	const unsigned long end_pfn =3D start_pfn + nr_pages;
  	unsigned long pfn =3D start_pfn;
@@@ -872,7 -872,7 +872,7 @@@
  		const unsigned int order =3D
  			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
 =20
- 		err =3D __kho_preserve_order(track, pfn, order);
+ 		err =3D kho_radix_add_page(tree, pfn, order);
  		if (err) {
  			failed_pfn =3D pfn;
  			break;
@@@ -882,7 -882,7 +882,7 @@@
  	}
 =20
  	if (err)
- 		__kho_unpreserve(track, start_pfn, failed_pfn);
+ 		__kho_unpreserve(tree, start_pfn, failed_pfn);
 =20
  	return err;
  }
@@@ -900,11 -900,11 +900,11 @@@ EXPORT_SYMBOL_GPL(kho_preserve_pages)
   */
  void kho_unpreserve_pages(struct page *page, unsigned long nr_pages)
  {
- 	struct kho_mem_track *track =3D &kho_out.track;
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	const unsigned long start_pfn =3D page_to_pfn(page);
  	const unsigned long end_pfn =3D start_pfn + nr_pages;
 =20
- 	__kho_unpreserve(track, start_pfn, end_pfn);
+ 	__kho_unpreserve(tree, start_pfn, end_pfn);
  }
  EXPORT_SYMBOL_GPL(kho_unpreserve_pages);
 =20
@@@ -963,14 -963,14 +963,14 @@@ err_free
  static void kho_vmalloc_unpreserve_chunk(struct kho_vmalloc_chunk *chunk,
  					 unsigned short order)
  {
- 	struct kho_mem_track *track =3D &kho_out.track;
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	unsigned long pfn =3D PHYS_PFN(virt_to_phys(chunk));
 =20
- 	__kho_unpreserve(track, pfn, pfn + 1);
+ 	__kho_unpreserve(tree, pfn, pfn + 1);
 =20
  	for (int i =3D 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
  		pfn =3D PHYS_PFN(chunk->phys[i]);
- 		__kho_unpreserve(track, pfn, pfn + (1 << order));
+ 		__kho_unpreserve(tree, pfn, pfn + (1 << order));
  	}
  }
 =20
@@@ -1090,7 -1090,7 +1090,7 @@@ void *kho_restore_vmalloc(const struct=20
  		return NULL;
 =20
  	total_pages =3D preservation->total_pages;
 -	pages =3D kvmalloc_array(total_pages, sizeof(*pages), GFP_KERNEL);
 +	pages =3D kvmalloc_objs(*pages, total_pages);
  	if (!pages)
  		return NULL;
  	order =3D preservation->order;
@@@ -1239,33 -1239,9 +1239,9 @@@ void kho_restore_free(void *mem
  }
  EXPORT_SYMBOL_GPL(kho_restore_free);
 =20
- int kho_finalize(void)
- {
- 	int ret;
-=20
- 	if (!kho_enable)
- 		return -EOPNOTSUPP;
-=20
- 	guard(mutex)(&kho_out.lock);
- 	ret =3D kho_mem_serialize(&kho_out);
- 	if (ret)
- 		return ret;
-=20
- 	kho_out.finalized =3D true;
-=20
- 	return 0;
- }
-=20
- bool kho_finalized(void)
- {
- 	guard(mutex)(&kho_out.lock);
- 	return kho_out.finalized;
- }
-=20
  struct kho_in {
  	phys_addr_t fdt_phys;
  	phys_addr_t scratch_phys;
- 	phys_addr_t mem_map_phys;
  	struct kho_debugfs dbg;
  };
 =20
@@@ -1333,18 -1309,46 +1309,46 @@@ int kho_retrieve_subtree(const char *na
  }
  EXPORT_SYMBOL_GPL(kho_retrieve_subtree);
 =20
+ static int __init kho_mem_retrieve(const void *fdt)
+ {
+ 	struct kho_radix_tree tree;
+ 	const phys_addr_t *mem;
+ 	int len;
+=20
+ 	/* Retrieve the KHO radix tree from passed-in FDT. */
+ 	mem =3D fdt_getprop(fdt, 0, KHO_FDT_MEMORY_MAP_PROP_NAME, &len);
+=20
+ 	if (!mem || len !=3D sizeof(*mem)) {
+ 		pr_err("failed to get preserved KHO memory tree\n");
+ 		return -ENOENT;
+ 	}
+=20
+ 	if (!*mem)
+ 		return -EINVAL;
+=20
+ 	tree.root =3D phys_to_virt(*mem);
+ 	mutex_init(&tree.lock);
+ 	return kho_radix_walk_tree(&tree, kho_preserved_memory_reserve);
+ }
+=20
  static __init int kho_out_fdt_setup(void)
  {
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	void *root =3D kho_out.fdt;
- 	u64 empty_mem_map =3D 0;
+ 	u64 preserved_mem_tree_pa;
  	int err;
 =20
  	err =3D fdt_create(root, PAGE_SIZE);
  	err |=3D fdt_finish_reservemap(root);
  	err |=3D fdt_begin_node(root, "");
  	err |=3D fdt_property_string(root, "compatible", KHO_FDT_COMPATIBLE);
- 	err |=3D fdt_property(root, KHO_FDT_MEMORY_MAP_PROP_NAME, &empty_mem_map,
- 			    sizeof(empty_mem_map));
+=20
+ 	preserved_mem_tree_pa =3D virt_to_phys(tree->root);
+=20
+ 	err |=3D fdt_property(root, KHO_FDT_MEMORY_MAP_PROP_NAME,
+ 			    &preserved_mem_tree_pa,
+ 			    sizeof(preserved_mem_tree_pa));
+=20
  	err |=3D fdt_end_node(root);
  	err |=3D fdt_finish(root);
 =20
@@@ -1353,16 -1357,23 +1357,23 @@@
 =20
  static __init int kho_init(void)
  {
+ 	struct kho_radix_tree *tree =3D &kho_out.radix_tree;
  	const void *fdt =3D kho_get_fdt();
  	int err =3D 0;
 =20
  	if (!kho_enable)
  		return 0;
 =20
+ 	tree->root =3D kzalloc(PAGE_SIZE, GFP_KERNEL);
+ 	if (!tree->root) {
+ 		err =3D -ENOMEM;
+ 		goto err_free_scratch;
+ 	}
+=20
  	kho_out.fdt =3D kho_alloc_preserve(PAGE_SIZE);
  	if (IS_ERR(kho_out.fdt)) {
  		err =3D PTR_ERR(kho_out.fdt);
- 		goto err_free_scratch;
+ 		goto err_free_kho_radix_tree_root;
  	}
 =20
  	err =3D kho_debugfs_init();
@@@ -1408,6 -1419,9 +1419,9 @@@
 =20
  err_free_fdt:
  	kho_unpreserve_free(kho_out.fdt);
+ err_free_kho_radix_tree_root:
+ 	kfree(tree->root);
+ 	tree->root =3D NULL;
  err_free_scratch:
  	kho_out.fdt =3D NULL;
  	for (int i =3D 0; i < kho_scratch_cnt; i++) {
@@@ -1447,10 -1461,12 +1461,12 @@@ static void __init kho_release_scratch(
 =20
  void __init kho_memory_init(void)
  {
- 	if (kho_in.mem_map_phys) {
+ 	if (kho_in.scratch_phys) {
  		kho_scratch =3D phys_to_virt(kho_in.scratch_phys);
  		kho_release_scratch();
- 		kho_mem_deserialize(phys_to_virt(kho_in.mem_map_phys));
+=20
+ 		if (kho_mem_retrieve(kho_get_fdt()))
+ 			kho_in.fdt_phys =3D 0;
  	} else {
  		kho_reserve_scratch();
  	}
@@@ -1528,7 -1544,6 +1544,6 @@@ void __init kho_populate(phys_addr_t fd
 =20
  	kho_in.fdt_phys =3D fdt_phys;
  	kho_in.scratch_phys =3D scratch_phys;
- 	kho_in.mem_map_phys =3D mem_map_phys;
  	kho_scratch_cnt =3D scratch_cnt;
 =20
  	populated =3D true;

--n3P6RfSBncHYw2Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcUvkACgkQJNaLcl1U
h9BvGAf/Z09HtO2DwY7K8XBW948UGGh5ahNXKf85Ttab/SmU/5RVZmF8gTs8c7ix
EVkPXkEJ1f8Mj6TAqPLg/7iZdm5WFJO0dy9xm8NLih3Qokk6VW37hv/SQnCFLW0q
mjqDcLTO5+HJIp4THgYMAO5v/LzqaArdCi92t/aKQcNDJUbhSfwYRtYM1JNV7pmN
m+PFFwqvbE9Agxmo2EatTmLwfMVfIid/OBwsbc3xGEN+OrLAu4WnGoFhTR9IUKam
s7ItOJi4VFZnxBPDCA+wSonTbSR17hfhn83qfpqcDP7rjeZnHWNtBBjCsmK+Ok0e
XqNYqHG+ZgHtj7jcAc4S3pwEk833Jg==
=4CIZ
-----END PGP SIGNATURE-----

--n3P6RfSBncHYw2Od--
