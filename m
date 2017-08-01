From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm tree
Date: Tue, 1 Aug 2017 16:02:57 +1000
Message-ID: <20170801160257.0b1306b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750716AbdHAGC7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 02:02:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huang Ying <ying.huang@intel.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

mm/swapfile.c: In function 'reuse_swap_page':
mm/swapfile.c:1429:16: warning: 'offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
  unsigned long offset;
                ^

Introduced by commit

  e16cd4930836 ("mm, THP, swap: make reuse_swap_page() works for THP swapped out")

-- 
Cheers,
Stephen Rothwell
