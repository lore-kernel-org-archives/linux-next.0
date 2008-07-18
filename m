From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Fri, 18 Jul 2008 11:31:34 +1000
Message-ID: <20080718113134.053ffd1a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50201 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753517AbYGRBbh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 21:31:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/usb/core/driver.c: In function 'do_unbind_rebind':
drivers/usb/core/driver.c:865: error: 'struct dev_pm_info' has no member named 'sleeping'

I have been carrying the patch below and applying it after the pci tree
merge for some time now.  I am not sure if this is the correct fix but it
now needs to be applied after the usb tree is merged.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 415f4b3e7d47ae060f365fe640d229f071b8d44e Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Jul 2008 14:10:53 +1000
Subject: [PATCH] pci: usb fixup 1

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/core/driver.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 21254cb..ddb54e1 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -862,7 +862,7 @@ static void do_unbind_rebind(struct usb_device *udev, int action)
 	 * complete() callback.  Until that is implemented, we have to
 	 * use this hack.
 	 */
-					intf->dev.power.sleeping = 0;
+//					intf->dev.power.sleeping = 0;
 
 					usb_rebind_intf(intf);
 				}
-- 
1.5.6
