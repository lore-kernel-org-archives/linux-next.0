From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 15:09:53 +0100
Message-ID: <20080701150953.7c349271@lxorguk.ukuu.org.uk>
References: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:55741 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757188AbYGAO1w (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 10:27:52 -0400
In-Reply-To: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Tue, 1 Jul 2008 22:43:00 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/keyspan_pda.c between commit
> c81a074df394cba95767e7a8c2bf50c0ba1efd0e ("keyspan_pda: use
> request_firmware()") from the firmware tree and commit
> 657f03fb0d6fa2ceb2c7d5417e7fd8a66df6e028 ("52-tty-tidy-usb-keyspan-pda")
> from the ttydev tree.
> 
> Same as for keyspan.c.

David - I think this is what you need to make your firmware tree fit on
top of the ttydev tree

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 8c7dc40..707fdcb 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -105,6 +105,8 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
+#include <linux/firmware.h>
+#include <linux/ihex.h>
 #include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
@@ -1340,8 +1342,9 @@ static void keyspan_close(struct tty_struct *tty,
 static int keyspan_fake_startup(struct usb_serial *serial)
 {
 	int 				response;
-	const struct ezusb_hex_record 	*record;
+	const struct ihex_binrec 	*record;
 	char				*fw_name;
+	const struct firmware		*fw;
 
 	dbg("Keyspan startup version %04x product %04x",
 	    le16_to_cpu(serial->dev->descriptor.bcdDevice),
@@ -1356,72 +1359,60 @@ static int keyspan_fake_startup(struct usb_serial *serial)
 		/* Select firmware image on the basis of idProduct */
 	switch (le16_to_cpu(serial->dev->descriptor.idProduct)) {
 	case keyspan_usa28_pre_product_id:
-		record = &keyspan_usa28_firmware[0];
-		fw_name = "USA28";
+		fw_name = "keyspan/usa28.fw";
 		break;
 
 	case keyspan_usa28x_pre_product_id:
-		record = &keyspan_usa28x_firmware[0];
-		fw_name = "USA28X";
+		fw_name = "keyspan/usa28x.fw";
 		break;
 
 	case keyspan_usa28xa_pre_product_id:
-		record = &keyspan_usa28xa_firmware[0];
-		fw_name = "USA28XA";
+		fw_name = "keyspan/usa28xa.fw";
 		break;
 
 	case keyspan_usa28xb_pre_product_id:
-		record = &keyspan_usa28xb_firmware[0];
-		fw_name = "USA28XB";
+		fw_name = "keyspan/usa28xb.fw";
 		break;
 
 	case keyspan_usa19_pre_product_id:
-		record = &keyspan_usa19_firmware[0];
-		fw_name = "USA19";
+		fw_name = "keyspan/usa19.fw";
 		break;
 
 	case keyspan_usa19qi_pre_product_id:
-		record = &keyspan_usa19qi_firmware[0];
-		fw_name = "USA19QI";
+		fw_name = "keyspan/usa19qi.fw";
 		break;
 
 	case keyspan_mpr_pre_product_id:
-		record = &keyspan_mpr_firmware[0];
-		fw_name = "MPR";
+		fw_name = "keyspan/mpr.fw";
 		break;
 
 	case keyspan_usa19qw_pre_product_id:
-		record = &keyspan_usa19qw_firmware[0];
-		fw_name = "USA19QI";
+		fw_name = "keyspan/usa19qw.fw";
 		break;
 
 	case keyspan_usa18x_pre_product_id:
-		record = &keyspan_usa18x_firmware[0];
-		fw_name = "USA18X";
+		fw_name = "keyspan/usa18x.fw";
 		break;
 
 	case keyspan_usa19w_pre_product_id:
-		record = &keyspan_usa19w_firmware[0];
-		fw_name = "USA19W";
+		fw_name = "keyspan/usa19w.fw";
 		break;
 
 	case keyspan_usa49w_pre_product_id:
-		record = &keyspan_usa49w_firmware[0];
-		fw_name = "USA49W";
+		fw_name = "keyspan/usa49w.fw";
 		break;
 
 	case keyspan_usa49wlc_pre_product_id:
-		record = &keyspan_usa49wlc_firmware[0];
-		fw_name = "USA49WLC";
+		fw_name = "keyspan/usa49wlc.fw";
 		break;
 
 	default:
-		record = NULL;
-		fw_name = "Unknown";
-		break;
+		dev_err(&serial->dev->dev, "Unknown product ID (%04x)\n",
+			le16_to_cpu(serial->dev->descriptor.idProduct));
+		return 1;
 	}
 
-	if (record == NULL) {
+	if (request_ihex_firmware(&fw, fw_name, &serial->dev->dev)) {
 		dev_err(&serial->dev->dev,
 			"Required keyspan firmware image (%s) unavailable.\n",
 								fw_name);
@@ -1433,22 +1424,24 @@ static int keyspan_fake_startup(struct usb_serial *serial)
 		/* download the firmware image */
 	response = ezusb_set_reset(serial, 1);
 
-	while (record->address != 0xffff) {
-		response = ezusb_writememory(serial, record->address,
+	record = (const struct ihex_binrec *)fw->data;
+
+	while (record) {
+		response = ezusb_writememory(serial, be32_to_cpu(record->addr),
 					     (unsigned char *)record->data,
-					     record->data_size, 0xa0);
+					     be16_to_cpu(record->len), 0xa0);
 		if (response < 0) {
 			dev_err(&serial->dev->dev,
 				"ezusb_writememory failed for Keyspan firmware (%d %04X %p %d)\n",
-				response,
-				record->address, record->data,
-				record->data_size);
+				response, be32_to_cpu(record->addr),
+				record->data, be16_to_cpu(record->len));
 			break;
 		}
-		record++;
+		record = ihex_next_binrec(record);
 	}
-		/* bring device out of reset. Renumeration will occur in a
-		   moment and the new device will bind to the real driver */
+	release_firmware(fw);
+	/* bring device out of reset. Renumeration will occur in a
+	   moment and the new device will bind to the real driver */
 	response = ezusb_set_reset(serial, 0);
 
 	/* we don't want this device to have a driver assigned to it. */
@@ -2747,6 +2740,19 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
+MODULE_FIRMWARE("keyspan/usa28.fw");
+MODULE_FIRMWARE("keyspan/usa28x.fw");
+MODULE_FIRMWARE("keyspan/usa28xa.fw");
+MODULE_FIRMWARE("keyspan/usa28xb.fw");
+MODULE_FIRMWARE("keyspan/usa19.fw");
+MODULE_FIRMWARE("keyspan/usa19qi.fw");
+MODULE_FIRMWARE("keyspan/mpr.fw");
+MODULE_FIRMWARE("keyspan/usa19qw.fw");
+MODULE_FIRMWARE("keyspan/usa18x.fw");
+MODULE_FIRMWARE("keyspan/usa19w.fw");
+MODULE_FIRMWARE("keyspan/usa49w.fw");
+MODULE_FIRMWARE("keyspan/usa49wlc.fw");
+
 module_param(debug, bool, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(debug, "Debug enabled or not");
 

diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index 928f545..ef81071 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -78,18 +78,14 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
+#include <linux/firmware.h>
+#include <linux/ihex.h>
 #include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
 static int debug;
 
-struct ezusb_hex_record {
-	__u16 address;
-	__u8 data_size;
-	__u8 data[16];
-};
-
 /* make a simple define to handle if we are compiling keyspan_pda
    or xircom support */
 #if defined(CONFIG_USB_SERIAL_KEYSPAN_PDA) || defined(CONFIG_USB_SERIAL_KEYSPAN_PDA_MODULE)
@@ -103,14 +99,6 @@ struct ezusb_hex_record {
 	#undef XIRCOM
 #endif
 
-#ifdef KEYSPAN
-#include "keyspan_pda_fw.h"
-#endif
-
-#ifdef XIRCOM
-#include "xircom_pgs_fw.h"
-#endif
-
 /*
  * Version Information
  */
@@ -734,38 +722,47 @@ static void keyspan_pda_close(struct tty_struct *tty,
 static int keyspan_pda_fake_startup(struct usb_serial *serial)
 {
 	int response;
-	const struct ezusb_hex_record *record = NULL;
+	const char *fw_name;
+	const struct ihex_binrec *record;
+	const struct firmware *fw;
 
 	/* download the firmware here ... */
 	response = ezusb_set_reset(serial, 1);
 
+	if (0) { ; }
 #ifdef KEYSPAN
-	if (le16_to_cpu(serial->dev->descriptor.idVendor) == KEYSPAN_VENDOR_ID)
-		record = &keyspan_pda_firmware[0];
+	else if (le16_to_cpu(serial->dev->descriptor.idVendor) == KEYSPAN_VENDOR_ID)
+		fw_name = "keyspan_pda/keyspan_pda.fw";
 #endif
 #ifdef XIRCOM
-	if ((le16_to_cpu(serial->dev->descriptor.idVendor) == XIRCOM_VENDOR_ID) ||
-	    (le16_to_cpu(serial->dev->descriptor.idVendor) == ENTREGRA_VENDOR_ID))
-		record = &xircom_pgs_firmware[0];
+	else if ((le16_to_cpu(serial->dev->descriptor.idVendor) == XIRCOM_VENDOR_ID) ||
+		 (le16_to_cpu(serial->dev->descriptor.idVendor) == ENTREGRA_VENDOR_ID))
+		fw_name = "keyspan_pda/xircom_pgs.fw";
 #endif
-	if (record == NULL) {
+	else {
 		err("%s: unknown vendor, aborting.", __func__);
 		return -ENODEV;
 	}
+	if (request_ihex_firmware(&fw, fw_name, &serial->dev->dev)) {
+		err("failed to load firmware \"%s\"\n", fw_name);
+		return -ENOENT;
+	}
+	record = (const struct ihex_binrec *)fw->data;
 
 	while (record->address != 0xffff) {
 		response = ezusb_writememory(serial, record->address,
 					     (unsigned char *)record->data,
-					     record->data_size, 0xa0);
+					     be16_to_cpu(record->len), 0xa0);
 		if (response < 0) {
 			err("ezusb_writememory failed for Keyspan PDA "
 			    "firmware (%d %04X %p %d)",
-			    response,
-			    record->address, record->data, record->data_size);
+			    response, be32_to_cpu(record->addr),
+			    record->data, be16_to_cpu(record->len));
 			break;
 		}
-		record++;
+		record = ihex_next_binrec(record);
 	}
+	release_firmware(fw);
 	/* bring device out of reset. Renumeration will occur in a moment
 	   and the new device will bind to the real driver */
 	response = ezusb_set_reset(serial, 0);
