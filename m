From: Noah Watkins <noahwatkins@gmail.com>
Subject: [PATCH -next 1/2] staging: zram: make global var "devices" use unique name
Date: Wed, 20 Jul 2011 17:05:57 -0600
Message-ID: <CAB2gnbU3xNhk-0U_S4r-=4n2ixipmrs+qrRQQxO6Xuae8KRyQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:37547 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752716Ab1GTXF6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2011 19:05:58 -0400
Received: by vws1 with SMTP id 1so528489vws.19
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2011 16:05:57 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nitin Gupta <ngupta@vflare.org>
Cc: linux-next@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

The global variable "devices" is too general to be global.
This patch switches the name to be "zram_devices".

Signed-off-by: Noah Watkins <noahwatkins@gmail.com>
---
 drivers/staging/zram/zram_drv.c   |   16 ++++++++--------
 drivers/staging/zram/zram_drv.h   |    2 +-
 drivers/staging/zram/zram_sysfs.c |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/zram/zram_drv.c b/drivers/staging/zram/zram_drv.c
index d70ec1a..11e7e92 100644
--- a/drivers/staging/zram/zram_drv.c
+++ b/drivers/staging/zram/zram_drv.c
@@ -37,7 +37,7 @@

 /* Globals */
 static int zram_major;
-struct zram *devices;
+struct zram *zram_devices;

 /* Module params (documentation at end) */
 unsigned int num_devices;
@@ -801,14 +801,14 @@ static int __init zram_init(void)

 	/* Allocate the device array and initialize each one */
 	pr_info("Creating %u devices ...\n", num_devices);
-	devices = kzalloc(num_devices * sizeof(struct zram), GFP_KERNEL);
-	if (!devices) {
+	zram_devices = kzalloc(num_devices * sizeof(struct zram), GFP_KERNEL);
+	if (!zram_devices) {
 		ret = -ENOMEM;
 		goto unregister;
 	}

 	for (dev_id = 0; dev_id < num_devices; dev_id++) {
-		ret = create_device(&devices[dev_id], dev_id);
+		ret = create_device(&zram_devices[dev_id], dev_id);
 		if (ret)
 			goto free_devices;
 	}
@@ -817,8 +817,8 @@ static int __init zram_init(void)

 free_devices:
 	while (dev_id)
-		destroy_device(&devices[--dev_id]);
-	kfree(devices);
+		destroy_device(&zram_devices[--dev_id]);
+	kfree(zram_devices);
 unregister:
 	unregister_blkdev(zram_major, "zram");
 out:
@@ -831,7 +831,7 @@ static void __exit zram_exit(void)
 	struct zram *zram;

 	for (i = 0; i < num_devices; i++) {
-		zram = &devices[i];
+		zram = &zram_devices[i];

 		destroy_device(zram);
 		if (zram->init_done)
@@ -840,7 +840,7 @@ static void __exit zram_exit(void)

 	unregister_blkdev(zram_major, "zram");

-	kfree(devices);
+	kfree(zram_devices);
 	pr_debug("Cleanup done!\n");
 }

diff --git a/drivers/staging/zram/zram_drv.h b/drivers/staging/zram/zram_drv.h
index abe5221..0e4b540 100644
--- a/drivers/staging/zram/zram_drv.h
+++ b/drivers/staging/zram/zram_drv.h
@@ -123,7 +123,7 @@ struct zram {
 	struct zram_stats stats;
 };

-extern struct zram *devices;
+extern struct zram *zram_devices;
 extern unsigned int num_devices;
 #ifdef CONFIG_SYSFS
 extern struct attribute_group zram_disk_attr_group;
diff --git a/drivers/staging/zram/zram_sysfs.c
b/drivers/staging/zram/zram_sysfs.c
index a70cc01..0f001e8 100644
--- a/drivers/staging/zram/zram_sysfs.c
+++ b/drivers/staging/zram/zram_sysfs.c
@@ -35,7 +35,7 @@ static struct zram *dev_to_zram(struct device *dev)
 	struct zram *zram = NULL;

 	for (i = 0; i < num_devices; i++) {
-		zram = &devices[i];
+		zram = &zram_devices[i];
 		if (disk_to_dev(zram->disk) == dev)
 			break;
 	}
-- 
1.7.5.4
