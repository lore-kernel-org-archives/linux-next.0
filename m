From: Gerard Lledo <gerard.lledo@gmail.com>
Subject: [PATCH] Staging: comedi: Add missing includes
Date: Wed, 27 May 2009 17:35:18 +0300
Message-ID: <1243434919-10192-2-git-send-email-gerard.lledo@gmail.com>
References: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:6782 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759768AbZE0OfZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 10:35:25 -0400
In-Reply-To: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-janitors@vger.kernel.org
Cc: linux-next@vger.kernel.org, Gerard Lledo <gerard.lledo@gmail.com>

Fixes build errors due to missing includes

Signed-off-by: Gerard Lledo <gerard.lledo@gmail.com>
---
 drivers/staging/comedi/comedidev.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/comedi/comedidev.h b/drivers/staging/comedi/comedidev.h
index 7a1ccde..1cdf5aa 100644
--- a/drivers/staging/comedi/comedidev.h
+++ b/drivers/staging/comedi/comedidev.h
@@ -38,6 +38,9 @@
 #include <linux/dma-mapping.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/timer.h>
 
 #include "comedi.h"
 
-- 
1.5.6.5
