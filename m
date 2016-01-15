From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Date: Fri, 15 Jan 2016 12:56:11 +1100
Message-ID: <20160115125611.56364f00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52782 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750768AbcAOB4N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Jan 2016 20:56:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>

Hi Darren,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/dell-wmi.c

between commit:

  61679c725553 ("dell-wmi: Use acpi_video_handles_brightness_key_presses()")

from Linus' tree and commit:

  6129570931b8 ("dell-wmi: Check if Dell WMI descriptor structure is valid")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/platform/x86/dell-wmi.c
index cb8a9c2a3a1f,5db9efbde5b9..000000000000
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@@ -42,8 -44,13 +44,12 @@@ MODULE_DESCRIPTION("Dell laptop WMI hot
  MODULE_LICENSE("GPL");
  
  #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
+ #define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
+ 
 -static int acpi_video;
+ static u32 dell_wmi_interface_version;
  
  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
+ MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
  
  /*
   * Certain keys are flagged as KE_IGNORE. All of these are either
@@@ -396,7 -520,12 +520,11 @@@ static int __init dell_wmi_init(void
  		return -ENODEV;
  	}
  
+ 	err = dell_wmi_check_descriptor_buffer();
+ 	if (err)
+ 		return err;
+ 
  	dmi_walk(find_hk_type, NULL);
 -	acpi_video = acpi_video_get_backlight_type() != acpi_backlight_vendor;
  
  	err = dell_wmi_input_setup();
  	if (err)
