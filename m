From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the sh tree
Date: Tue, 3 Mar 2009 10:45:33 +1100
Message-ID: <20090303104533.e411cdff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47325 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751451AbZCBXpk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2009 18:45:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Adrian McMenamin <adrian@mcmen.demon.co.uk>, Paul Mundt <lethal@linux-sh.org>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/sh/maple/maple.c between commit
b233b28eac0cc37d07c2d007ea08c86c778c5af4 ("sh: maple: Support block reads
and writes") from the sh tree and commit
f1f93f5605f08a698418e52828bef46973b6a4ec ("sh: struct device - replace
bus_id with dev_name(), dev_set_name()") from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary.

Maybe we could persuade Paul to apply the driver-core patch (not the
patch below)to the sh tree (assuming he has been sent a copy)?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/sh/maple/maple.c
index 4054fe9,7e1257a..0000000
--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@@ -367,10 -423,12 +367,10 @@@ static void maple_attach_driver(struct 
  	if (function > 0x200) {
  		/* Do this silently - as not a real device */
  		function = 0;
 -		mdev->driver = &maple_dummy_driver;
 +		mdev->driver = &maple_unsupported_device;
- 		sprintf(mdev->dev.bus_id, "%d:0.port", mdev->port);
+ 		dev_set_name(&mdev->dev, "%d:0.port", mdev->port);
 +
  	} else {
 -		printk(KERN_INFO
 -			"Maple bus at (%d, %d): Function 0x%lX\n",
 -			mdev->port, mdev->unit, function);
  
  		matched =
  			bus_for_each_drv(&maple_bus_type, NULL, mdev,
@@@ -378,22 -436,21 +378,22 @@@
  
  		if (matched == 0) {
  			/* Driver does not exist yet */
 -			printk(KERN_INFO
 -				"No maple driver found.\n");
 -			mdev->driver = &maple_dummy_driver;
 +			dev_info(&mdev->dev, "no driver found\n");
 +			mdev->driver = &maple_unsupported_device;
  		}
- 		sprintf(mdev->dev.bus_id, "%d:0%d.%lX", mdev->port,
- 			mdev->unit, function);
+ 		dev_set_name(&mdev->dev, "%d:0%d.%lX", mdev->port,
+ 			     mdev->unit, function);
  	}
 +
  	mdev->function = function;
  	mdev->dev.release = &maple_release_device;
 -	retval = device_register(&mdev->dev);
 -	if (retval) {
 -		printk(KERN_INFO
 -		"Maple bus: Attempt to register device"
 -		" (%x, %x) failed.\n",
 -		mdev->port, mdev->unit);
 +
 +	atomic_set(&mdev->busy, 0);
 +	error = device_register(&mdev->dev);
 +	if (error) {
 +		dev_warn(&mdev->dev, "could not register device at"
 +			" (%d, %d), with error 0x%X\n", mdev->unit,
 +			mdev->port, error);
  		maple_free_dev(mdev);
  		mdev = NULL;
  		return;
