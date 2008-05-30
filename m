From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: dev_set_name (Was: linux-next: rr/driver-core merge conflicts)
Date: Fri, 30 May 2008 10:21:54 +1000
Message-ID: <20080530102154.2f9798a5.sfr@canb.auug.org.au>
References: <20080529155818.6e298a47.sfr@canb.auug.org.au>
	<20080529160944.GA10595@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60872 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752813AbYE3AWE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 20:22:04 -0400
In-Reply-To: <20080529160944.GA10595@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Kay Sievers <kay.sievers@vrfy.org>, linux-next@vger.kernel.org

Hi Greg,

On Thu, 29 May 2008 09:09:44 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Thu, May 29, 2008 at 03:58:18PM +1000, Stephen Rothwell wrote:
> 
> > Greg, is there some way we could add a version of dev_set_name() to
> > current mainline now so that the conversions can be farmed out (or at
> > least be done in other trees destined for linux-next)?
> 
> Yes, I'll do that today, thanks for the idea.

I was hoping for something really simple that even Linus would take -
like below (compile tested only).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From f40fb678c1f10c363297dbfc4c97e913bb7c58a8 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 30 May 2008 10:16:40 +1000
Subject: [PATCH] driver-core: preparte for 2.6.27 api change

Create the dev_set_name function now so that various subsystems can
start changing over to it before other changes in 2.6.27 will make it
compulsory.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/base/core.c    |   15 +++++++++++++++
 include/linux/device.h |    3 +++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 72eccae..422cfca 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -760,6 +760,21 @@ static void device_remove_class_symlinks(struct device *dev)
 }
 
 /**
+ * dev_set_name - set a device name
+ * @dev: device
+ */
+int dev_set_name(struct device *dev, const char *fmt, ...)
+{
+	va_list vargs;
+
+	va_start(vargs, fmt);
+	vsnprintf(dev->bus_id, sizeof(dev->bus_id), fmt, vargs);
+	va_end(vargs);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_set_name);
+
+/**
  * device_add - add device to device hierarchy.
  * @dev: device.
  *
diff --git a/include/linux/device.h b/include/linux/device.h
index 14616e8..6a2d04c 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -385,6 +385,9 @@ static inline const char *dev_name(struct device *dev)
 	return dev->bus_id;
 }
 
+extern int dev_set_name(struct device *dev, const char *name, ...)
+			__attribute__((format(printf, 2, 3)));
+
 #ifdef CONFIG_NUMA
 static inline int dev_to_node(struct device *dev)
 {
-- 
1.5.5.2

