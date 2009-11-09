From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build failure
Date: Mon, 9 Nov 2009 19:08:12 +1100
Message-ID: <20091109190812.b2f75760.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754394AbZKIIIP@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi John,

Today's linux-next build (powerpc allyesconfig) failed like this:

In file included from drivers/net/wireless/rt2x00/rt2800lib.c:35:
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_vendor_request_sw':
drivers/net/wireless/rt2x00/rt2x00usb.h:205: error: 'USB_DIR_OUT' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:205: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:205: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_eeprom_read':
drivers/net/wireless/rt2x00/rt2x00usb.h:223: error: 'USB_DIR_IN' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:223: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:223: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_register_read':
drivers/net/wireless/rt2x00/rt2x00usb.h:243: error: 'USB_DIR_IN' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:243: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:243: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_register_read_lock':
drivers/net/wireless/rt2x00/rt2x00usb.h:263: error: 'USB_DIR_IN' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:263: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:263: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_register_multiread':
drivers/net/wireless/rt2x00/rt2x00usb.h:283: error: 'USB_DIR_IN' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:283: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:283: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_register_write':
drivers/net/wireless/rt2x00/rt2x00usb.h:303: error: 'USB_DIR_OUT' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:303: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:303: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_register_write_lock':
drivers/net/wireless/rt2x00/rt2x00usb.h:322: error: 'USB_DIR_OUT' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:322: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:322: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: In function 'rt2x00usb_register_multiwrite':
drivers/net/wireless/rt2x00/rt2x00usb.h:342: error: 'USB_DIR_OUT' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:342: error: 'USB_TYPE_VENDOR' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h:342: error: 'USB_RECIP_DEVICE' undeclared (first use in this function)
drivers/net/wireless/rt2x00/rt2x00usb.h: At top level:
drivers/net/wireless/rt2x00/rt2x00usb.h:439: warning: 'struct usb_interface' declared inside parameter list
drivers/net/wireless/rt2x00/rt2x00usb.h:439: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/net/wireless/rt2x00/rt2x00usb.h:440: warning: 'struct usb_interface' declared inside parameter list
drivers/net/wireless/rt2x00/rt2x00usb.h:442: warning: 'struct usb_interface' declared inside parameter list
drivers/net/wireless/rt2x00/rt2x00usb.h:443: warning: 'struct usb_interface' declared inside parameter list

Presumably because drivers/net/wireless/rt2x00/rt2x00usb.h needs to have
linux/usb/ch9.h included.

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Nov 2009 19:04:19 +1100
Subject: [PATCH] wireless/rt2x00usb: include usb.h to get needed constants

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/rt2x00/rt2x00usb.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/rt2x00/rt2x00usb.h b/drivers/net/wireless/rt2x00/rt2x00usb.h
index 9943e42..1c9d6ca 100644
--- a/drivers/net/wireless/rt2x00/rt2x00usb.h
+++ b/drivers/net/wireless/rt2x00/rt2x00usb.h
@@ -26,6 +26,8 @@
 #ifndef RT2X00USB_H
 #define RT2X00USB_H
 
+#include <linux/usb.h>
+
 #define to_usb_device_intf(d) \
 ({ \
 	struct usb_interface *intf = to_usb_interface(d); \
-- 
1.6.5.2


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
