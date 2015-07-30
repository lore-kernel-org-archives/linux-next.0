From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/1] mfd: intel-lpss: fix build error when !CONFIG_PM_SLEEP
Date: Thu, 30 Jul 2015 13:46:19 +0300
Message-ID: <1438253179-108447-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:52446 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753641AbbG3Kqx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2015 06:46:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Jim Davis reported the compilation error with a random configuration which
apparently has CONFIG_PM=y and CONFIG_PM_SLEEP=n. With that conditions we have
missed definition of INTEL_LPSS_SLEEP_PM_OPS macro. Add it here.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/intel-lpss.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/intel-lpss.h b/drivers/mfd/intel-lpss.h
index f28cb28a..2c7f8d7 100644
--- a/drivers/mfd/intel-lpss.h
+++ b/drivers/mfd/intel-lpss.h
@@ -42,6 +42,8 @@ int intel_lpss_resume(struct device *dev);
 	.thaw = intel_lpss_resume,		\
 	.poweroff = intel_lpss_suspend,		\
 	.restore = intel_lpss_resume,
+#else
+#define INTEL_LPSS_SLEEP_PM_OPS
 #endif
 
 #define INTEL_LPSS_RUNTIME_PM_OPS		\
-- 
2.4.6
