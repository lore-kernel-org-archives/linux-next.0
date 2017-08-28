From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the l2-mtd tree
Date: Mon, 28 Aug 2017 12:19:05 +1000
Message-ID: <20170828121905.36ff8a63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Rugiero <mrugiero@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/nand/nandsim.c: In function 'ns_init_module':
drivers/mtd/nand/nandsim.c:2353:2: error: implicit declaration of function 'nandsim_debugfs_remove' [-Werror=implicit-function-declaration]
  nandsim_debugfs_remove(nand);
  ^

Caused by commit

  e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")

interacting with commit

  b974696da1cf ("mtd: nandsim: remove debugfs entries in error path")

from Linus' tree.

I applied the following merge fix patch ... please check.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Aug 2017 12:13:42 +1000
Subject: [PATCH] fix merge of l2-mtd tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mtd/nand/nandsim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 00635fd738f6..1ddf0b73c246 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2350,7 +2350,6 @@ static int __init ns_init_module(void)
         return 0;
 
 err_exit:
-	nandsim_debugfs_remove(nand);
 	free_nandsim(nand);
 	nand_release(nsmtd);
 	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
-- 
2.13.2




-- 
Cheers,
Stephen Rothwell
