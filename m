From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Mon, 25 Aug 2008 15:48:00 +1000
Message-ID: <20080825154800.ff20bc0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52985 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751158AbYHYFsL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 01:48:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the acpi tree got a conflict in
drivers/misc/acer-wmi.c between commit
83097aca8567a0bd593534853b71fe0fa9a75d69 ("Fix oops in acer_wmi driver
(acer_wmi_init)") from Linus' tree and commit
017f8ecd1cedb482392f0500ee3701b8c50a46f9 ("Acer-WMI: fingers off
backlight if video.ko is serving this functionality") from the acpi tree.

Just overlapping additions.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/misc/acer-wmi.c
index c6c77a5,6df52e8..0000000
--- a/drivers/misc/acer-wmi.c
+++ b/drivers/misc/acer-wmi.c
@@@ -1240,8 -1246,12 +1249,14 @@@ static int __init acer_wmi_init(void
  		return -ENODEV;
  	}
  
 +	set_quirks();
 +
+ 	if (!acpi_video_backlight_support() && has_cap(ACER_CAP_BRIGHTNESS)) {
+ 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
+ 		printk(ACER_INFO "Brightness must be controlled by "
+ 		       "generic video driver\n");
+ 	}
+ 
  	if (platform_driver_register(&acer_platform_driver)) {
  		printk(ACER_ERR "Unable to register platform driver.\n");
  		goto error_platform_register;
