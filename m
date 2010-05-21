From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the driver-core tree
Date: Fri, 21 May 2010 16:18:43 +1000
Message-ID: <20100521161843.20e795db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Achatz <erazor_de@users.sourceforge.net>, Jiri Kosina <jikos@jikos.cz>, Chris Wright <chrisw@sous-sol.org>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/hid/hid-roccat-kone.c:694: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:696: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:701: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:703: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:708: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:710: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:715: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:717: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:722: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:724: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:729: warning: initialization from incompatible pointer type
drivers/hid/hid-roccat-kone.c:731: warning: initialization from incompatible pointer type

Introduced by commit 867040163f10f2b52b45bc573f330d6eb28f5914 ("sysfs:
add struct file* to bin_attr callbacks") from the driver-core tree
interacting with commit 14bf62cde79423a02a590e02664ed29a36facec1 ("HID:
add driver for Roccat Kone gaming mouse") from the hid tree.

I added the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 21 May 2010 16:15:32 +1000
Subject: [PATCH] hid: fix hid-roccat-kone for bin_attr API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hid/hid-roccat-kone.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 66e6940..b6371d3 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -263,7 +263,7 @@ static int kone_get_firmware_version(struct usb_device *usb_dev, int *result)
 	return 0;
 }
 
-static ssize_t kone_sysfs_read_settings(struct kobject *kobj,
+static ssize_t kone_sysfs_read_settings(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	struct device *dev = container_of(kobj, struct device, kobj);
@@ -287,7 +287,7 @@ static ssize_t kone_sysfs_read_settings(struct kobject *kobj,
  * This function keeps values in kone_device up to date and assumes that in
  * case of error the old data is still valid
  */
-static ssize_t kone_sysfs_write_settings(struct kobject *kobj,
+static ssize_t kone_sysfs_write_settings(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	struct device *dev = container_of(kobj, struct device, kobj);
@@ -342,31 +342,31 @@ static ssize_t kone_sysfs_read_profilex(struct kobject *kobj,
 	return count;
 }
 
-static ssize_t kone_sysfs_read_profile1(struct kobject *kobj,
+static ssize_t kone_sysfs_read_profile1(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_read_profilex(kobj, attr, buf, off, count, 1);
 }
 
-static ssize_t kone_sysfs_read_profile2(struct kobject *kobj,
+static ssize_t kone_sysfs_read_profile2(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_read_profilex(kobj, attr, buf, off, count, 2);
 }
 
-static ssize_t kone_sysfs_read_profile3(struct kobject *kobj,
+static ssize_t kone_sysfs_read_profile3(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_read_profilex(kobj, attr, buf, off, count, 3);
 }
 
-static ssize_t kone_sysfs_read_profile4(struct kobject *kobj,
+static ssize_t kone_sysfs_read_profile4(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_read_profilex(kobj, attr, buf, off, count, 4);
 }
 
-static ssize_t kone_sysfs_read_profile5(struct kobject *kobj,
+static ssize_t kone_sysfs_read_profile5(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_read_profilex(kobj, attr, buf, off, count, 5);
@@ -404,31 +404,31 @@ static ssize_t kone_sysfs_write_profilex(struct kobject *kobj,
 	return sizeof(struct kone_profile);
 }
 
-static ssize_t kone_sysfs_write_profile1(struct kobject *kobj,
+static ssize_t kone_sysfs_write_profile1(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_write_profilex(kobj, attr, buf, off, count, 1);
 }
 
-static ssize_t kone_sysfs_write_profile2(struct kobject *kobj,
+static ssize_t kone_sysfs_write_profile2(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_write_profilex(kobj, attr, buf, off, count, 2);
 }
 
-static ssize_t kone_sysfs_write_profile3(struct kobject *kobj,
+static ssize_t kone_sysfs_write_profile3(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_write_profilex(kobj, attr, buf, off, count, 3);
 }
 
-static ssize_t kone_sysfs_write_profile4(struct kobject *kobj,
+static ssize_t kone_sysfs_write_profile4(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_write_profilex(kobj, attr, buf, off, count, 4);
 }
 
-static ssize_t kone_sysfs_write_profile5(struct kobject *kobj,
+static ssize_t kone_sysfs_write_profile5(struct file *fp, struct kobject *kobj,
 		struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	return kone_sysfs_write_profilex(kobj, attr, buf, off, count, 5);
-- 
1.7.1


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
