From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Wed, 3 Feb 2016 11:09:40 +1100
Message-ID: <20160203110940.1c3ecf32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44352 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751011AbcBCAJn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2016 19:09:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Toshi Kani <toshi.kani@hpe.com>, Borislav Petkov <bp@suse.de>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/memremap.c

between commit:

  eb7d78c9e7f6 ("devm_memremap_pages: fix vmem_altmap lifetime + alignment handling")

from Linus' tree and commit:

  1c29f25bf5d6 ("memremap: Change region_intersects() to take @flags and @desc")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/memremap.c
index 70ee3775de24,293309cac061..000000000000
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@@ -269,8 -267,8 +270,8 @@@ void *devm_memremap_pages(struct devic
  		struct percpu_ref *ref, struct vmem_altmap *altmap)
  {
  	int is_ram = region_intersects(res->start, resource_size(res),
- 			"System RAM");
+ 				       IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE);
 -	resource_size_t key, align_start, align_size;
 +	resource_size_t key, align_start, align_size, align_end;
  	struct dev_pagemap *pgmap;
  	struct page_map *page_map;
  	unsigned long pfn;
