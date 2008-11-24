From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 23 Nov 2008 20:03:03 -0800 (PST)
Message-ID: <20081123.200303.133339984.davem@davemloft.net>
References: <20081124134301.8aebd20f.sfr@canb.auug.org.au>
	<20081123.195602.16120267.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48549
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750862AbYKXEDD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 23:03:03 -0500
In-Reply-To: <20081123.195602.16120267.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com

From: David Miller <davem@davemloft.net>
Date: Sun, 23 Nov 2008 19:56:02 -0800 (PST)

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 24 Nov 2008 13:43:01 +1100
> 
> > Caused by commit 4e4fd4e485ad63a9074ff09a9b53ffc7a5c594ec ("ne2k: convert
> > to net_device_ops").
> > 
> > I have dropped the net tree again.
> 
> Can't you just revert the patch to fix the build instead? :-/

Or wait the 5 friggin' minutes it took me to compose and
push out this obvious patch.  It's not like we're not awake
at the same time :-/

axnet_cs: Fix build after net device ops ne2k conversion.

Commit 4e4fd4e485ad63a9074ff09a9b53ffc7a5c594ec ("ne2k: convert to
net_device_ops") exported some ei_* symbols from the 8390 library,
but the axnet_cs driver defines local static versions of the same
functions.

Rename them to avoid the namespace conflict.

Reported by Stephen Rothwell.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/pcmcia/axnet_cs.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/pcmcia/axnet_cs.c b/drivers/net/pcmcia/axnet_cs.c
index 2aca8df..c9890b4 100644
--- a/drivers/net/pcmcia/axnet_cs.c
+++ b/drivers/net/pcmcia/axnet_cs.c
@@ -904,7 +904,7 @@ int ei_debug = 1;
 /* Index to functions. */
 static void ei_tx_intr(struct net_device *dev);
 static void ei_tx_err(struct net_device *dev);
-static void ei_tx_timeout(struct net_device *dev);
+static void axnet_tx_timeout(struct net_device *dev);
 static void ei_receive(struct net_device *dev);
 static void ei_rx_overrun(struct net_device *dev);
 
@@ -955,9 +955,9 @@ static int ax_open(struct net_device *dev)
 
 #ifdef HAVE_TX_TIMEOUT
 	/* The card I/O part of the driver (e.g. 3c503) can hook a Tx timeout
-	    wrapper that does e.g. media check & then calls ei_tx_timeout. */
+	    wrapper that does e.g. media check & then calls axnet_tx_timeout. */
 	if (dev->tx_timeout == NULL)
-		 dev->tx_timeout = ei_tx_timeout;
+		 dev->tx_timeout = axnet_tx_timeout;
 	if (dev->watchdog_timeo <= 0)
 		 dev->watchdog_timeo = TX_TIMEOUT;
 #endif
@@ -1001,14 +1001,14 @@ static int ax_close(struct net_device *dev)
 }
 
 /**
- * ei_tx_timeout - handle transmit time out condition
+ * axnet_tx_timeout - handle transmit time out condition
  * @dev: network device which has apparently fallen asleep
  *
  * Called by kernel when device never acknowledges a transmit has
  * completed (or failed) - i.e. never posted a Tx related interrupt.
  */
 
-static void ei_tx_timeout(struct net_device *dev)
+static void axnet_tx_timeout(struct net_device *dev)
 {
 	long e8390_base = dev->base_addr;
 	struct ei_device *ei_local = (struct ei_device *) netdev_priv(dev);
@@ -1045,14 +1045,14 @@ static void ei_tx_timeout(struct net_device *dev)
 }
     
 /**
- * ei_start_xmit - begin packet transmission
+ * axnet_start_xmit - begin packet transmission
  * @skb: packet to be sent
  * @dev: network device to which packet is sent
  *
  * Sends a packet to an 8390 network device.
  */
  
-static int ei_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static int axnet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	long e8390_base = dev->base_addr;
 	struct ei_device *ei_local = (struct ei_device *) netdev_priv(dev);
@@ -1718,7 +1718,7 @@ static void axdev_setup(struct net_device *dev)
 	ei_local = (struct ei_device *)netdev_priv(dev);
 	spin_lock_init(&ei_local->page_lock);
     
-	dev->hard_start_xmit = &ei_start_xmit;
+	dev->hard_start_xmit = &axnet_start_xmit;
 	dev->get_stats	= get_stats;
 	dev->set_multicast_list = &set_multicast_list;
 
-- 
1.5.6.5
