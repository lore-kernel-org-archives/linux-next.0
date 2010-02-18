From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the suspend
 tree
Date: Thu, 18 Feb 2010 19:59:23 +1100
Message-ID: <20100218195923.59e5e9b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32868 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752206Ab0BRI70 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Feb 2010 03:59:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
include/linux/device.h between commits
5a14fb87905e0023a608af8a471097a22fa72f5e ("PM: Asynchronous suspend and
resume of devices") and 1b8647aa4d52c8ee82df3d3018b0fa2830a149a1 ("PM:
Add facility for advanced testing of async suspend/resume") from the
suspend tree and commit 44d58957cf0332f5c9d0f2a05e2919240dd207fc ("Driver
core: create lock/unlock functions for struct device") from the
driver-core tree.

Juts overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/device.h
index b30527d,8891cfb..0000000
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@@ -472,23 -490,21 +490,38 @@@ static inline int device_is_registered(
  	return dev->kobj.state_in_sysfs;
  }
  
 +static inline void device_enable_async_suspend(struct device *dev)
 +{
 +	if (dev->power.status == DPM_ON)
 +		dev->power.async_suspend = true;
 +}
 +
 +static inline void device_disable_async_suspend(struct device *dev)
 +{
 +	if (dev->power.status == DPM_ON)
 +		dev->power.async_suspend = false;
 +}
 +
 +static inline bool device_async_suspend_enabled(struct device *dev)
 +{
 +	return !!dev->power.async_suspend;
 +}
 +
+ static inline void device_lock(struct device *dev)
+ {
+ 	mutex_lock(&dev->mutex);
+ }
+ 
+ static inline int device_trylock(struct device *dev)
+ {
+ 	return mutex_trylock(&dev->mutex);
+ }
+ 
+ static inline void device_unlock(struct device *dev)
+ {
+ 	mutex_unlock(&dev->mutex);
+ }
+ 
  void driver_init(void);
  
  /*
