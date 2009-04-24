From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] 8390p: fix build breakage
Date: Fri, 24 Apr 2009 13:25:50 +0400
Message-ID: <20090424092550.GA10833@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: ormi.linux@gmail.com, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Fix this build error caused by 362b76edb789
"8390p: Get rid of init_module/cleanup_module"

drivers/net/8390p.c:94:19: error: invalid suffix "p_init_module" on integer constant
drivers/net/8390p.c:94: error: expected identifier or '(' before numeric constant
drivers/net/8390p.c:99:20: error: invalid suffix "p_cleanup_module" on integer constant

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/net/8390p.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/8390p.c b/drivers/net/8390p.c
index cacdd86..d225c29 100644
--- a/drivers/net/8390p.c
+++ b/drivers/net/8390p.c
@@ -91,15 +91,15 @@ void NS8390p_init(struct net_device *dev, int startp)
 }
 EXPORT_SYMBOL(NS8390p_init);
 
-static int __init 8390p_init_module(void)
+static int __init NS8390p_init_module(void)
 {
 	return 0;
 }
 
-static void __exit 8390p_cleanup_module(void)
+static void __exit NS8390p_cleanup_module(void)
 {
 }
 
-module_init(8390p_init_module);
-module_exit(8390p_cleanup_module);
+module_init(NS8390p_init_module);
+module_exit(NS8390p_cleanup_module);
 MODULE_LICENSE("GPL");
