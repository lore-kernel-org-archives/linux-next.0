From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the asm-generic tree
Date: Thu, 15 Oct 2015 09:55:03 +1100
Message-ID: <20151015095503.4f35b216@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53707 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754166AbbJNWzG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 18:55:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Arnd,

After merging the asm-generic tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/acpi/osl.c:46:47: fatal error: asm-generic/io-64-nonatomic-lo-hi.h: No such file or directory
 #include <asm-generic/io-64-nonatomic-lo-hi.h>
                                               ^

Caused by commit

  f626fe17485b ("move io-64-nonatomic*.h out of asm-generic")

interacting with commit

  3277b4ea216e ("ACPI / osl: replace custom implementation of readq / writeq")

from Linus' tree (added before v4.3-rc1).

I added the following build fix:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Oct 2015 09:50:08 +1100
Subject: [PATCH] fix for "move io-64-nonatomic*.h out of asm-generic"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 739a4a6b3b9b..ed219da94904 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -40,10 +40,10 @@
 #include <linux/list.h>
 #include <linux/jiffies.h>
 #include <linux/semaphore.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <asm-generic/io-64-nonatomic-lo-hi.h>
 
 #include "internal.h"
 
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
