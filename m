From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 15 Oct 2015 11:51:08 +1100
Message-ID: <20151015115108.57c04f61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54744 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751222AbbJOAvM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 20:51:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/dma/idma64.h:19:47: fatal error: asm-generic/io-64-nonatomic-lo-hi.h: No such file or directory
 #include <asm-generic/io-64-nonatomic-lo-hi.h>
                                               ^

Caused by commit

  97c37accd38f ("dmaengine: idma64: use lo_hi_readq() / lo_hi_writeq()")

interacting with commit

  f626fe17485b ("move io-64-nonatomic*.h out of asm-generic")

from the asm-generic tree.

I have applied the folling merge fix patch and can carry it as necessary.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Oct 2015 11:47:07 +1100
Subject: [PATCH] dmaengine: idma64: merge fix for "move io-64-nonatomic*.h out of asm-generic"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/dma/idma64.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/idma64.h b/drivers/dma/idma64.h
index f6aeff0af8a5..801d5462d663 100644
--- a/drivers/dma/idma64.h
+++ b/drivers/dma/idma64.h
@@ -15,8 +15,7 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-
-#include <asm-generic/io-64-nonatomic-lo-hi.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "virt-dma.h"
 
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
