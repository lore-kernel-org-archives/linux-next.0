From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH -next] usb gadget: fix langwell_udc.c build error
Date: Fri, 07 Oct 2011 13:57:42 -0700
Message-ID: <4E8F67C6.5020603@xenotime.net>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111007174230.702f4a0bf1fe71dab5e10961-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>

Move function to fix langwell_udc.c build error:

drivers/usb/gadget/langwell_udc.c: In function 'show_langwell_udc':
drivers/usb/gadget/langwell_udc.c:1693:3: error: implicit declaration of function 'lpm_device_speed'
drivers/usb/gadget/langwell_udc.c: At top level:
drivers/usb/gadget/langwell_udc.c:2637:37: error: conflicting types for 'lpm_device_speed'
drivers/usb/gadget/langwell_udc.c:1693:20: note: previous implicit declaration of 'lpm_device_speed' was here

Signed-off-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc:	Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc:	linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/usb/gadget/langwell_udc.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

--- next-2011-1007.orig/drivers/usb/gadget/langwell_udc.c
+++ next-2011-1007/drivers/usb/gadget/langwell_udc.c
@@ -1562,6 +1562,20 @@ static ssize_t show_function(struct devi
 static DEVICE_ATTR(function, S_IRUGO, show_function, NULL);
 
 
+static inline enum usb_device_speed lpm_device_speed(u32 reg)
+{
+	switch (LPM_PSPD(reg)) {
+	case LPM_SPEED_HIGH:
+		return USB_SPEED_HIGH;
+	case LPM_SPEED_FULL:
+		return USB_SPEED_FULL;
+	case LPM_SPEED_LOW:
+		return USB_SPEED_LOW;
+	default:
+		return USB_SPEED_UNKNOWN;
+	}
+}
+
 /* device "langwell_udc" sysfs attribute file */
 static ssize_t show_langwell_udc(struct device *_dev,
 		struct device_attribute *attr, char *buf)
@@ -2634,20 +2648,6 @@ done:
 	dev_vdbg(&dev->pdev->dev, "<--- %s()\n", __func__);
 }
 
-static inline enum usb_device_speed lpm_device_speed(u32 reg)
-{
-	switch (LPM_PSPD(reg)) {
-	case LPM_SPEED_HIGH:
-		return USB_SPEED_HIGH;
-	case LPM_SPEED_FULL:
-		return USB_SPEED_FULL;
-	case LPM_SPEED_LOW:
-		return USB_SPEED_LOW;
-	default:
-		return USB_SPEED_UNKNOWN;
-	}
-}
