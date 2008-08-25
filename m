From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hid tree
Date: Mon, 25 Aug 2008 14:46:33 +1000
Message-ID: <20080825144633.393096b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49078 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750701AbYHYEqj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 00:46:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Henrik Rydberg <rydberg@euromail.se>, Dmitry Torokhov <dtor@mail.ru>, Jiri Slaby <jirislaby@gmail.com>

Hi Jiri,

Today's linux-next merge of the hid tree got a conflict in
drivers/hid/usbhid/hid-quirks.c between commit
f89bd95c5c946776f116ffeb997653d4193d6a35 ("Input: bcm5974 - add driver
for Macbook Air and Pro Penryn touchpads") from Linus' tree and
commit8216ac91aeff627cc6169df46e0fbb2097716f56 ("HID: move apple quirks")
from the hid tree.

I used the version of that file from the hid tree and then added the
following patch (which may be completely wrong).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 2d0b387..ed43749 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -420,17 +420,17 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ANSI),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN |APPLE_IGNORE_MOUSE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ISO),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_KEYBOARD },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_KEYBOARD |APPLE_IGNORE_MOUSE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_JIS),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN |APPLE_IGNORE_MOUSE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_ANSI),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN |APPLE_IGNORE_MOUSE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_ISO),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_KEYBOARD },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_KEYBOARD |APPLE_IGNORE_MOUSE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_JIS),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN |APPLE_IGNORE_MOUSE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
 			APPLE_IGNORE_MOUSE },
