From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb.current tree build failure
Date: Fri, 1 Aug 2008 11:20:21 +1000
Message-ID: <20080801112021.547dfaea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46971 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751973AbYHABUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2008 21:20:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/built-in.o: In function `.usb_reset_device':
(.text+0x1bfeb4): undefined reference to `.usb_forced_unbind_intf'
drivers/built-in.o: In function `.usb_reset_device':
(.text+0x1c03b8): undefined reference to `.usb_rebind_intf'

Caused by commit 78d9a487ee961c356e1a934d9a92eca38ffb3a70 ("USB: Force
unbinding of drivers lacking reset_resume or other methods").

The above config has CONFIG_USB=y and CONFIG_PM not set.

I applied the following (probably incorrect) patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 1 Aug 2008 11:17:39 +1000
Subject: [PATCH] usb: two more functions are needed when CONFIG_PM is not set

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/core/driver.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 6618bc8..2be37fe 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -774,8 +774,6 @@ void usb_deregister(struct usb_driver *driver)
 }
 EXPORT_SYMBOL_GPL(usb_deregister);
 
-#ifdef CONFIG_PM
-
 /* Forced unbinding of a USB interface driver, either because
  * it doesn't support pre_reset/post_reset/reset_resume or
  * because it doesn't support suspend/resume.
@@ -822,6 +820,8 @@ void usb_rebind_intf(struct usb_interface *intf)
 		dev_warn(&intf->dev, "rebind failed: %d\n", rc);
 }
 
+#ifdef CONFIG_PM
+
 #define DO_UNBIND	0
 #define DO_REBIND	1
 
-- 
1.5.6.3
