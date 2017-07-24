From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the l2-mtd tree
Date: Mon, 24 Jul 2017 11:48:36 +1000
Message-ID: <20170724114836.08a7da64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751782AbdGXBsi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Jul 2017 21:48:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Rugiero <mrugiero@gmail.com>

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/mtd/mtdswap.c: In function 'mtdswap_add_debugfs':
drivers/mtd/mtdswap.c:1317:17: warning: unused variable 'dev' [-Wunused-variable]
  struct device *dev = disk_to_dev(gd);
                 ^

Introduced by commit

  e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")

-- 
Cheers,
Stephen Rothwell
