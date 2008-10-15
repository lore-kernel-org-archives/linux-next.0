From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the battery tree
Date: Wed, 15 Oct 2008 19:04:47 +1100
Message-ID: <20081015190447.75432e5d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50343 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751736AbYJOIE7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 04:04:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?Ik1hcmVrIFZhxaF1dCI=?= <marek.vasut@gmail.com>, Russell King <rmk@arm.linux.org.uk>, Rodolfo Giometti <giometti@linux.it>

Hi Anton,

Today's linux-next merge of the battery tree got a conflict in
drivers/power/Makefile between commit
4e9687d9c843dc34d368358a36f5f1610e4fbab3 ("[ARM] 5248/1: wm97xx generic
battery driver") from Linus' tree and commit
b996ad0e9fb15ca4acc60bcd0380912117a45d13 ("power_supply: Support for
Texas Instruments BQ27200 battery managers") from the battery tree.

Just overlapping addition/change.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/power/Makefile
index 4e20026,6cb301b..0000000
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@@ -21,4 -21,5 +21,5 @@@ obj-$(CONFIG_BATTERY_DS2760)	+= ds2760_
  obj-$(CONFIG_BATTERY_PMU)	+= pmu_battery.o
  obj-$(CONFIG_BATTERY_OLPC)	+= olpc_battery.o
  obj-$(CONFIG_BATTERY_TOSA)	+= tosa_battery.o
- obj-$(CONFIG_BATTERY_WM97XX)	+= wm97xx_battery.o
 -obj-$(CONFIG_BATTERY_PALMTX)	+= palmtx_battery.o
++obj-$(CONFIG_BATTERY_WM97XX)	+= wm97xx_battery.o
+ obj-$(CONFIG_BATTERY_BQ27x00)	+= bq27x00_battery.o
