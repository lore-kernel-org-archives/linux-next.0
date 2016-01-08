From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the nvdimm
 tree
Date: Fri, 8 Jan 2016 16:51:21 +1100
Message-ID: <20160108165121.312b7f77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57949 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750767AbcAHFvZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jan 2016 00:51:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/nvdimm/pmem.c

between commit:

  d0d852f68113 ("block: clarify badblocks lifetime")

from the nvdimm tree and commit:

  90283d3934a7 ("mm: introduce find_dev_pagemap()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/nvdimm/pmem.c
index 5e6656fa3f58,37ebf42c0415..000000000000
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@@ -21,10 -21,10 +21,11 @@@
  #include <linux/init.h>
  #include <linux/platform_device.h>
  #include <linux/module.h>
- #include <linux/memory_hotplug.h>
  #include <linux/moduleparam.h>
 +#include <linux/badblocks.h>
+ #include <linux/memremap.h>
  #include <linux/vmalloc.h>
+ #include <linux/pfn_t.h>
  #include <linux/slab.h>
  #include <linux/pmem.h>
  #include <linux/nd.h>
@@@ -192,13 -180,8 +205,9 @@@ static int pmem_attach_disk(struct devi
  		struct nd_namespace_common *ndns, struct pmem_device *pmem)
  {
  	int nid = dev_to_node(dev);
 +	struct badblocks *bb;
  	struct gendisk *disk;
  
- 	pmem->pmem_queue = blk_alloc_queue_node(GFP_KERNEL, nid);
- 	if (!pmem->pmem_queue)
- 		return -ENOMEM;
- 
  	blk_queue_make_request(pmem->pmem_queue, pmem_make_request);
  	blk_queue_physical_block_size(pmem->pmem_queue, PAGE_SIZE);
  	blk_queue_max_hw_sectors(pmem->pmem_queue, UINT_MAX);
