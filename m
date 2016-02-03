From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 16:27:28 +1100
Message-ID: <20160203162728.32e6f283@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39650 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751116AbcBCF1a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Feb 2016 00:27:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
allnoconfig) failed like this:

In file included from kernel/memremap.c:17:0:
include/linux/pfn_t.h:108:7: error: 'pud_mkdevmap' declared as function returning an array

Caused by commit

  a27da20ed50e ("mm: add support for PUD-sized transparent hugepages")

Discovered after the linux-next release.

-- 
Cheers,
Stephen Rothwell
