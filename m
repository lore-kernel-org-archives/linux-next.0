From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 8 Feb 2016 15:51:54 +1100
Message-ID: <20160208155154.1cb807c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35314 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753979AbcBHEv5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2016 23:51:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>, David Rientjes <rientjes@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/mm/hash_utils_64.c: In function 'htab_bolt_mapping':
arch/powerpc/mm/hash_utils_64.c:260:28: error: 'linear_map_hash_count' undeclared (first use in this function)
    (paddr >> PAGE_SHIFT) < linear_map_hash_count)
                            ^
arch/powerpc/mm/hash_utils_64.c:260:28: note: each undeclared identifier is reported only once for each function it appears in
arch/powerpc/mm/hash_utils_64.c:261:4: error: 'linear_map_hash_slots' undeclared (first use in this function)
    linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
    ^
arch/powerpc/mm/hash_utils_64.c: In function 'htab_initialize':
arch/powerpc/mm/hash_utils_64.c:724:3: error: 'linear_map_hash_count' undeclared (first use in this function)
   linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
   ^
arch/powerpc/mm/hash_utils_64.c:725:3: error: 'linear_map_hash_slots' undeclared (first use in this function)
   linear_map_hash_slots = __va(memblock_alloc_base(
   ^

Caused by commit

  79581c9f284e ("powerpc: query dynamic DEBUG_PAGEALLOC setting")

The CONFIG_DEBUG_PAGEALLOC stuff in this file depends on extra data
being kept which was left under CONFIG_DEBUG_PAGEALLOC protection.

I just reverted this commit for today.

-- 
Cheers,
Stephen Rothwell
