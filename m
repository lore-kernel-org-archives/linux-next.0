From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Wed, 3 Jun 2009 12:20:48 +1000
Message-ID: <20090603122048.f2b7fef2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48671 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754129AbZFCCzq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2009 22:55:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ed Swierk <eswierk@aristanetworks.com>, Ayaz Abdulla <aabdulla@nvidia.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/forcedeth.c between commit
5a9a8e32ebe269c71d8d3e78f9435fe7729f38e9 ("forcedeth: add phy_power_down
parameter, leave phy powered up by default (v2)") from Linus' tree and
commit 88d7d8b00cdc3117150faab4c4ace6d464b71c22 ("forcedeth: add clock
gating feature <resend>") from the net tree.

Just context changing.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/forcedeth.c
index 9f6a68f,d0b1d9f..0000000
--- a/drivers/net/forcedeth.c
+++ b/drivers/net/forcedeth.c
@@@ -5522,7 -5534,8 +5543,8 @@@ static int nv_close(struct net_device *
  
  	nv_drain_rxtx(dev);
  
 -	if (np->wolenabled) {
 +	if (np->wolenabled || !phy_power_down) {
+ 		nv_txrx_gate(dev, false);
  		writel(NVREG_PFF_ALWAYS|NVREG_PFF_MYADDR, base + NvRegPacketFilterFlags);
  		nv_start_rx(dev);
  	} else {
