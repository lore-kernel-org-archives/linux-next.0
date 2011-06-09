From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Thu, 9 Jun 2011 16:58:04 +1000
Message-ID: <20110609165804.2e96bb77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48689 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752633Ab1FIG6I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jun 2011 02:58:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arjan Mels <arjan.mels@gmx.net>, matt mooney <mfm@muteddisk.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/usbip/stub_dev.c between commit d3ac07788017 ("staging:
usbip: bugfix prevent driver unbind") from the staging.current tree and
commit d012c2a5aca1 ("staging: usbip: stub_dev.c: move stub_driver
definition and update driver name") from the staging tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/usbip/stub_dev.c
index 8cbea42,e26b2ee..0000000
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@@ -546,19 -524,9 +524,28 @@@ static void stub_disconnect(struct usb_
  	}
  }
  
 +/* 
 + * Presence of pre_reset and post_reset prevents the driver from being unbound
 + * when the device is being reset
 + */
 + 
 +int stub_pre_reset(struct usb_interface *interface)
 +{
 +	dev_dbg(&interface->dev, "pre_reset\n");
 +	return 0;
 +}
 +
 +int stub_post_reset(struct usb_interface *interface)
 +{
 +	dev_dbg(&interface->dev, "post_reset\n");
 +	return 0;
 +}
++
+ struct usb_driver stub_driver = {
+ 	.name		= "usbip-host",
+ 	.probe		= stub_probe,
+ 	.disconnect	= stub_disconnect,
+ 	.id_table	= stub_table,
++	.pre_reset	= stub_pre_reset,
++	.post_reset	= stub_post_reset,
+ };
