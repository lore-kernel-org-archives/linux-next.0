From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next/resend] writeback.h: needs linux/device.h
Date: Mon, 19 Jul 2010 16:49:17 -0700
Message-ID: <20100719164917.fb77b1d7.randy.dunlap@oracle.com>
References: <20100719133841.babc9ccb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100719133841.babc9ccb.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, axboe@kernel.dk
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

include/trace/events/writeback.h uses dev_name(), so it needs to
include linux/device.h.

include/trace/events/writeback.h:12: error: implicit declaration of function 'dev_name'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/trace/events/writeback.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100708.orig/include/trace/events/writeback.h
+++ linux-next-20100708/include/trace/events/writeback.h
@@ -5,6 +5,7 @@
 #define _TRACE_WRITEBACK_H
 
 #include <linux/backing-dev.h>
+#include <linux/device.h>
 #include <linux/writeback.h>
 
 struct wb_writeback_work;
