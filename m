From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the watchdog tree
Date: Wed, 2 Mar 2016 14:31:27 +1100
Message-ID: <20160302143127.6a17dc75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34761 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751888AbcCBDba (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 22:31:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>, Kyle Roeschley <kyle.roeschley@ni.com>

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/watchdog/Kconfig
  drivers/watchdog/Makefile

between commit:

  70f3997667fb ("watchdog: ni903x_wdt: Add NI 903x/913x watchdog driver")

from the watchdog tree and commit:

  222818c3d84c ("watchdog: mei_wdt: implement MEI iAMT watchdog driver")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/watchdog/Kconfig
index 891bfc0da1ce,86c2392bd968..000000000000
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@@ -1226,17 -1214,21 +1226,32 @@@ config SBC_EPX_C3_WATCHDO
  	  To compile this driver as a module, choose M here: the
  	  module will be called sbc_epx_c3.
  
 +config NI903X_WDT
 +	tristate "NI 903x/913x Watchdog"
 +	depends on X86 && ACPI
 +	select WATCHDOG_CORE
 +	---help---
 +	  This is the driver for the watchdog timer on the National Instruments
 +	  903x/913x real-time controllers.
 +
 +	  To compile this driver as a module, choose M here: the module will be
 +	  called ni903x_wdt.
 +
+ config INTEL_MEI_WDT
+ 	tristate "Intel MEI iAMT Watchdog"
+ 	depends on INTEL_MEI && X86
+ 	select WATCHDOG_CORE
+ 	---help---
+ 	  A device driver for the Intel MEI iAMT watchdog.
+ 
+ 	  The Intel AMT Watchdog is an OS Health (Hang/Crash) watchdog.
+ 	  Whenever the OS hangs or crashes, iAMT will send an event
+ 	  to any subscriber to this event. The watchdog doesn't reset the
+ 	  the platform.
+ 
+ 	  To compile this driver as a module, choose M here:
+ 	  the module will be called mei_wdt.
+ 
  # M32R Architecture
  
  # M68K Architecture
diff --cc drivers/watchdog/Makefile
index c0fc40fc8a8e,efc4f788e0f2..000000000000
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@@ -127,7 -126,7 +127,8 @@@ obj-$(CONFIG_MACHZ_WDT) += machzwd.
  obj-$(CONFIG_SBC_EPX_C3_WATCHDOG) += sbc_epx_c3.o
  obj-$(CONFIG_INTEL_SCU_WATCHDOG) += intel_scu_watchdog.o
  obj-$(CONFIG_INTEL_MID_WATCHDOG) += intel-mid_wdt.o
 +obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
+ obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
  
  # M32R Architecture
  
