From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hdlc tree build failure
Date: Thu, 14 Aug 2008 15:37:32 +1000
Message-ID: <20080814153732.63307d0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58003 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750843AbYHNFhi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 01:37:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org

Hi Krzysztof,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/wan/hdlc_ppp.c: In function 'ppp_cp_parse_cr':
drivers/net/wan/hdlc_ppp.c:384: error: 'struct hdlc_device' has no member named 'stats'
drivers/net/wan/hdlc_ppp.c:390: error: 'struct hdlc_device' has no member named 'stats'
drivers/net/wan/hdlc_ppp.c: In function 'ppp_rx':
drivers/net/wan/hdlc_ppp.c:552: error: 'struct hdlc_device' has no member named 'stats'

Caused by commit 198191c4a7ce4daba379608fb38b9bc5a4eedc61 ("WAN: convert
drivers to use built-in netdev_stats") from Linus' tree interacting with
commit 2c7275708f373ac387352f13e509fd0c7679e12c ("WAN: new synchronous
PPP implementation for generic HDLC").

I have to wonder if this was even build tested ...

I added the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 14 Aug 2008 15:34:53 +1000
Subject: [PATCH] hdlc_ppp: fix up for move of stats pointer

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wan/hdlc_ppp.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wan/hdlc_ppp.c b/drivers/net/wan/hdlc_ppp.c
index b0a63be..72fae21 100644
--- a/drivers/net/wan/hdlc_ppp.c
+++ b/drivers/net/wan/hdlc_ppp.c
@@ -381,13 +381,13 @@ static void ppp_cp_parse_cr(struct net_device *dev, u16 pid, u8 id,
 	unsigned int nak_len = 0, rej_len = 0;
 
 	if (!(out = kmalloc(len, GFP_ATOMIC))) {
-		dev_to_hdlc(dev)->stats.rx_dropped++;
+		dev->stats.rx_dropped++;
 		return;	/* out of memory, ignore CR packet */
 	}
 
 	for (opt = data; len; len -= opt[1], opt += opt[1]) {
 		if (len < 2 || len < opt[1]) {
-			dev_to_hdlc(dev)->stats.rx_errors++;
+			dev->stats.rx_errors++;
 			return; /* bad packet, drop silently */
 		}
 
@@ -549,7 +549,7 @@ static int ppp_rx(struct sk_buff *skb)
 	goto out;
 
 rx_error:
-	dev_to_hdlc(dev)->stats.rx_errors++;
+	dev->stats.rx_errors++;
 out:
 	spin_unlock_irqrestore(&ppp->lock, flags);
 	dev_kfree_skb_any(skb);
-- 
1.5.6.3
