From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] thermal: cpu_cooling.c needs to select CPU_FREQ_TABLE
Date: Wed, 12 Sep 2012 11:06:06 -0700
Message-ID: <5050CF0E.3080502@xenotime.net>
References: <20120912184644.48e4e2e7d59b12893a42f60a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:51076 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1761003Ab2ILSGj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Sep 2012 14:06:39 -0400
In-Reply-To: <20120912184644.48e4e2e7d59b12893a42f60a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Amit Daniel <amit.kachhap@linaro.org>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

cpu_cooling.c (CONFIG_CPU_THERMAL) uses cpu frequency table
intefaces so it should select CPU_FREQ_TABLE.
Fixes these build errors:

drivers/built-in.o: In function `cpufreq_get_max_state':
cpu_cooling.c:(.text+0x4e1297): undefined reference to `cpufreq_frequency_get_table'
drivers/built-in.o: In function `cpufreq_set_cur_state':
cpu_cooling.c:(.text+0x4e138b): undefined reference to `cpufreq_frequency_get_table'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Amit Daniel <amit.kachhap@linaro.org>
---
 drivers/thermal/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Also, please add info in the MAINTAINERS file for drivers/thermal/.

--- linux-next-20120912.orig/drivers/thermal/Kconfig
+++ linux-next-20120912/drivers/thermal/Kconfig
@@ -22,6 +22,7 @@ config THERMAL_HWMON
 config CPU_THERMAL
 	bool "generic cpu cooling support"
 	depends on THERMAL && CPU_FREQ
+	select CPU_FREQ_TABLE
 	help
 	  This implements the generic cpu cooling mechanism through frequency
 	  reduction, cpu hotplug and any other ways of reducing temperature. An
