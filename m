From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] fixup! gpu: host1x: Add IOMMU support
Date: Wed,  5 Apr 2017 10:45:44 +0300
Message-ID: <20170405074544.29464-1-mperttunen@nvidia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:39245 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751960AbdDEHqy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Apr 2017 03:46:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: thierry.reding@gmail.com
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, amerilainen@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f8fda446a6a6..f05ebb14fa63 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -27,6 +27,7 @@
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/host1x.h>
+#undef CREATE_TRACE_POINTS
 
 #include "bus.h"
 #include "channel.h"
-- 
2.11.1
