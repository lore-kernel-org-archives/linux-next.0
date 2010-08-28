From: Shahar Havivi <shaharh@redhat.com>
Subject: [PATCH] zram: free device memory when init fails
Date: Sat, 28 Aug 2010 10:09:05 +0300
Message-ID: <20100828070901.GA31943@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, greg@kroah.com
List-Id: linux-next.vger.kernel.org

Signed-off-by: Shahar Havivi <shaharh@redhat.com>
---
 drivers/staging/zram/zram_drv.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/zram/zram_drv.c b/drivers/staging/zram/zram_drv.c
index 77d4d71..e8d2319 100644
--- a/drivers/staging/zram/zram_drv.c
+++ b/drivers/staging/zram/zram_drv.c
@@ -769,6 +769,7 @@ static int __init zram_init(void)
 free_devices:
 	while (dev_id)
 		destroy_device(&devices[--dev_id]);
+    kfree(devices);
 unregister:
 	unregister_blkdev(zram_major, "zram");
 out:
-- 
1.7.2.1
