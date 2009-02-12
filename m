From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-20090212: drivers/watchdog/ks8695_wdt.c:68: error:
	'CLOCK_TICK_RATE' undeclared (first use in this function)
Date: Thu, 12 Feb 2009 13:42:41 +0300
Message-ID: <20090212104241.GA7978@x200.localdomain>
References: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.157]:3192 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755564AbZBLKgb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Feb 2009 05:36:31 -0500
Content-Disposition: inline
In-Reply-To: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, wim@iguana.be

On arm-acs5k_tiny:

drivers/watchdog/ks8695_wdt.c:68: error: 'CLOCK_TICK_RATE' undeclared (first use in this function)

--- a/drivers/watchdog/ks8695_wdt.c
+++ b/drivers/watchdog/ks8695_wdt.c
@@ -21,6 +21,7 @@
 #include <linux/watchdog.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
+#include <mach/timex.h>
 #include <mach/regs-timer.h>
 
 #define WDT_DEFAULT_TIME	5	/* seconds */
