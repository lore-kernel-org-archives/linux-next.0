From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the akpm tree
Date: Thu, 24 Nov 2016 16:20:26 +1100
Message-ID: <20161124162026.7822c1e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750726AbcKXFU3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Nov 2016 00:20:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Wool <vitalywool@gmail.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/printk.h:6:0,
                 from include/linux/kernel.h:13,
                 from include/linux/list.h:8,
                 from mm/z3fold.c:26:
mm/z3fold.c: In function 'init_z3fold':
include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:10:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
include/linux/printk.h:292:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^
mm/z3fold.c:887:3: note: in expansion of macro 'pr_err'
   pr_err("z3fold: z3fold_header size (%d) is bigger than "
   ^

Introduced by patch

  "z3fold: don't fail kernel build if z3fold_header is too big"

-- 
Cheers,
Stephen Rothwell
