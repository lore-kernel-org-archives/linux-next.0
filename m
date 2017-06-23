From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the l2-mtd tree
Date: Fri, 23 Jun 2017 11:32:06 +1000
Message-ID: <20170623113206.29042011@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753833AbdFWBcJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jun 2017 21:32:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <rafal@milecki.pl>

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/printk.h:6:0,
                 from include/linux/kernel.h:13,
                 from include/linux/list.h:8,
                 from include/linux/module.h:9,
                 from drivers/mtd/parsers/parser_trx.c:12:
drivers/mtd/parsers/parser_trx.c: In function 'parser_trx_data_part_name':
include/linux/kern_levels.h:4:18: warning: format '%X' expects argument of type 'unsigned int', but argument 2 has type 'size_t {aka long unsigned int}' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:10:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
include/linux/printk.h:301:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^
drivers/mtd/parsers/parser_trx.c:42:3: note: in expansion of macro 'pr_err'
   pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
   ^

Introduced by commit

  99352afe8f16 ("mtd: extract TRX parser out of bcm47xxpart into a separated module")

-- 
Cheers,
Stephen Rothwell
