From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Fri, 7 Apr 2017 14:41:10 +1000
Message-ID: <20170407144110.09617e71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39727 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750705AbdDGElN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 00:41:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Raviteja Garimella <raviteja.garimella@broadcom.com>

Hi Felipe,

Today's linux-next merge of the usb-gadget tree got conflicts in:

  drivers/usb/gadget/udc/Kconfig

between commit:

  2c93e790e825 ("usb: add CONFIG_USB_PCI for system have both PCI HW and non-PCI based USB HW")

from the usb tree and commit:

  5dbc49aebd0a ("usb: gadget: udc: amd5536: split core and PCI layer")

from the usb-gadget tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/usb/gadget/udc/Kconfig
index c6cc9d3270ac,707814da6000..000000000000
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@@ -277,7 -292,8 +292,8 @@@ source "drivers/usb/gadget/udc/bdc/Kcon
  
  config USB_AMD5536UDC
  	tristate "AMD5536 UDC"
 -	depends on PCI
 +	depends on USB_PCI
+ 	select USB_SNP_CORE
  	help
  	   The AMD5536 UDC is part of the AMD Geode CS5536, an x86 southbridge.
  	   It is a USB Highspeed DMA capable USB device controller. Beside ep0
