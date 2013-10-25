From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] PowerCap: Replace dev_attrs with dev_groups
Date: Fri, 25 Oct 2013 15:14:15 -0700
Message-ID: <1382739255-25134-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:33068 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751487Ab3JYWOf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Oct 2013 18:14:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: broonie@kernel.org, rdunlap@infradead.org, rafael.j.wysocki@intel.com, jacob.jun.pan@linux.intel.com, thierry.reding@gmail.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

struct class no longer contains dev_attrs field. Replace dev_attrs
with dev_groups field.
This caused compile error on latest linux-next tree.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/powercap/powercap_sys.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/powercap/powercap_sys.c b/drivers/powercap/powercap_sys.c
index c22fa4c..af07211 100644
--- a/drivers/powercap/powercap_sys.c
+++ b/drivers/powercap/powercap_sys.c
@@ -471,17 +471,18 @@ static ssize_t enabled_store(struct device *dev,
 
 	return -ENOSYS;
 }
+static DEVICE_ATTR_RW(enabled);
 
-static struct device_attribute powercap_def_attrs[] = {
-		__ATTR(enabled, S_IWUSR | S_IRUGO, enabled_show,
-							enabled_store),
-		__ATTR_NULL
+static struct attribute *powercap_dev_attrs[] = {
+	&dev_attr_enabled.attr,
+	NULL
 };
+ATTRIBUTE_GROUPS(powercap_dev);
 
 static struct class powercap_class = {
 	.name = "powercap",
 	.dev_release = powercap_release,
-	.dev_attrs = powercap_def_attrs,
+	.dev_groups = powercap_dev_groups,
 };
 
 struct powercap_zone *powercap_register_zone(
-- 
1.8.3.1
