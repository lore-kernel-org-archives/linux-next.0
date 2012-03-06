From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: [PATCH] staging:iio: Fix compile error without CONFIG_DEBUG_FS
Date: Tue,  6 Mar 2012 20:43:45 +0100
Message-ID: <1331063025-25242-1-git-send-email-lars@metafoo.de>
References: <4F565CB0.8070301@xenotime.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F565CB0.8070301-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

commit e553f182d ("staging: iio: core: Introduce debugfs support, add support
for direct register access") added a '#if defined(CONFIG_DEBUG_FS)' around
iio_read_channel_ext_info and iio_write_channel_ext_info causing the following
compile error if CONFIG_DEBUG_FS is not defined.

	drivers/staging/iio/industrialio-core.c:621:11: error: 'iio_read_channel_ext_info' undeclared (first use in this function)
	drivers/staging/iio/industrialio-core.c:623:11: error: 'iio_write_channel_ext_info' undeclared (first use in this function)

This patch fixes the issue by moving the functions out of the '#if
defined(CONFIG_DEBUG_FS)' section again.

Reported-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Signed-off-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
---
 drivers/staging/iio/industrialio-core.c |   54 +++++++++++++++---------------
 1 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/iio/industrialio-core.c b/drivers/staging/iio/industrialio-core.c
index 27695df..d303bfb 100644
--- a/drivers/staging/iio/industrialio-core.c
+++ b/drivers/staging/iio/industrialio-core.c
@@ -227,33 +227,6 @@ static void iio_device_unregister_debugfs(struct iio_dev *indio_dev)
 	debugfs_remove_recursive(indio_dev->debugfs_dentry);
 }
 
-static ssize_t iio_read_channel_ext_info(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf)
-{
-	struct iio_dev *indio_dev = dev_get_drvdata(dev);
-	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
-	const struct iio_chan_spec_ext_info *ext_info;
-
-	ext_info = &this_attr->c->ext_info[this_attr->address];
-
-	return ext_info->read(indio_dev, this_attr->c, buf);
-}
-
-static ssize_t iio_write_channel_ext_info(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-					 size_t len)
-{
-	struct iio_dev *indio_dev = dev_get_drvdata(dev);
-	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
-	const struct iio_chan_spec_ext_info *ext_info;
-
-	ext_info = &this_attr->c->ext_info[this_attr->address];
-
-	return ext_info->write(indio_dev, this_attr->c, buf, len);
-}
-
 static int iio_device_register_debugfs(struct iio_dev *indio_dev)
 {
 	struct dentry *d;
@@ -297,6 +270,33 @@ static void iio_device_unregister_debugfs(struct iio_dev *indio_dev)
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static ssize_t iio_read_channel_ext_info(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
+	const struct iio_chan_spec_ext_info *ext_info;
+
+	ext_info = &this_attr->c->ext_info[this_attr->address];
+
+	return ext_info->read(indio_dev, this_attr->c, buf);
+}
+
+static ssize_t iio_write_channel_ext_info(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf,
+					 size_t len)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
+	const struct iio_chan_spec_ext_info *ext_info;
+
+	ext_info = &this_attr->c->ext_info[this_attr->address];
+
+	return ext_info->write(indio_dev, this_attr->c, buf, len);
+}
+
 static ssize_t iio_read_channel_info(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
-- 
1.7.2.5
