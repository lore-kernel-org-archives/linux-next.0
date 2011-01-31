From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the arm tree
Date: Mon, 31 Jan 2011 15:53:46 +1100
Message-ID: <20110131155346.d824d38a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Yuan-Hsin Chen <yhchen@faraday-tech.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/gadget/Kconfig between commit
82e6923e1862428b755ec306b3dbccf926849314 ("ARM: lh7a40x: remove
unmaintained platform support") from the arm tree and commit
0fe6f1d1f612035d78d8d195bbc3485a341386d5 ("usb: udc: add Faraday fusb300
driver") from the usb tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/gadget/Kconfig
index 88d191b,4845539..0000000
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@@ -176,6 -176,30 +176,18 @@@ config USB_FSL_USB
  	default USB_GADGET
  	select USB_GADGET_SELECTED
  
+ config USB_GADGET_FUSB300
+ 	boolean "Faraday FUSB300 USB Peripheral Controller"
+ 	select USB_GADGET_DUALSPEED
+ 	help
+ 	   Faraday usb device controller FUSB300 driver
+ 
+ config USB_FUSB300
+ 	tristate
+ 	depends on USB_GADGET_FUSB300
+ 	default USB_GADGET
+ 	select USB_GADGET_SELECTED
+ 
 -config USB_GADGET_LH7A40X
 -	boolean "LH7A40X"
 -	depends on ARCH_LH7A40X
 -	help
 -	   This driver provides USB Device Controller driver for LH7A40x
 -
 -config USB_LH7A40X
 -	tristate
 -	depends on USB_GADGET_LH7A40X
 -	default USB_GADGET
 -	select USB_GADGET_SELECTED
 -
  config USB_GADGET_OMAP
  	boolean "OMAP USB Device Controller"
  	depends on ARCH_OMAP
