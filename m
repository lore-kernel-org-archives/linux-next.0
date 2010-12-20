From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Date: Mon, 20 Dec 2010 16:28:11 +1100
Message-ID: <20101220162811.8c8d8d76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42092 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751572Ab0LTF2X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Dec 2010 00:28:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Belisko <marek.belisko@gmail.com>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/gadget/composite.c between commit
dbb442b85a1d82f91cfe0524c4f9b3a5196a10ca ("Revert "USB: gadget: Allow
function access to device ID data during bind()"") from the usb.current
tree and commit 78bff3c65df33da47e93736bd8847b694084e5a9 ("USB: gadget:
composite: Typo fix") from the usb tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/gadget/composite.c
index 8572dad,21dc0da..0000000
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@@ -1118,15 -1126,7 +1118,15 @@@ static int composite_bind(struct usb_ga
  	cdev->desc = *composite->dev;
  	cdev->desc.bMaxPacketSize0 = gadget->ep0->maxpacket;
  
 +	/* standardized runtime overrides for device ID data */
 +	if (idVendor)
 +		cdev->desc.idVendor = cpu_to_le16(idVendor);
 +	if (idProduct)
 +		cdev->desc.idProduct = cpu_to_le16(idProduct);
 +	if (bcdDevice)
 +		cdev->desc.bcdDevice = cpu_to_le16(bcdDevice);
 +
- 	/* stirng overrides */
+ 	/* string overrides */
  	if (iManufacturer || !cdev->desc.iManufacturer) {
  		if (!iManufacturer && !composite->iManufacturer &&
  		    !*composite_manufacturer)
