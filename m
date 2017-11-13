From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 13 Nov 2017 16:54:24 +1100
Message-ID: <20171113165424.3139c569@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54377 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751585AbdKMFyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:54:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yury Norov <ynorov@caviumnetworks.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/printk.h:7:0,
                 from include/linux/kernel.h:14,
                 from lib/test_find_bit.c:28:
lib/test_find_bit.c: In function 'test_find_first_bit':
include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t {aka long long unsigned int}' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
include/linux/printk.h:300:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^
lib/test_find_bit.c:54:2: note: in expansion of macro 'pr_err'
  pr_err("find_first_bit:\t\t%ld cycles,\t%ld iterations\n", cycles, cnt);
  ^
lib/test_find_bit.c: In function 'test_find_next_bit':
include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t {aka long long unsigned int}' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
include/linux/printk.h:300:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^
lib/test_find_bit.c:68:2: note: in expansion of macro 'pr_err'
  pr_err("find_next_bit:\t\t%ld cycles,\t%ld iterations\n", cycles, cnt);
  ^
lib/test_find_bit.c: In function 'test_find_next_zero_bit':
include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t {aka long long unsigned int}' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
include/linux/printk.h:300:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^
lib/test_find_bit.c:82:2: note: in expansion of macro 'pr_err'
  pr_err("find_next_zero_bit:\t%ld cycles,\t%ld iterations\n",
  ^
lib/test_find_bit.c: In function 'test_find_last_bit':
include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t {aka long long unsigned int}' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
include/linux/printk.h:300:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^
lib/test_find_bit.c:102:2: note: in expansion of macro 'pr_err'
  pr_err("find_last_bit:\t\t%ld cycles,\t%ld iterations\n", cycles, cnt);
  ^

Introduced by commit

  09588b1f1d58 ("lib: test module for find_*_bit() functions")

-- 
Cheers,
Stephen Rothwell
