From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Thu, 26 May 2011 11:12:51 +1000
Message-ID: <20110526111251.75245cbf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57446 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752574Ab1EZBM4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 May 2011 21:12:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Anatolij Gustschin <agust@denx.de>

Hi all,

With Linus' tree, today's linux-next build (x86_64 allmodconfig) failed
like this:

drivers/video/mb862xx/mb862xx-i2c.c: In function 'mb862xx_i2c_wait_event':
drivers/video/mb862xx/mb862xx-i2c.c:25: error: implicit declaration of function 'udelay'

Caused by commit f8a6b1f44833 ("video: mb862xx: add support for
controller's I2C bus adapter").

See Rule 1 in Documentation/SubmitChecklist.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 May 2011 11:09:10 +1000
Subject: [PATCH] video: mb862xx: udelay need linux/delay.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/video/mb862xx/mb862xx-i2c.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/mb862xx/mb862xx-i2c.c b/drivers/video/mb862xx/mb862xx-i2c.c
index cb77d3b..b953099 100644
--- a/drivers/video/mb862xx/mb862xx-i2c.c
+++ b/drivers/video/mb862xx/mb862xx-i2c.c
@@ -12,6 +12,7 @@
 #include <linux/fb.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "mb862xxfb.h"
 #include "mb862xx_reg.h"
-- 
1.7.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
