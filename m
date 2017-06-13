From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the driver-core tree
Date: Tue, 13 Jun 2017 16:04:18 +1000
Message-ID: <20170613160418.655a8f12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57535 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752253AbdFMGEU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 02:04:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

Hi Greg,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/block/zram/zram_drv.c:1296:28: error: expected ')' before numeric constant
 static CLASS_ATTR(hot_add, 0400, hot_add_show, NULL);
                            ^
drivers/block/zram/zram_drv.c:1330:3: error: 'class_attr_hot_add' undeclared here (not in a function)
  &class_attr_hot_add.attr,
   ^
drivers/block/zram/zram_drv.c:1282:16: warning: 'hot_add_show' defined but not used [-Wunused-function]
 static ssize_t hot_add_show(struct class *class,
                ^

Caused by commit

  27104a53d02e ("zram: use class_groups instead of class_attrs")

I have reverted that commit for today (and commit

  ecbaa83ee84c ("driver core: remove class_attrs from struct class")

temporarily so the the tree will build).

-- 
Cheers,
Stephen Rothwell
