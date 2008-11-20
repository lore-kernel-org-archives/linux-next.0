From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Thu, 20 Nov 2008 13:30:36 +1100
Message-ID: <20081120133036.3a4aea4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37037 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751570AbYKTCap (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 21:30:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

net/core/dev.c: In function 'net_dev_init':
net/core/dev.c:4775: error: implicit declaration of function 'netdev_dma_register'

A bad interaction between commit 505d4f73dda9e20d59da05008f1f5eb432613e71
"net: Guaranetee the proper ordering of the loopback device. v2" from the
net tree (which moved a call to netdev_dma_register) and commit
8f3da0d613494b02f8628bb5dbf2366f0298505c "dmaengine: kill struct
dma_client and supporting infrastructure" from the async_tx tree (which
removes the call).

I added the below patch to fix up the merge and can carry it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 97115a9dfb4eda07a4f581d46379de9f0f65f158 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Nov 2008 13:25:08 +1100
Subject: [PATCH] net: async_tx merge fix

---
 net/core/dev.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index c3f5713..e9cf36e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4772,8 +4772,6 @@ static int __init net_dev_init(void)
 	if (register_pernet_device(&default_device_ops))
 		goto out;
 
-	netdev_dma_register();
-
 	open_softirq(NET_TX_SOFTIRQ, net_tx_action);
 	open_softirq(NET_RX_SOFTIRQ, net_rx_action);
 
-- 
1.5.6.5
