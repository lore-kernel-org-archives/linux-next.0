From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 1 Aug 2017 16:39:04 +1000
Message-ID: <20170801163904.7d49881a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34869 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751038AbdHAGjG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 02:39:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zi Yan <zi.yan@cs.rutgers.edu>

Hi Andrew,

After merging the akpm tree, today's linux-next build (sparc defconfig)
failed like this:

In file included from mm/vmscan.c:55:0:
include/linux/swapops.h: In function 'swp_entry_to_pmd':
include/linux/swapops.h:226:9: error: implicit declaration of function '__pmd' [-Werror=implicit-function-declaration]
  return __pmd(0);
         ^
include/linux/swapops.h:226:9: error: incompatible types when returning type 'int' but 'pmd_t {aka struct <anonymous>}' was expected

Caused by commit

  9bb18490758c ("mm-thp-enable-thp-migration-in-generic-path-fix")

It looks like sparc 32 bit has no __pmd() ...

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
