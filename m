From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hid tree
Date: Mon, 25 Aug 2008 14:26:31 +1000
Message-ID: <20080825142631.3171068e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47263 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750704AbYHYE0h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 00:26:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Jiri,

Today's linux-next merge of the hid tree got a conflict in
drivers/hid/usbhid/hid-core.c between commit
42c057049eb3ca9bad38fb0acc6290771a11d9ff ("USB: remove warn() macro from
usb.h") from the usb tree and commit
128fc1f24bbb042b8d586dfba4db9ee7caac52bd ("HID: indent switches/cases")
from the hid tree.

I did the obvious fixups (see below).

Jiri, you should be able to apply the appropriate part of Greg's patch to
your tree as it only depends on stuff that is already in Linus' tree.  I
have added that partial patch below. (Greg, do you want to Sign-off on
that, please?)  (I don't mind if the patch is in both trees - Greg you
might consider breaking up those warn() and info() (and err()?) removal
patches and sending them to the appropriate maintainers.)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

Merge fixup result:

diff --cc drivers/hid/usbhid/hid-core.c
index c018347,4ec10aa..0000000
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@@ -197,32 -189,31 +189,32 @@@ static void hid_irq_in(struct urb *urb
  	int			status;
  
  	switch (urb->status) {
- 		case 0:			/* success */
- 			usbhid->retry_delay = 0;
- 			hid_input_report(urb->context, HID_INPUT_REPORT,
- 					 urb->transfer_buffer,
- 					 urb->actual_length, 1);
- 			break;
- 		case -EPIPE:		/* stall */
- 			clear_bit(HID_IN_RUNNING, &usbhid->iofl);
- 			set_bit(HID_CLEAR_HALT, &usbhid->iofl);
- 			schedule_work(&usbhid->reset_work);
- 			return;
- 		case -ECONNRESET:	/* unlink */
- 		case -ENOENT:
- 		case -ESHUTDOWN:	/* unplug */
- 			clear_bit(HID_IN_RUNNING, &usbhid->iofl);
- 			return;
- 		case -EILSEQ:		/* protocol error or unplug */
- 		case -EPROTO:		/* protocol error or unplug */
- 		case -ETIME:		/* protocol error or unplug */
- 		case -ETIMEDOUT:	/* Should never happen, but... */
- 			clear_bit(HID_IN_RUNNING, &usbhid->iofl);
- 			hid_io_error(hid);
- 			return;
- 		default:		/* error */
- 			dev_warn(&urb->dev->dev, "input irq status %d "
- 				 "received\n", urb->status);
+ 	case 0:			/* success */
+ 		usbhid->retry_delay = 0;
+ 		hid_input_report(urb->context, HID_INPUT_REPORT,
+ 				 urb->transfer_buffer,
+ 				 urb->actual_length, 1);
+ 		break;
+ 	case -EPIPE:		/* stall */
+ 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
+ 		set_bit(HID_CLEAR_HALT, &usbhid->iofl);
+ 		schedule_work(&usbhid->reset_work);
+ 		return;
+ 	case -ECONNRESET:	/* unlink */
+ 	case -ENOENT:
+ 	case -ESHUTDOWN:	/* unplug */
+ 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
+ 		return;
+ 	case -EILSEQ:		/* protocol error or unplug */
+ 	case -EPROTO:		/* protocol error or unplug */
+ 	case -ETIME:		/* protocol error or unplug */
+ 	case -ETIMEDOUT:	/* Should never happen, but... */
+ 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
+ 		hid_io_error(hid);
+ 		return;
+ 	default:		/* error */
 -		warn("input irq status %d received", urb->status);
++		dev_warn(&urb->dev->dev, "input irq status %d "
++			 "received\n", urb->status);
  	}
  
  	status = usb_submit_urb(urb, GFP_ATOMIC);
@@@ -320,18 -311,17 +312,18 @@@ static void hid_irq_out(struct urb *urb
  	int unplug = 0;
  
  	switch (urb->status) {
- 		case 0:			/* success */
- 			break;
- 		case -ESHUTDOWN:	/* unplug */
- 			unplug = 1;
- 		case -EILSEQ:		/* protocol error or unplug */
- 		case -EPROTO:		/* protocol error or unplug */
- 		case -ECONNRESET:	/* unlink */
- 		case -ENOENT:
- 			break;
- 		default:		/* error */
- 			dev_warn(&urb->dev->dev, "output irq status %d "
- 				 "received\n", urb->status);
+ 	case 0:			/* success */
+ 		break;
+ 	case -ESHUTDOWN:	/* unplug */
+ 		unplug = 1;
+ 	case -EILSEQ:		/* protocol error or unplug */
+ 	case -EPROTO:		/* protocol error or unplug */
+ 	case -ECONNRESET:	/* unlink */
+ 	case -ENOENT:
+ 		break;
+ 	default:		/* error */
 -		warn("output irq status %d received", urb->status);
++		dev_warn(&urb->dev->dev, "output irq status %d "
++			 "received\n", urb->status);
  	}
  
  	spin_lock_irqsave(&usbhid->outlock, flags);
@@@ -369,22 -359,22 +361,23 @@@ static void hid_ctrl(struct urb *urb
  	spin_lock_irqsave(&usbhid->ctrllock, flags);
  
  	switch (urb->status) {
- 		case 0:			/* success */
- 			if (usbhid->ctrl[usbhid->ctrltail].dir == USB_DIR_IN)
- 				hid_input_report(urb->context, usbhid->ctrl[usbhid->ctrltail].report->type,
- 						urb->transfer_buffer, urb->actual_length, 0);
- 			break;
- 		case -ESHUTDOWN:	/* unplug */
- 			unplug = 1;
- 		case -EILSEQ:		/* protocol error or unplug */
- 		case -EPROTO:		/* protocol error or unplug */
- 		case -ECONNRESET:	/* unlink */
- 		case -ENOENT:
- 		case -EPIPE:		/* report not available */
- 			break;
- 		default:		/* error */
- 			dev_warn(&urb->dev->dev, "ctrl urb status %d "
- 				 "received\n", urb->status);
+ 	case 0:			/* success */
+ 		if (usbhid->ctrl[usbhid->ctrltail].dir == USB_DIR_IN)
+ 			hid_input_report(urb->context,
+ 				usbhid->ctrl[usbhid->ctrltail].report->type,
+ 				urb->transfer_buffer, urb->actual_length, 0);
+ 		break;
+ 	case -ESHUTDOWN:	/* unplug */
+ 		unplug = 1;
+ 	case -EILSEQ:		/* protocol error or unplug */
+ 	case -EPROTO:		/* protocol error or unplug */
+ 	case -ECONNRESET:	/* unlink */
+ 	case -ENOENT:
+ 	case -EPIPE:		/* report not available */
+ 		break;
+ 	default:		/* error */
 -		warn("ctrl urb status %d received", urb->status);
++		dev_warn(&urb->dev->dev, "ctrl urb status %d "
++			 "received\n", urb->status);
  	}
  
  	if (unplug)

Greg's partial patch:

From: Greg Kroah-Hartman <gregkh@suse.de>

USB/hid-core: remove warn() macro from usb.h
    
USB should not be having it's own printk macros, so remove warn() and
use the system-wide standard of dev_warn() wherever possible.  In the
few places that will not work out, use a basic printk().

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 27fe4d8..1096502 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -221,7 +221,8 @@ static void hid_irq_in(struct urb *urb)
 			hid_io_error(hid);
 			return;
 		default:		/* error */
-			warn("input irq status %d received", urb->status);
+			dev_warn(&urb->dev->dev, "input irq status %d "
+				 "received\n", urb->status);
 	}
 
 	status = usb_submit_urb(urb, GFP_ATOMIC);
@@ -329,7 +330,8 @@ static void hid_irq_out(struct urb *urb)
 		case -ENOENT:
 			break;
 		default:		/* error */
-			warn("output irq status %d received", urb->status);
+			dev_warn(&urb->dev->dev, "output irq status %d "
+				 "received\n", urb->status);
 	}
 
 	spin_lock_irqsave(&usbhid->outlock, flags);
@@ -381,7 +383,8 @@ static void hid_ctrl(struct urb *urb)
 		case -EPIPE:		/* report not available */
 			break;
 		default:		/* error */
-			warn("ctrl urb status %d received", urb->status);
+			dev_warn(&urb->dev->dev, "ctrl urb status %d "
+				 "received\n", urb->status);
 	}
 
 	if (unplug)
@@ -418,7 +421,7 @@ void usbhid_submit_report(struct hid_device *hid, struct hid_report *report, uns
 
 		if ((head = (usbhid->outhead + 1) & (HID_OUTPUT_FIFO_SIZE - 1)) == usbhid->outtail) {
 			spin_unlock_irqrestore(&usbhid->outlock, flags);
-			warn("output queue full");
+			dev_warn(hid->dev, "output queue full\n");
 			return;
 		}
 
@@ -437,7 +440,7 @@ void usbhid_submit_report(struct hid_device *hid, struct hid_report *report, uns
 
 	if ((head = (usbhid->ctrlhead + 1) & (HID_CONTROL_FIFO_SIZE - 1)) == usbhid->ctrltail) {
 		spin_unlock_irqrestore(&usbhid->ctrllock, flags);
-		warn("control queue full");
+		dev_warn(hid->dev, "control queue full\n");
 		return;
 	}
 
@@ -465,7 +468,7 @@ static int usb_hidinput_input_event(struct input_dev *dev, unsigned int type, un
 		return -1;
 
 	if ((offset = hidinput_find_field(hid, type, code, &field)) == -1) {
-		warn("event field not found");
+		dev_warn(&dev->dev, "event field not found\n");
 		return -1;
 	}
 
@@ -568,7 +571,7 @@ void usbhid_init_reports(struct hid_device *hid)
 	}
 
 	if (err)
-		warn("timeout initializing reports");
+		dev_warn(hid->dev, "timeout initializing reports\n");
 }
 
 /*
