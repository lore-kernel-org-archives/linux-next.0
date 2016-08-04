From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with the thermal
 tree
Date: Thu, 4 Aug 2016 11:29:15 +1000
Message-ID: <20160804112915.1ad61e46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52141 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752165AbcHDBbs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Aug 2016 21:31:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michele Di Giorgio <michele.digiorgio@arm.com>

Hi Eduardo,

Today's linux-next merge of the thermal-soc tree got a conflict in:

  drivers/thermal/thermal_core.c

between commit:

  c61628f5c6be ("thermal: fix race condition when updating cooling device")

from the thermal tree and commit:

  5eb0037dc771 ("thermal: core: introduce thermal_helpers.c")

from the thermal-soc tree.

I fixed it up (the function thermal_cdev_update was moved to
drivers/thermal/thermal_helpers.c, so I applied teh below fix patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Aug 2016 11:19:56 +1000
Subject: [PATCH] thermal: fix up for "fix race condition when updating cooling device"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/thermal_helpers.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_helpers.c b/drivers/thermal/thermal_helpers.c
index 2d37d9d718c2..14b7f5c0655a 100644
--- a/drivers/thermal/thermal_helpers.c
+++ b/drivers/thermal/thermal_helpers.c
@@ -121,11 +121,13 @@ void thermal_cdev_update(struct thermal_cooling_device *cdev)
 	struct thermal_instance *instance;
 	unsigned long target = 0;
 
+	mutex_lock(&cdev->lock);
 	/* cooling device is updated*/
-	if (cdev->updated)
+	if (cdev->updated) {
+		mutex_unlock(&cdev->lock);
 		return;
+	}
 
-	mutex_lock(&cdev->lock);
 	/* Make sure cdev enters the deepest cooling state */
 	list_for_each_entry(instance, &cdev->thermal_instances, cdev_node) {
 		dev_dbg(&cdev->device, "zone%d->target=%lu\n",
@@ -135,9 +137,9 @@ void thermal_cdev_update(struct thermal_cooling_device *cdev)
 		if (instance->target > target)
 			target = instance->target;
 	}
-	mutex_unlock(&cdev->lock);
 	cdev->ops->set_cur_state(cdev, target);
 	cdev->updated = true;
+	mutex_unlock(&cdev->lock);
 	trace_cdev_update(cdev, target);
 	dev_dbg(&cdev->device, "set to state %lu\n", target);
 }
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
