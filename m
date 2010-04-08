From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Thu, 8 Apr 2010 12:57:21 +1000
Message-ID: <20100408125721.f93c1225.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Todd Fischer <todd.fischer@ridgerun.com>
List-Id: linux-next.vger.kernel.org

Hi Samuel,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mfd/tps6507x.c: In function 'tps6507x_i2c_probe':
drivers/mfd/tps6507x.c:90: error: implicit declaration of function 'kzalloc'
drivers/mfd/tps6507x.c:90: warning: assignment makes pointer from integer without a cast
drivers/mfd/tps6507x.c:92: error: implicit declaration of function 'kfree'

Caused by commit 353dd1bf937f319eb6fdf35a461bf0bea1361d23 ("mfd: Add
TPS6507x support").

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Apr 2010 12:53:32 +1000
Subject: [PATCH] mfd: TPS6507x: using kzalloc/kfree requires including slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mfd/tps6507x.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
index dcddef0..d859dff 100644
--- a/drivers/mfd/tps6507x.c
+++ b/drivers/mfd/tps6507x.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6507x.h>
-- 
1.7.0.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
