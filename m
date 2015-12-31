From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Date: Thu, 31 Dec 2015 21:58:49 +1100
Message-ID: <20151231215849.01be6998@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60304 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751215AbbLaK6v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 05:58:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Elliott <elliott@hpe.com>, Taku Izumi <izumi.taku@jp.fujitsu.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/page_alloc.c

between commit:

  9daacf51b428 ("Documentation/kernel-parameters: update KMG units")

from the jc_docs tree and commit:

  f0a906868be1 ("mm/page_alloc.c: introduce kernelcore=mirror option")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/page_alloc.c
index 13cf824f6d23,72218a4adab9..000000000000
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@@ -5500,7 -5718,37 +5718,37 @@@ static void __init find_zone_movable_pf
  	}
  
  	/*
+ 	 * If kernelcore=mirror is specified, ignore movablecore option
+ 	 */
+ 	if (mirrored_kernelcore) {
+ 		bool mem_below_4gb_not_mirrored = false;
+ 
+ 		for_each_memblock(memory, r) {
+ 			if (memblock_is_mirror(r))
+ 				continue;
+ 
+ 			nid = r->nid;
+ 
+ 			usable_startpfn = memblock_region_memory_base_pfn(r);
+ 
+ 			if (usable_startpfn < 0x100000) {
+ 				mem_below_4gb_not_mirrored = true;
+ 				continue;
+ 			}
+ 
+ 			zone_movable_pfn[nid] = zone_movable_pfn[nid] ?
+ 				min(usable_startpfn, zone_movable_pfn[nid]) :
+ 				usable_startpfn;
+ 		}
+ 
+ 		if (mem_below_4gb_not_mirrored)
+ 			pr_warn("This configuration results in unmirrored kernel memory.");
+ 
+ 		goto out2;
+ 	}
+ 
+ 	/*
 -	 * If movablecore=nn[KMG] was specified, calculate what size of
 +	 * If movablecore=nn[KMGTPE] was specified, calculate what size of
  	 * kernelcore that corresponds so that memory usable for
  	 * any allocation type is evenly spread. If both kernelcore
  	 * and movablecore are specified, then the value of kernelcore
