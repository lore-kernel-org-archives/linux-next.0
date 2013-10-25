From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the imx-mxs tree
Date: Fri, 25 Oct 2013 15:03:44 +0200
Message-ID: <1382706224-8859-6-git-send-email-treding@nvidia.com>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com>
 <1382706224-8859-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382706224-8859-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Tim Harvey <tharvey@gateworks.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the imx-mxs tree got a conflict in

	arch/arm/mach-imx/mach-imx6q.c

caused by commits 6aec339 (PM / OPP: rename header to linux/pm_opp.h) and
0794410 (imx: add PCI fixup for PEX860X on Gateworks board).

I fixed it up (see below). Please verify that the resolution looks good.

Thanks,
Thierry
---
diff --cc arch/arm/mach-imx/mach-imx6q.c
index eae5642,1ac719d..bc98799
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@@ -23,8 -23,9 +23,10 @@@
  #include <linux/of_address.h>
  #include <linux/of_irq.h>
  #include <linux/of_platform.h>
- #include <linux/pm_opp.h>
+ #include <linux/opp.h>
+ #include <linux/pci.h>
  #include <linux/phy.h>
++#include <linux/pm_opp.h>
  #include <linux/reboot.h>
  #include <linux/regmap.h>
  #include <linux/micrel_phy.h>
