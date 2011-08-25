From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hid tree with the Linus' tree
Date: Thu, 25 Aug 2011 12:00:30 +1000
Message-ID: <20110825120030.275c598b6a25a78b84405b09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37055 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751791Ab1HYCAj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Aug 2011 22:00:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Bastone <dan@pwienterprises.com>

Hi Jiri,

Today's linux-next merge of the hid tree got a conflict in
drivers/hid/hid-core.c drivers/hid/hid-ids.h between commit 4a4c879904aa
("HID: add support for new revision of Apple aluminum keyboard") from
Linus' tree and commit f6f554f09c5b ("HID: add MacBookAir4,2 to
hid_have_special_driver[]") from the hid tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/hid/hid-core.c
index 242353d,ed0cd09..0000000
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@@ -1340,9 -1356,9 +1356,12 @@@ static const struct hid_device_id hid_h
  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_ANSI) },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_ISO) },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_JIS) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6_ANSI) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6_ISO) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6_JIS) },
 +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI) },
 +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO) },
 +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_JIS) },
  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI) },
  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO) },
  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS) },
diff --cc drivers/hid/hid-ids.h
index 7d27d2b,171ea8e..0000000
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@@ -109,9 -109,9 +109,12 @@@
  #define USB_DEVICE_ID_APPLE_WELLSPRING5_ANSI	0x0245
  #define USB_DEVICE_ID_APPLE_WELLSPRING5_ISO	0x0246
  #define USB_DEVICE_ID_APPLE_WELLSPRING5_JIS	0x0247
+ #define USB_DEVICE_ID_APPLE_WELLSPRING6_ANSI	0x024c
+ #define USB_DEVICE_ID_APPLE_WELLSPRING6_ISO	0x024d
+ #define USB_DEVICE_ID_APPLE_WELLSPRING6_JIS	0x024e
 +#define USB_DEVICE_ID_APPLE_ALU_REVB_ANSI	0x024f
 +#define USB_DEVICE_ID_APPLE_ALU_REVB_ISO	0x0250
 +#define USB_DEVICE_ID_APPLE_ALU_REVB_JIS	0x0251
  #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI  0x0239
  #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO   0x023a
  #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS   0x023b
