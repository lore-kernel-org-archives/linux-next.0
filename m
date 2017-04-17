From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with the pm tree
Date: Tue, 18 Apr 2017 09:59:19 +1000
Message-ID: <20170418095919.6caec943@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51689 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932323AbdDQX7X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Apr 2017 19:59:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Steve Twiss <stwiss.opensource@diasemi.com>

Hi Eduardo,

Today's linux-next merge of the thermal-soc tree got conflicts in:

  drivers/thermal/Kconfig
  drivers/thermal/Makefile

between commit:

  19678ffb9fd6 ("cpufreq: dbx500: Manage cooling device from cpufreq driver")

from the pm tree and commit:

  608567aac320 ("thermal: da9062/61: Thermal junction temperature monitoring driver")

from the thermal-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/thermal/Kconfig
index 0a16cf4bed39,6699843918fa..000000000000
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@@ -290,7 -290,29 +290,17 @@@ config ARMADA_THERMA
  	help
  	  Enable this option if you want to have support for thermal management
  	  controller present in Armada 370 and Armada XP SoC.
 -
 -config DB8500_CPUFREQ_COOLING
 -	tristate "DB8500 cpufreq cooling"
 -	depends on ARCH_U8500 || COMPILE_TEST
 -	depends on HAS_IOMEM
 -	depends on CPU_THERMAL
 -	default y
 -	help
 -	  Adds DB8500 cpufreq cooling devices, and these cooling devices can be
 -	  bound to thermal zone trip points. When a trip point reached, the
 -	  bound cpufreq cooling device turns active to set CPU frequency low to
 -	  cool down the CPU.
  
+ config DA9062_THERMAL
+ 	tristate "DA9062/DA9061 Dialog Semiconductor thermal driver"
+ 	depends on MFD_DA9062 || COMPILE_TEST
+ 	depends on OF
+ 	help
+ 	  Enable this for the Dialog Semiconductor thermal sensor driver.
+ 	  This will report PMIC junction over-temperature for one thermal trip
+ 	  zone.
+ 	  Compatible with the DA9062 and DA9061 PMICs.
+ 
  config INTEL_POWERCLAMP
  	tristate "Intel PowerClamp idle injection driver"
  	depends on THERMAL
diff --cc drivers/thermal/Makefile
index c2372f10dae5,a1e9b8b4e897..000000000000
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@@ -41,6 -42,8 +42,7 @@@ obj-$(CONFIG_TANGO_THERMAL)	+= tango_th
  obj-$(CONFIG_IMX_THERMAL)	+= imx_thermal.o
  obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
  obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
 -obj-$(CONFIG_DB8500_CPUFREQ_COOLING)	+= db8500_cpufreq_cooling.o
+ obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
  obj-$(CONFIG_INTEL_POWERCLAMP)	+= intel_powerclamp.o
  obj-$(CONFIG_X86_PKG_TEMP_THERMAL)	+= x86_pkg_temp_thermal.o
  obj-$(CONFIG_INTEL_SOC_DTS_IOSF_CORE)	+= intel_soc_dts_iosf.o
