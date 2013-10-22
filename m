From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the usb tree
Date: Tue, 22 Oct 2013 17:08:37 +0200
Message-ID: <1382454517-4074-4-git-send-email-treding@nvidia.com>
References: <1382454517-4074-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382454517-4074-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the usb tree got a conflict in

	drivers/Kconfig

caused by commits ff76496 (drivers: phy: add generic PHY framework) and
12cc4b38 (PowerCap: Add to drivers Kconfig and Makefile).

I fixed it up (see below). Please verify that the resolution look good.

Thanks,
Thierry
---
diff --cc drivers/Kconfig
index 969e987,8f45144..97536a2
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@@ -166,6 -166,6 +166,8 @@@ source "drivers/reset/Kconfig
  
  source "drivers/fmc/Kconfig"
  
 +source "drivers/powercap/Kconfig"
 +
+ source "drivers/phy/Kconfig"
+ 
  endmenu
