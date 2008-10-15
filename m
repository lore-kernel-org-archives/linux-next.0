From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Wed, 15 Oct 2008 15:51:48 +1100
Message-ID: <20081015155148.d0cf5553.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58049 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751038AbYJOFMK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 01:12:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Venki Pallipadi <venkatesh.pallipadi@intel.com>, Andy Henroid <andrew.d.henroid@intel.com>

Hi Len,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

scripts/Makefile.build:41: drivers/idle/Makefile: No such file or directory
make[3]: *** No rule to make target `drivers/idle/Makefile'.

Caused by commit e8b529091b2ab65f5a4783e292c2b472e309116e ("i7300_idle
driver v1.55").  I added the patch below.

I suspect that some patch was missed ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 15:32:35 +1100
Subject: [PATCH] drivers has no idle subdirectory

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/Kconfig |    2 --
 drivers/Makefile |    1 -
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5eb231a..8dbd14c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1686,8 +1686,6 @@ source "arch/x86/kernel/cpu/cpufreq/Kconfig"
 
 source "drivers/cpuidle/Kconfig"
 
-source "drivers/idle/Kconfig"
-
 endmenu
 
 
diff --git a/drivers/Makefile b/drivers/Makefile
index f443a8a..2735bde 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -82,7 +82,6 @@ obj-$(CONFIG_EISA)		+= eisa/
 obj-y				+= lguest/
 obj-$(CONFIG_CPU_FREQ)		+= cpufreq/
 obj-$(CONFIG_CPU_IDLE)		+= cpuidle/
-obj-y				+= idle/
 obj-$(CONFIG_MMC)		+= mmc/
 obj-$(CONFIG_MEMSTICK)		+= memstick/
 obj-$(CONFIG_NEW_LEDS)		+= leds/
-- 
1.5.6.5
