From: Kevin Winchester <kjwinchester@gmail.com>
Subject: [PATCH linux-next] agp: correct missing cleanup on error in agp_add_bridge
Date: Sat, 25 Jul 2009 22:30:09 -0300
Message-ID: <4A6BB1A1.50308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f196.google.com ([209.85.221.196]:65143 "EHLO
	mail-qy0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751961AbZGZBaM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Jul 2009 21:30:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org


While investigating a kmemleak detected leak, I encountered the
agp_add_bridge function.  It appears to be responsible for freeing
the agp_bridge_data in the case of a failure, but it is only doing
so for some errors.

Fix it to always free the bridge data if a failure condition is
encountered.

Signed-off-by: Kevin Winchester <kjwinchester@gmail.com>
---

Note that this seems like a reasonable change to me, but this patch
did not get rid of the kmemleak report, so I don't even have that as
evidence of its correctness.  Please review.

diff --git a/drivers/char/agp/backend.c b/drivers/char/agp/backend.c
index cfa5a64..aebd82c 100644
--- a/drivers/char/agp/backend.c
+++ b/drivers/char/agp/backend.c
@@ -263,18 +263,22 @@ int agp_add_bridge(struct agp_bridge_data *bridge)
 {
        int error;
 
-       if (agp_off)
-               return -ENODEV;
+       if (agp_off) {
+               error = -ENODEV;
+               goto err_put_bridge;
+       }
 
        if (!bridge->dev) {
                printk (KERN_DEBUG PFX "Erk, registering with no pci_dev!\n");
-               return -EINVAL;
+               error = -EINVAL;
+               goto err_put_bridge;
        }
 
        /* Grab reference on the chipset driver. */
        if (!try_module_get(bridge->driver->owner)) {
                dev_info(&bridge->dev->dev, "can't lock chipset driver\n");
-               return -EINVAL;
+               error = -EINVAL;
+               goto err_put_bridge;
        }
 
        error = agp_backend_initialize(bridge);
@@ -304,6 +308,7 @@ frontend_err:
        agp_backend_cleanup(bridge);
 err_out:
        module_put(bridge->driver->owner);
+err_put_bridge:
        agp_put_bridge(bridge);
        return error;
 }
