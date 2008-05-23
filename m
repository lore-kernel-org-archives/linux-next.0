From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i2c build failure
Date: Fri, 23 May 2008 11:32:55 +1000
Message-ID: <20080523113255.258e38bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57829 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751535AbYEWBdC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 May 2008 21:33:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Dave Young <hidave.darkstar@gmail.com>, Kay Sievers <kay.sievers@vrfy.org>

Hi Jean,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/i2c/i2c-core.c: In function 'i2c_register_driver':
drivers/i2c/i2c-core.c:697: warning: passing argument 2 of 'class_for_each_device' from incompatible pointer type
drivers/i2c/i2c-core.c:697: error: too few arguments to function 'class_for_each_device'
drivers/i2c/i2c-core.c: In function 'i2c_del_driver':
drivers/i2c/i2c-core.c:749: warning: passing argument 2 of 'class_for_each_device' from incompatible pointer type
drivers/i2c/i2c-core.c:749: error: too few arguments to function 'class_for_each_device'

This is caused by commit f79228aaa062668bcbabf9762e819a1d7ee7c5c4 ("i2c:
Use class_for_each_device") from the i2c tree interacting with commit
a3ec024649e0095368d38a2e434ad092b79aa7af ("Driver Core: add ability for
class_for_each_device to start in middle of list") from the driver-core
tree.  The latter added a parameter to class_for_each_device while the
former added a new usage.

I applied the patch below.

Greg, is there some better way to handle this interface change?  (e.g. new
function name?)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

>From 4dde1df49f5c1301b5eea93a3776624de6e4f0c5 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 May 2008 11:27:59 +1000
Subject: [PATCH] i2c: fix fallout from class_for_each_device change.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/i2c/i2c-core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index e06067e..a1021d5 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -693,7 +693,7 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 
 	/* legacy drivers scan i2c busses directly */
 	if (driver->attach_adapter)
-		class_for_each_device(&i2c_adapter_class, driver,
+		class_for_each_device(&i2c_adapter_class, NULL, driver,
 				      __attach_adapter);
 
 	mutex_unlock(&core_lock);
@@ -745,7 +745,7 @@ void i2c_del_driver(struct i2c_driver *driver)
 
 	/* legacy driver? */
 	if (!is_newstyle_driver(driver))
-		class_for_each_device(&i2c_adapter_class, driver,
+		class_for_each_device(&i2c_adapter_class, NULL, driver,
 				      __detach_adapter);
 
 	driver_unregister(&driver->driver);
-- 
1.5.5.1

