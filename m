From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hid tree build failure
Date: Mon, 25 Aug 2008 15:14:49 +1000
Message-ID: <20080825151449.bcb1f766.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56790 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751217AbYHYFOy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 01:14:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>

Hi Jiri, Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/hid/usbhid/hid-core.c: In function 'usbhid_submit_report':
drivers/hid/usbhid/hid-core.c:417: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-core.c:417: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-core.c:436: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-core.c:436: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-core.c: In function 'usbhid_init_reports':
drivers/hid/usbhid/hid-core.c:568: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-core.c:568: error: incompatible type for argument 1 of 'dev_name'

The x86_64 allmod config build also git these:

drivers/hid/usbhid/hid-tmff.c: In function 'hid_tmff_init':
drivers/hid/usbhid/hid-tmff.c:166: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-tmff.c:166: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-tmff.c:172: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-tmff.c:172: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-tmff.c:178: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-tmff.c:178: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-tmff.c:184: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-tmff.c:184: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-tmff.c:206: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-tmff.c:206: error: incompatible type for argument 1 of 'dev_name'
drivers/hid/usbhid/hid-tmff.c:224: error: incompatible type for argument 1 of 'dev_driver_string'
drivers/hid/usbhid/hid-tmff.c:224: error: incompatible type for argument 1 of 'dev_name'

Introduced by commits 42c057049eb3ca9bad38fb0acc6290771a11d9ff ("USB:
remove warn() macro from usb.h") and
ca5f17ab52be0a1bbb2cc06fd127f5aa953b8619 ("USB: remove info() macro from
usb.h") from the usb tree interacting with commit
d9eecf89c2ca548dd102b87113a1145c5bfcdbf2 ("HID: make a bus from hid
code") from the hid tree.  The latter changed the "dev" member of "struct
hid_device" from a "struct device *" to s "struct device".

I applied the following fixup which should be added to the hid tree if
you incorporate Greg's warn() removal patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Aug 2008 14:49:42 +1000
Subject: [PATCH] HID: fix for warn() removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hid/usbhid/hid-core.c |    6 +++---
 drivers/hid/usbhid/hid-tmff.c |   12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 9cc9a75..5f32e30 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -414,7 +414,7 @@ void usbhid_submit_report(struct hid_device *hid, struct hid_report *report, uns
 
 		if ((head = (usbhid->outhead + 1) & (HID_OUTPUT_FIFO_SIZE - 1)) == usbhid->outtail) {
 			spin_unlock_irqrestore(&usbhid->outlock, flags);
-			dev_warn(hid->dev, "output queue full\n");
+			dev_warn(&hid->dev, "output queue full\n");
 			return;
 		}
 
@@ -433,7 +433,7 @@ void usbhid_submit_report(struct hid_device *hid, struct hid_report *report, uns
 
 	if ((head = (usbhid->ctrlhead + 1) & (HID_CONTROL_FIFO_SIZE - 1)) == usbhid->ctrltail) {
 		spin_unlock_irqrestore(&usbhid->ctrllock, flags);
-		dev_warn(hid->dev, "control queue full\n");
+		dev_warn(&hid->dev, "control queue full\n");
 		return;
 	}
 
@@ -565,7 +565,7 @@ void usbhid_init_reports(struct hid_device *hid)
 	}
 
 	if (err)
-		dev_warn(hid->dev, "timeout initializing reports\n");
+		dev_warn(&hid->dev, "timeout initializing reports\n");
 }
 
 /*
diff --git a/drivers/hid/usbhid/hid-tmff.c b/drivers/hid/usbhid/hid-tmff.c
index beccdfb..451a8e6 100644
--- a/drivers/hid/usbhid/hid-tmff.c
+++ b/drivers/hid/usbhid/hid-tmff.c
@@ -163,25 +163,25 @@ int hid_tmff_init(struct hid_device *hid)
 			switch (field->usage[0].hid) {
 			case THRUSTMASTER_USAGE_FF:
 				if (field->report_count < 2) {
-					dev_warn(hid->dev,
+					dev_warn(&hid->dev,
 						 "ignoring FF field with report_count < 2\n");
 					continue;
 				}
 
 				if (field->logical_maximum == field->logical_minimum) {
-					dev_warn(hid->dev,
+					dev_warn(&hid->dev,
 						 "ignoring FF field with logical_maximum == logical_minimum\n");
 					continue;
 				}
 
 				if (tmff->report && tmff->report != report) {
-					dev_warn(hid->dev,
+					dev_warn(&hid->dev,
 						 "ignoring FF field in other report\n");
 					continue;
 				}
 
 				if (tmff->ff_field && tmff->ff_field != field) {
-					dev_warn(hid->dev,
+					dev_warn(&hid->dev,
 						 "ignoring duplicate FF field\n");
 					continue;
 				}
@@ -203,7 +203,7 @@ int hid_tmff_init(struct hid_device *hid)
 				break;
 
 			default:
-				dev_warn(hid->dev,
+				dev_warn(&hid->dev,
 					 "ignoring unknown output usage %08x\n",
 					 field->usage[0].hid);
 				continue;
@@ -221,7 +221,7 @@ int hid_tmff_init(struct hid_device *hid)
 	if (error)
 		goto fail;
 
-	dev_info(hid->dev,
+	dev_info(&hid->dev,
 		 "Force feedback for ThrustMaster devices by Zinx Verituse <zinx@epicsol.org>\n");
 	return 0;
 
-- 
1.5.6.3
