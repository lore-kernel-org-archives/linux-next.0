From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb gadget webcam: depends on VIDEO_DEV
Date: Wed, 5 May 2010 15:46:26 -0700
Message-ID: <20100505154626.2c036f1d.randy.dunlap@oracle.com>
References: <20100505123409.ed5678a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100505123409.ed5678a2.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Brownell <dbrownell@users.sourceforge.net>, gregkh@suse.de
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

g_webcam uses v4l[2] interfaces, so it should depend on VIDEO_DEV.

ERROR: "v4l2_event_unsubscribe" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_event_queue" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "video_device_release" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "video_usercopy" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_event_dequeue" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "video_register_device" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "video_device_alloc" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_event_subscribe" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "video_unregister_device" [drivers/usb/gadget/g_webcam.ko] ndefined!
ERROR: "v4l2_event_pending" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_fh_init" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_event_init" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "video_devdata" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_event_alloc" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_fh_add" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_fh_del" [drivers/usb/gadget/g_webcam.ko] undefined!
ERROR: "v4l2_fh_exit" [drivers/usb/gadget/g_webcam.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/gadget/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100505.orig/drivers/usb/gadget/Kconfig
+++ linux-next-20100505/drivers/usb/gadget/Kconfig
@@ -879,6 +879,7 @@ config USB_G_HID
 # or video class gadget drivers), or specific hardware, here.
 config USB_G_WEBCAM
 	tristate "USB Webcam Gadget"
+	depends on VIDEO_DEV
 	help
 	  The Webcam Gadget acts as a composite USB Audio and Video Class
 	  device. It provides a userspace API to process UVC control requests
