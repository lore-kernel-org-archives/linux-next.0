From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 driver-core tree
Date: Wed, 7 Oct 2015 15:36:56 +1100
Message-ID: <20151007153656.3948e6ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38630 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213AbbJGEg7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 00:36:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Mel Gorman <mgorman@techsingularity.net>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  mm/failslab.c
  mm/page_alloc.c

between commit:

  621a5f7ad9cd ("debugfs: Pass bool pointer to debugfs_create_bool()")

from the driver-core tree and commit:

  67c145d9ff18 ("mm, page_alloc: rename __GFP_WAIT to __GFP_RECLAIM")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/failslab.c
index 98fb490311eb,35c876c82b9d..000000000000
--- a/mm/failslab.c
+++ b/mm/failslab.c
@@@ -3,12 -3,12 +3,12 @@@
  
  static struct {
  	struct fault_attr attr;
- 	bool ignore_gfp_wait;
 -	u32 ignore_gfp_reclaim;
 -	int cache_filter;
++	bool ignore_gfp_reclaim;
 +	bool cache_filter;
  } failslab = {
  	.attr = FAULT_ATTR_INITIALIZER,
- 	.ignore_gfp_wait = true,
 -	.ignore_gfp_reclaim = 1,
 -	.cache_filter = 0,
++	.ignore_gfp_reclaim = true,
 +	.cache_filter = false,
  };
  
  bool should_failslab(size_t size, gfp_t gfpflags, unsigned long cache_flags)
diff --cc mm/page_alloc.c
index 805bbad2e24e,c73913648357..000000000000
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@@ -2159,13 -2277,13 +2277,13 @@@ failed
  static struct {
  	struct fault_attr attr;
  
 -	u32 ignore_gfp_highmem;
 -	u32 ignore_gfp_reclaim;
 +	bool ignore_gfp_highmem;
- 	bool ignore_gfp_wait;
++	bool ignore_gfp_reclaim;
  	u32 min_order;
  } fail_page_alloc = {
  	.attr = FAULT_ATTR_INITIALIZER,
- 	.ignore_gfp_wait = true,
 -	.ignore_gfp_reclaim = 1,
 -	.ignore_gfp_highmem = 1,
++	.ignore_gfp_reclaim = true,
 +	.ignore_gfp_highmem = true,
  	.min_order = 1,
  };
  
