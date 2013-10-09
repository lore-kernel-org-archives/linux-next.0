From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the clk tree
Date: Wed,  9 Oct 2013 16:14:24 +0200
Message-ID: <1381328067-1593-3-git-send-email-treding@nvidia.com>
References: <1381328067-1593-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381328067-1593-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Takashi Yoshii <takasi-y@ops.dti.ne.jp>, Simon Horman <horms+renesas@verge.net.au>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Loc Ho <lho@apm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the clk tree got a conflict in

	drivers/clk/Makefile

caused by commits f00578d (clk: emev2: Add support for emev2 SMU clocks
with DT), 6cfc229 (clk: keystone: Build Keystone clock drivers) and
308964c (clk: Add APM X-Gene SoC clock driver).

I fixed it up (see below). Please verify that the resolution looks good.

Thanks,
Thierry
---
diff --cc drivers/clk/Makefile
index d25da26,df33820..fe3121b
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@@ -32,7 -32,8 +32,9 @@@ obj-$(CONFIG_ARCH_VT8500)	+= clk-vt8500
  obj-$(CONFIG_ARCH_ZYNQ)		+= zynq/
  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
  obj-$(CONFIG_PLAT_SAMSUNG)	+= samsung/
 +obj-$(CONFIG_ARCH_SHMOBILE_MULTI)	+= shmobile/
+ obj-$(CONFIG_COMMON_CLK_XGENE)  += clk-xgene.o
+ obj-$(CONFIG_COMMON_CLK_KEYSTONE)	+= keystone/
  
  obj-$(CONFIG_X86)		+= x86/
  
