From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the microblaze tree with the Linus'
 tree
Date: Fri, 16 Jul 2010 09:29:17 +1000
Message-ID: <20100716092917.f1047d8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60931 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933661Ab0GOX3T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jul 2010 19:29:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Simek <michal.simek@petalogix.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

Hi Michal,

Today's linux-next merge of the microblaze tree got a conflict in
arch/microblaze/mm/init.c between commit
95f72d1ed41a66f1c1c29c24d479de81a0bea36f ("lmb: rename to memblock") from
Linus' tree and commit c30842ca4d432f553f53d4d6849523fd9b8ebb40
("microblaze: Sync noMMU and MMU setup_memory") from the microblaze tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/microblaze/mm/init.c
index db59349,573b97e..0000000
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@@ -134,14 -134,9 +134,9 @@@ void __init setup_memory(void
  	 * for 4GB of memory, using 4kB pages), plus 1 page
  	 * (in case the address isn't page-aligned).
  	 */
- #ifndef CONFIG_MMU
- 	map_size = init_bootmem_node(NODE_DATA(0), PFN_UP(TOPHYS((u32)klimit)),
- 					min_low_pfn, max_low_pfn);
- #else
- 	map_size = init_bootmem_node(&contig_page_data,
+ 	map_size = init_bootmem_node(NODE_DATA(0),
  		PFN_UP(TOPHYS((u32)klimit)), min_low_pfn, max_low_pfn);
- #endif
 -	lmb_reserve(PFN_UP(TOPHYS((u32)klimit)) << PAGE_SHIFT, map_size);
 +	memblock_reserve(PFN_UP(TOPHYS((u32)klimit)) << PAGE_SHIFT, map_size);
  
  	/* free bootmem is whole main memory */
  	free_bootmem(memory_start, memory_size);
