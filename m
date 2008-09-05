From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 4 (PATCH: IXGBE)
Date: Thu, 4 Sep 2008 20:41:37 -0700
Message-ID: <20080904204137.9b31f644.randy.dunlap@oracle.com>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <e1000-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/e1000-devel>,
	<mailto:e1000-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=e1000-devel>
List-Post: <mailto:e1000-devel@lists.sourceforge.net>
List-Help: <mailto:e1000-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/e1000-devel>,
	<mailto:e1000-devel-request@lists.sourceforge.net?subject=subscribe>
Sender: e1000-devel-bounces@lists.sourceforge.net
Errors-To: e1000-devel-bounces@lists.sourceforge.net
To: Stephen Rothwell <sfr@canb.auug.org.au>, jgarzik <jgarzik@pobox.com>, jeffrey.t.kirsher@intel.com, e1000-devel@lists.sourceforge.net
Cc: Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew@sc8-sf-spam2.sourceforge.net
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

ixgbe needs to be restricted to the same build config (m/y)
as DCA since it calls the dca_*() functions.

ixgbe_main.c:(.text+0xd9c09): undefined reference to `dca3_get_tag'
ixgbe_main.c:(.text+0xd9cc9): undefined reference to `dca3_get_tag'
ixgbe_main.c:(.text+0xda5c1): undefined reference to `dca_add_requester'
ixgbe_main.c:(.text+0xda5d6): undefined reference to `dca_remove_requester'
text+0xdc162): undefined reference to `dca_add_requester'
text+0xdc1d3): undefined reference to `dca_remove_requester'
ixgbe_main.c:(.init.text+0xa74b): undefined reference to `dca_register_notify'
ixgbe_main.c:(.devinit.text+0xa4ca): undefined reference to `dca_add_requester'
ixgbe_main.c:(.exit.text+0xd21): undefined reference to `dca_unregister_notify'
ixgbe_main.c:(.devexit.text+0x72d): undefined reference to `dca_remove_requester'
make[1]: *** [.tmp_vmlinux1] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/net/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20080904.orig/drivers/net/Kconfig
+++ linux-next-20080904/drivers/net/Kconfig
@@ -2379,7 +2379,7 @@ config EHEA
 
 config IXGBE
 	tristate "Intel(R) 10GbE PCI Express adapters support"
-	depends on PCI && INET
+	depends on PCI && INET && DCA
 	select INET_LRO
 	---help---
 	  This driver supports Intel(R) 10GbE PCI Express family of

-------------------------------------------------------------------------
This SF.Net email is sponsored by the Moblin Your Move Developer's challenge
Build the coolest Linux based applications with Moblin SDK & win great prizes
Grand prize is a trip for two to an Open Source event anywhere in the world
http://moblin-contest.org/redirect.php?banner_id=100&url=/
