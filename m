From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the uwb tree
Date: Thu, 16 Oct 2008 19:12:55 +1100
Message-ID: <20081016191255.401f6653.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42410 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751107AbYJPINE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 04:13:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>, Greg KH <greg@kroah.com>

Hi David,

Today's linux-next merge of the uwb tree got a conflict in
Documentation/ABI/testing/sysfs-bus-usb between commit
0130b0e738ead70618d364339cbe2f7f9f1ee87f ("USB: Export if an interface
driver supports autosuspend") from the usb tree and commit
c8cf2465fcfc16877f4f9e8dccc6b89b543fa2c5 ("uwb: document UWB and WUSB
sysfs files") from the uwb tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/ABI/testing/sysfs-bus-usb
index df6c8a0,273a7f0..0000000
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@@ -86,18 -86,45 +86,61 @@@ Users
  		PowerTOP <power@bughost.org>
  		http://www.lesswatts.org/projects/powertop/
  
 +What:		/sys/bus/usb/device/<busnum>-<devnum>...:<config num>-<interface num>/supports_autosuspend
 +Date:		January 2008
 +KernelVersion:	2.6.27
 +Contact:	Sarah Sharp <sarah.a.sharp@intel.com>
 +Description:
 +		When read, this file returns 1 if the interface driver
 +		for this interface supports autosuspend.  It also
 +		returns 1 if no driver has claimed this interface, as an
 +		unclaimed interface will not stop the device from being
 +		autosuspended if all other interface drivers are idle.
 +		The file returns 0 if autosuspend support has not been
 +		added to the driver.
 +Users:
 +		USB PM tool
 +		git://git.moblin.org/users/sarah/usb-pm-tool/
++
+ What:		/sys/bus/usb/device/.../authorized
+ Date:		July 2008
+ KernelVersion:	2.6.26
+ Contact:	David Vrabel <david.vrabel@csr.com>
+ Description:
+ 		Authorized devices are available for use by device
+ 		drivers, non-authorized one are not.  By default, wired
+ 		USB devices are authorized.
+ 
+ 		Certified Wireless USB devices are not authorized
+ 		initially and should be (by writing 1) after the
+ 		device has been authenticated.
+ 
+ What:		/sys/bus/usb/device/.../wusb_cdid
+ Date:		July 2008
+ KernelVersion:	2.6.27
+ Contact:	David Vrabel <david.vrabel@csr.com>
+ Description:
+ 		For Certified Wireless USB devices only.
+ 
+ 		A devices's CDID, as 16 space-separated hex octets.
+ 
+ What:		/sys/bus/usb/device/.../wusb_ck
+ Date:		July 2008
+ KernelVersion:	2.6.27
+ Contact:	David Vrabel <david.vrabel@csr.com>
+ Description:
+ 		For Certified Wireless USB devices only.
+ 
+ 		Write the device's connection key (CK) to start the
+ 		authentication of the device.  The CK is 16
+ 		space-separated hex octets.
+ 
+ What:		/sys/bus/usb/device/.../wusb_disconnect
+ Date:		July 2008
+ KernelVersion:	2.6.27
+ Contact:	David Vrabel <david.vrabel@csr.com>
+ Description:
+ 		For Certified Wireless USB devices only.
+ 
+ 		Write a 1 to force the device to disconnect
+ 		(equivalent to unplugging a wired USB device).
