From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Thu, 15 Oct 2015 13:26:02 +1100
Message-ID: <20151015132602.7816b658@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51944 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751098AbbJOC0E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 22:26:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mfd/intel-lpss.c:29:47: fatal error: asm-generic/io-64-nonatomic-lo-hi.h: No such file or directory
 #include <asm-generic/io-64-nonatomic-lo-hi.h>
                                               ^

Caused by commit

  6a1d82fbc8e8 ("mfd: intel-lpss: Use writeq() helper")

interacting with commit

  f626fe17485b ("move io-64-nonatomic*.h out of asm-generic")

from the asm-generic tree.

I have added the following merge fix patch and can carry it as necessary.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Oct 2015 13:23:20 +1100
Subject: [PATCH] mfd: fix for "move io-64-nonatomic*.h out of asm-generic"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mfd/intel-lpss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 001a7d7708ce..6255513f54c7 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -25,8 +25,7 @@
 #include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
-
-#include <asm-generic/io-64-nonatomic-lo-hi.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "intel-lpss.h"
 
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
