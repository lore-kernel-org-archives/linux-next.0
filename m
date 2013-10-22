From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the mvebu tree
Date: Tue, 22 Oct 2013 17:10:49 +0200
Message-ID: <1382454649-16442-5-git-send-email-treding@nvidia.com>
References: <1382369814-7582-1-git-send-email-treding@nvidia.com>
 <1382454649-16442-1-git-send-email-treding@nvidia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:33797 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002Ab3JVPN0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2013 11:13:26 -0400
Received: by mail-bk0-f51.google.com with SMTP id mx10so1328933bkb.24
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2013 08:13:25 -0700 (PDT)
In-Reply-To: <1382454649-16442-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>
Cc: linux-next@vger.kernel.org

Today's linux-next merge of the mvebu tree got conflicts in

	arch/arm/mach-kirkwood/board-dt.c

caused by commits a169e3a (ARM: kirkwood: remove custom .init_time hook)
and 14867b4 (ARM: kirkwood: remove lagacy clk workarounds).

I fixed them up (see below). Please verify that the resolution looks good.

Thanks,
Thierry
---
diff --cc arch/arm/mach-kirkwood/board-dt.c
index 9caa4fe,44bc6b9..ab2e586
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@@ -17,14 -19,10 +19,9 @@@
  #include <linux/of_net.h>
  #include <linux/of_platform.h>
  #include <linux/clk-provider.h>
- #include <linux/dma-mapping.h>
- #include <linux/irqchip.h>
- #include <linux/kexec.h>
 -#include <linux/clocksource.h>
+ #include <linux/slab.h>
  #include <asm/mach/arch.h>
- #include <asm/mach/map.h>
  #include <mach/bridge-regs.h>
- #include <linux/platform_data/usb-ehci-orion.h>
- #include <plat/irq.h>
  #include <plat/common.h>
  #include "common.h"
  
