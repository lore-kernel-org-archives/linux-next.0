From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Wed, 9 Nov 2016 15:10:06 +1100
Message-ID: <20161109151006.7354dfae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751581AbcKIEKJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Nov 2016 23:10:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Huang Shijie <shijie.huang@arm.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

mm/hugetlb.c:1166:21: warning: 'alloc_gigantic_page' defined but not used [-Wunused-function]
 static struct page *alloc_gigantic_page(int nid, unsigned int order)
                     ^

Introduced by commit

  4acc8ccc3c57 ("mm/hugetlb.c: rename some allocation functions")

-- 
Cheers,
Stephen Rothwell
