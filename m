From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [PATCH] stm class: Use per-attribute show and store methods in configfs policy
Date: Wed,  7 Oct 2015 15:27:02 +0300
Message-ID: <1444220822-29530-1-git-send-email-alexander.shishkin@linux.intel.com>
References: <20151007144932.3e68e0f7@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59430 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751572AbbJGM2U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 08:28:20 -0400
In-Reply-To: <20151007144932.3e68e0f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, nab@linux-iscsi.org, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Alexander Shishkin <alexander.shishkin@linux.intel.com>

Since commit f9b2efa6dc ("Christoph Hellwig configfs: add show and store
methods to struct configfs_attribute"), there's no need to keep an extra
wrapper structure per item and the awkward show_attribute/store_attribute
item ops are no longer needed.

This patch converts policy code to the new api, all the while making the
code quite a bit smaller and easier on the eyes.

Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 drivers/hwtracing/stm/policy.c | 105 ++++++++++-------------------------------
 1 file changed, 24 insertions(+), 81 deletions(-)

diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/policy.c
index 6498a9dbb7..11ab6d01ad 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -76,9 +76,10 @@ to_stp_policy_node(struct config_item *item)
 		NULL;
 }
 
-static ssize_t stp_policy_node_masters_show(struct stp_policy_node *policy_node,
-					    char *page)
+static ssize_t
+stp_policy_node_masters_show(struct config_item *item, char *page)
 {
+	struct stp_policy_node *policy_node = to_stp_policy_node(item);
 	ssize_t count;
 
 	count = sprintf(page, "%u %u\n", policy_node->first_master,
@@ -88,9 +89,10 @@ static ssize_t stp_policy_node_masters_show(struct stp_policy_node *policy_node,
 }
 
 static ssize_t
-stp_policy_node_masters_store(struct stp_policy_node *policy_node,
-			      const char *page, size_t count)
+stp_policy_node_masters_store(struct config_item *item, const char *page,
+			      size_t count)
 {
+	struct stp_policy_node *policy_node = to_stp_policy_node(item);
 	unsigned int first, last;
 	struct stm_device *stm;
 	char *p = (char *)page;
@@ -123,8 +125,9 @@ unlock:
 }
 
 static ssize_t
-stp_policy_node_channels_show(struct stp_policy_node *policy_node, char *page)
+stp_policy_node_channels_show(struct config_item *item, char *page)
 {
+	struct stp_policy_node *policy_node = to_stp_policy_node(item);
 	ssize_t count;
 
 	count = sprintf(page, "%u %u\n", policy_node->first_channel,
@@ -134,9 +137,10 @@ stp_policy_node_channels_show(struct stp_policy_node *policy_node, char *page)
 }
 
 static ssize_t
-stp_policy_node_channels_store(struct stp_policy_node *policy_node,
-			       const char *page, size_t count)
+stp_policy_node_channels_store(struct config_item *item, const char *page,
+			       size_t count)
 {
+	struct stp_policy_node *policy_node = to_stp_policy_node(item);
 	unsigned int first, last;
 	struct stm_device *stm;
 	char *p = (char *)page;
@@ -171,71 +175,16 @@ static void stp_policy_node_release(struct config_item *item)
 	kfree(to_stp_policy_node(item));
 }
 
-struct stp_policy_node_attribute {
-	struct configfs_attribute	attr;
-	ssize_t (*show)(struct stp_policy_node *, char *);
-	ssize_t (*store)(struct stp_policy_node *, const char *, size_t);
-};
-
-static ssize_t stp_policy_node_attr_show(struct config_item *item,
-					 struct configfs_attribute *attr,
-					 char *page)
-{
-	struct stp_policy_node *policy_node = to_stp_policy_node(item);
-	struct stp_policy_node_attribute *pn_attr =
-		container_of(attr, struct stp_policy_node_attribute, attr);
-	ssize_t count = 0;
-
-	if (pn_attr->show)
-		count = pn_attr->show(policy_node, page);
-
-	return count;
-}
-
-static ssize_t stp_policy_node_attr_store(struct config_item *item,
-					  struct configfs_attribute *attr,
-					  const char *page, size_t len)
-{
-	struct stp_policy_node *policy_node = to_stp_policy_node(item);
-	struct stp_policy_node_attribute *pn_attr =
-		container_of(attr, struct stp_policy_node_attribute, attr);
-	ssize_t count = -EINVAL;
-
-	if (pn_attr->store)
-		count = pn_attr->store(policy_node, page, len);
-
-	return count;
-}
-
 static struct configfs_item_operations stp_policy_node_item_ops = {
 	.release		= stp_policy_node_release,
-	.show_attribute		= stp_policy_node_attr_show,
-	.store_attribute	= stp_policy_node_attr_store,
 };
 
-static struct stp_policy_node_attribute stp_policy_node_attr_range = {
-	.attr	= {
-		.ca_owner = THIS_MODULE,
-		.ca_name = "masters",
-		.ca_mode = S_IRUGO | S_IWUSR,
-	},
-	.show	= stp_policy_node_masters_show,
-	.store	= stp_policy_node_masters_store,
-};
-
-static struct stp_policy_node_attribute stp_policy_node_attr_channels = {
-	.attr	= {
-		.ca_owner = THIS_MODULE,
-		.ca_name = "channels",
-		.ca_mode = S_IRUGO | S_IWUSR,
-	},
-	.show	= stp_policy_node_channels_show,
-	.store	= stp_policy_node_channels_store,
-};
+CONFIGFS_ATTR(stp_policy_node_, masters);
+CONFIGFS_ATTR(stp_policy_node_, channels);
 
 static struct configfs_attribute *stp_policy_node_attrs[] = {
-	&stp_policy_node_attr_range.attr,
-	&stp_policy_node_attr_channels.attr,
+	&stp_policy_node_attr_masters,
+	&stp_policy_node_attr_channels,
 	NULL,
 };
 
@@ -298,20 +247,8 @@ static struct config_item_type stp_policy_node_type = {
 /*
  * Root group: policies.
  */
-static struct configfs_attribute stp_policy_attr_device = {
-	.ca_owner = THIS_MODULE,
-	.ca_name = "device",
-	.ca_mode = S_IRUGO,
-};
-
-static struct configfs_attribute *stp_policy_attrs[] = {
-	&stp_policy_attr_device,
-	NULL,
-};
-
-static ssize_t stp_policy_attr_show(struct config_item *item,
-				    struct configfs_attribute *attr,
-				    char *page)
+static ssize_t stp_policy_device_show(struct config_item *item,
+				      char *page)
 {
 	struct stp_policy *policy = to_stp_policy(item);
 	ssize_t count;
@@ -324,6 +261,13 @@ static ssize_t stp_policy_attr_show(struct config_item *item,
 	return count;
 }
 
+CONFIGFS_ATTR_RO(stp_policy_, device);
+
+static struct configfs_attribute *stp_policy_attrs[] = {
+	&stp_policy_attr_device,
+	NULL,
+};
+
 void stp_policy_unbind(struct stp_policy *policy)
 {
 	struct stm_device *stm = policy->stm;
@@ -350,7 +294,6 @@ static void stp_policy_release(struct config_item *item)
 
 static struct configfs_item_operations stp_policy_item_ops = {
 	.release		= stp_policy_release,
-	.show_attribute		= stp_policy_attr_show,
 };
 
 static struct configfs_group_operations stp_policy_group_ops = {
-- 
2.5.3
