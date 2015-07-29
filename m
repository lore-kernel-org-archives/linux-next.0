From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the pm tree
Date: Wed, 29 Jul 2015 12:27:30 +1000
Message-ID: <20150729122730.1fc9b6a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55896 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751369AbbG2C1d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 22:27:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Lee,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/acpi/scan.c

between commit:

  68c6b148daa6 ("ACPI / scan: Move device matching code to bus.c")

from the pm tree and commit:

  712e960f0ee9 ("ACPI / PM: Attach ACPI power domain only once")

from the mfd tree.

I fixed it up by adding the following merge fix patch and can carry the
fix as necessary.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Jul 2015 12:07:20 +1000
Subject: [PATCH] ACPI / PM: merge fix for code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/acpi/bus.c | 46 ++++++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 54a2e66ce236..afc15bf929d8 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -482,6 +482,35 @@ static void acpi_device_remove_notify_handler(struct acpi_device *device)
                              Device Matching
    -------------------------------------------------------------------------- */
 
+/**
+ * acpi_device_is_first_physical_node - Is given dev first physical node
+ * @adev: ACPI companion device
+ * @dev: Physical device to check
+ *
+ * Function checks if given @dev is the first physical devices attached to
+ * the ACPI companion device. This distinction is needed in some cases
+ * where the same companion device is shared between many physical devices.
+ *
+ * Note that the caller have to provide valid @adev pointer.
+ */
+bool acpi_device_is_first_physical_node(struct acpi_device *adev,
+					const struct device *dev)
+{
+	bool ret = false;
+
+	mutex_lock(&adev->physical_node_lock);
+	if (!list_empty(&adev->physical_node_list)) {
+		const struct acpi_device_physical_node *node;
+
+		node = list_first_entry(&adev->physical_node_list,
+					struct acpi_device_physical_node, node);
+		ret = node->dev == dev;
+	}
+	mutex_unlock(&adev->physical_node_lock);
+
+	return ret;
+}
+
 /*
  * acpi_companion_match() - Can we match via ACPI companion device
  * @dev: Device in question
@@ -506,7 +535,6 @@ static void acpi_device_remove_notify_handler(struct acpi_device *device)
 struct acpi_device *acpi_companion_match(const struct device *dev)
 {
 	struct acpi_device *adev;
-	struct mutex *physical_node_lock;
 
 	adev = ACPI_COMPANION(dev);
 	if (!adev)
@@ -515,21 +543,7 @@ struct acpi_device *acpi_companion_match(const struct device *dev)
 	if (list_empty(&adev->pnp.ids))
 		return NULL;
 
-	physical_node_lock = &adev->physical_node_lock;
-	mutex_lock(physical_node_lock);
-	if (list_empty(&adev->physical_node_list)) {
-		adev = NULL;
-	} else {
-		const struct acpi_device_physical_node *node;
-
-		node = list_first_entry(&adev->physical_node_list,
-					struct acpi_device_physical_node, node);
-		if (node->dev != dev)
-			adev = NULL;
-	}
-	mutex_unlock(physical_node_lock);
-
-	return adev;
+	return acpi_device_is_first_physical_node(adev, dev) ? adev : NULL;
 }
 
 /**
-- 
2.4.6

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
