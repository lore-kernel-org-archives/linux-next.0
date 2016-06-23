From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 23 Jun 2016 16:53:21 +1000
Message-ID: <20160623165321.01995531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58907 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751053AbcFWGx0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jun 2016 02:53:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig and x86_64 allmodconfig) produced this warning:

drivers/base/node.c: In function 'node_read_meminfo':
drivers/base/node.c:127:31: warning: passing argument 1 of 'node_page_state' makes pointer from integer without a cast [-Wint-conversion]
          nid, node_page_state(nid, NR_KERNEL_STACK) *
                               ^
In file included from include/linux/mm.h:999:0,
                 from drivers/base/node.c:7:
include/linux/vmstat.h:200:22: note: expected 'struct pglist_data *' but argument is of type 'int'
 extern unsigned long node_page_state(struct pglist_data *pgdat,
                      ^

Introduced by commit

  2bfac6c1ec44 ("mm, vmstat: add infrastructure for per-node vmstats")

-- 
Cheers,
Stephen Rothwell
