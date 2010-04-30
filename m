From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/cxt1e1: use netdev_priv to fix build
Date: Fri, 30 Apr 2010 10:07:12 -0700
Message-ID: <20100430100712.041f6fcc.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, Bob Beers <bob.beers@gmail.com>, gregkh@suse.de
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix cxt1e1 build error:
drivers/staging/cxt1e1/linux.c:1195: error: 'struct net_device' has no member named 'priv'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Bob Beers <bob.beers@gmail.com>
---
 drivers/staging/cxt1e1/linux.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100430.orig/drivers/staging/cxt1e1/linux.c
+++ linux-next-20100430/drivers/staging/cxt1e1/linux.c
@@ -1192,7 +1192,7 @@ c4_add_dev (hdw_info_t * hi, int brdno, 
                 hi->devname, irq1);
         unregister_netdev (ndev);
         free_irq (irq0, ndev);
-        OS_kfree (ndev->priv);
+        OS_kfree (netdev_priv(ndev));
         OS_kfree (ndev);
         error_flag = EIO;
         return 0;
