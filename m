From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nommu tree
Date: Thu, 11 Dec 2008 18:25:30 +1100
Message-ID: <20081211182530.924d4af6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39595 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751811AbYLKHZn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 02:25:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Paul Mundt <lethal@linux-sh.org>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi David,

Today's linux-next merge of the nommu tree got a conflict in
Documentation/sysctl/vm.txt between commit
cb8fc7a88a0069ebdab220180bf9b45e568f0ba9 ("slub: Trigger defragmentation
from memory reclaim") from the slab tree and commit
1a5d96d0151ce2ec77bf08498751fe8d9365c95f ("NOMMU: Make mmap allocation
page trimming behaviour configurable.") from the nommu tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/sysctl/vm.txt
index 5e7329a,e9a5c28..0000000
--- a/Documentation/sysctl/vm.txt
+++ b/Documentation/sysctl/vm.txt
@@@ -38,7 -38,7 +38,8 @@@ Currently, these files are in /proc/sys
  - numa_zonelist_order
  - nr_hugepages
  - nr_overcommit_hugepages
 +- slab_defrag_limit
+ - nr_trim_pages		(only if CONFIG_MMU=n)
  
  ==============================================================
  
@@@ -351,11 -351,17 +352,27 @@@ See Documentation/vm/hugetlbpage.tx
  
  ==============================================================
  
 +slab_defrag_limit
 +
 +Determines the frequency of calls from reclaim into slab defragmentation.
 +Slab defrag reclaims objects from sparsely populates slab pages.
 +The default is 1000. Increase if slab defragmentation occurs
 +too frequently. Decrease if more slab defragmentation passes
 +are needed. The slabinfo tool can report on the frequency of the callbacks.
 +
++==============================================================
++
+ nr_trim_pages
+ 
+ This is available only on NOMMU kernels.
+ 
+ This value adjusts the excess page trimming behaviour of power-of-2 aligned
+ NOMMU mmap allocations.
+ 
+ A value of 0 disables trimming of allocations entirely, while a value of 1
+ trims excess pages aggressively. Any value >= 1 acts as the watermark where
+ trimming of allocations is initiated.
+ 
+ The default value is 1.
+ 
+ See Documentation/nommu-mmap.txt for more information.
