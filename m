From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH-next] bus: fsl-mc: fix implicit irq include causing build fails
Date: Sun, 23 Jul 2017 10:36:52 -0400
Message-ID: <20170723143652.16445-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:41867 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751625AbdGWOhJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Jul 2017 10:37:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

To fix:

In file included from drivers/staging/fsl-dpaa2/ethernet/dpaa2-eth.h:39:0,
                 from drivers/staging/fsl-dpaa2/ethernet/dpaa2-ethtool.c:34:
drivers/staging/fsl-dpaa2/ethernet/../../fsl-mc/include/dpaa2-io.h:86:1: error: unknown type name ‘irqreturn_t’
 irqreturn_t dpaa2_io_irq(struct dpaa2_io *obj);
 ^

as seen on arm64 allmodconfig builds.

Cc: Stuart Yoder <stuyoder@gmail.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[Seen on current linux-next tree.]

 drivers/staging/fsl-mc/include/dpaa2-io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/fsl-mc/include/dpaa2-io.h b/drivers/staging/fsl-mc/include/dpaa2-io.h
index 002829cecd75..afc5d5bb1698 100644
--- a/drivers/staging/fsl-mc/include/dpaa2-io.h
+++ b/drivers/staging/fsl-mc/include/dpaa2-io.h
@@ -34,6 +34,7 @@
 
 #include <linux/types.h>
 #include <linux/cpumask.h>
+#include <linux/interrupt.h>
 
 #include "dpaa2-fd.h"
 #include "dpaa2-global.h"
-- 
2.11.0
