From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the sh
	tree
Date: Mon, 2 Mar 2009 15:59:26 -0800
Message-ID: <20090302235926.GA2690@kroah.com>
References: <20090303104533.e411cdff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47121 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1759078AbZCCABa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2009 19:01:30 -0500
Content-Disposition: inline
In-Reply-To: <20090303104533.e411cdff.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Adrian McMenamin <adrian@mcmen.demon.co.uk>, Paul Mundt <lethal@linux-sh.org>


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2009 at 10:45:33AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/sh/maple/maple.c between commit
> b233b28eac0cc37d07c2d007ea08c86c778c5af4 ("sh: maple: Support block reads
> and writes") from the sh tree and commit
> f1f93f5605f08a698418e52828bef46973b6a4ec ("sh: struct device - replace
> bus_id with dev_name(), dev_set_name()") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> 
> Maybe we could persuade Paul to apply the driver-core patch (not the
> patch below)to the sh tree (assuming he has been sent a copy)?

I think he was sent a copy, Kay?

Anyway, Paul, here's the patch, could you take this through your tree to
prevent future conflicts?  It should build and work today, no
dependancies on any other patch

thanks,

greg k-h

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bus_id-sh.patch"

From: Kay Sievers <kay.sievers@vrfy.org>
Subject: sh: struct device - replace bus_id with dev_name(), dev_set_name()

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
---
 drivers/sh/maple/maple.c           |    8 ++++----
 drivers/sh/superhyway/superhyway.c |    4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@ -424,7 +424,7 @@ static void maple_attach_driver(struct m
 		/* Do this silently - as not a real device */
 		function = 0;
 		mdev->driver = &maple_dummy_driver;
-		sprintf(mdev->dev.bus_id, "%d:0.port", mdev->port);
+		dev_set_name(&mdev->dev, "%d:0.port", mdev->port);
 	} else {
 		printk(KERN_INFO
 			"Maple bus at (%d, %d): Function 0x%lX\n",
@@ -440,8 +440,8 @@ static void maple_attach_driver(struct m
 				"No maple driver found.\n");
 			mdev->driver = &maple_dummy_driver;
 		}
-		sprintf(mdev->dev.bus_id, "%d:0%d.%lX", mdev->port,
-			mdev->unit, function);
+		dev_set_name(&mdev->dev, "%d:0%d.%lX", mdev->port,
+			     mdev->unit, function);
 	}
 	mdev->function = function;
 	mdev->dev.release = &maple_release_device;
@@ -780,7 +780,7 @@ struct bus_type maple_bus_type = {
 EXPORT_SYMBOL_GPL(maple_bus_type);
 
 static struct device maple_bus = {
-	.bus_id = "maple",
+	.init_name = "maple",
 	.release = maple_bus_release,
 };
 
--- a/drivers/sh/superhyway/superhyway.c
+++ b/drivers/sh/superhyway/superhyway.c
@@ -22,7 +22,7 @@
 static int superhyway_devices;
 
 static struct device superhyway_bus_device = {
-	.bus_id = "superhyway",
+	.init_name = "superhyway",
 };
 
 static void superhyway_device_release(struct device *dev)
@@ -83,7 +83,7 @@ int superhyway_add_device(unsigned long
 	dev->id.id		= dev->vcr.mod_id;
 
 	sprintf(dev->name, "SuperHyway device %04x", dev->id.id);
-	sprintf(dev->dev.bus_id, "%02x", superhyway_devices);
+	dev_set_name(&dev->dev, "%02x", superhyway_devices);
 
 	superhyway_devices++;
 

--NzB8fVQJ5HfG6fxh--
