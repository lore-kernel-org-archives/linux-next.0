From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] drbd: needs __ratelimit()
Date: Wed, 7 Oct 2009 10:21:53 -0700
Message-ID: <20091007102153.1a19119b.randy.dunlap@oracle.com>
References: <20091007173517.abfcfa2a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759648AbZJGRXJ@vger.kernel.org>
In-Reply-To: <20091007173517.abfcfa2a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, drbd-dev@lists.linbit.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jens.axboe@oracle.com
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

drbd_int.h uses __ratelimit(), so it needs to #include ratelimit.h:

drivers/block/drbd/drbd_int.h:1765: error: implicit declaration of function '__ratelimit'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: drbd-dev@lists.linbit.com
---
 drivers/block/drbd/drbd_int.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20091007.orig/drivers/block/drbd/drbd_int.h
+++ linux-next-20091007/drivers/block/drbd/drbd_int.h
@@ -34,6 +34,7 @@
 #include <linux/bitops.h>
 #include <linux/slab.h>
 #include <linux/crypto.h>
+#include <linux/ratelimit.h>
 #include <linux/tcp.h>
 #include <linux/mutex.h>
 #include <linux/major.h>
