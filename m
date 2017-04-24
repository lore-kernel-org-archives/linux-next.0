From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 24 Apr 2017 17:25:02 +1000
Message-ID: <20170424172502.63b2c26b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57873 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1166085AbdDXHZE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Apr 2017 03:25:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@techsingularity.net>, Johannes Weiner <hannes@cmpxchg.org>, Jesper Dangaard Brouer <brouer@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/page_alloc.c

between commit:

  d34b0733b452 ("Revert "mm, page_alloc: only use per-cpu allocator for irq-safe requests"")

from Linus' tree and commit:

  f4881295a79e ("mm, page_alloc: re-enable softirq use of per-cpu page allocator")
  e2f499864da5 ("mm-page_alloc-re-enable-softirq-use-of-per-cpu-page-allocator-checkpatch-fixes")
  24612e65dd01 ("mm: delete NR_PAGES_SCANNED and pgdat_reclaimable()")

from the akpm-current tree.

Given the comments in the former revert, I effectively reverted
f4881295a79e and e2f499864da5 and fixed the rest up (hopefully).

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc mm/page_alloc.c
index d431a46b4139,3c1a977b7d21..000000000000
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@@ -1091,15 -1090,11 +1091,10 @@@ static void free_pcppages_bulk(struct z
  {
  	int migratetype = 0;
  	int batch_free = 0;
- 	unsigned long nr_scanned;
 -	unsigned long flags;
  	bool isolated_pageblocks;
  
 -	spin_lock_irqsave(&zone->lock, flags);
 +	spin_lock(&zone->lock);
  	isolated_pageblocks = has_isolate_pageblock(zone);
- 	nr_scanned = node_page_state(zone->zone_pgdat, NR_PAGES_SCANNED);
- 	if (nr_scanned)
- 		__mod_node_page_state(zone->zone_pgdat, NR_PAGES_SCANNED, -nr_scanned);
- 
  	while (count) {
  		struct page *page;
  		struct list_head *list;
@@@ -1151,12 -1146,10 +1146,8 @@@ static void free_one_page(struct zone *
  				unsigned int order,
  				int migratetype)
  {
- 	unsigned long nr_scanned;
 -	unsigned long flags;
 -
 -	spin_lock_irqsave(&zone->lock, flags);
 +	spin_lock(&zone->lock);
- 	nr_scanned = node_page_state(zone->zone_pgdat, NR_PAGES_SCANNED);
- 	if (nr_scanned)
- 		__mod_node_page_state(zone->zone_pgdat, NR_PAGES_SCANNED, -nr_scanned);
- 
+ 	__count_vm_events(PGFREE, 1 << order);
  	if (unlikely(has_isolate_pageblock(zone) ||
  		is_migrate_isolate(migratetype))) {
  		migratetype = get_pfnblock_migratetype(page, pfn);
