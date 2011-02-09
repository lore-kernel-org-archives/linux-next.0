From: Randy Dunlap <randy.dunlap@Oracle.COM>
Subject: [PATCH -next] can: softing_cs needs slab.h
Date: Wed, 9 Feb 2011 08:44:56 -0800
Message-ID: <20110209084456.802370fa.randy.dunlap@oracle.com>
References: <20110209170225.94eae681.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20110209170225.94eae681.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, davem@davemloft.net, socketcan-core@lists.berlios.de
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

softing_cs.c uses kzalloc & kfree, so it needs to include linux/slab.h.

drivers/net/can/softing/softing_cs.c:234: error: implicit declaration of function 'kfree'
drivers/net/can/softing/softing_cs.c:271: error: implicit declaration of function 'kzalloc'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/net/can/softing/softing_cs.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110209.orig/drivers/net/can/softing/softing_cs.c
+++ linux-next-20110209/drivers/net/can/softing/softing_cs.c
@@ -19,6 +19,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/slab.h>
 
 #include <pcmcia/cistpl.h>
 #include <pcmcia/ds.h>
