From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warning
Date: Mon, 07 Sep 2009 02:04:23 -0700 (PDT)
Message-ID: <20090907.020423.151248729.davem@davemloft.net>
References: <20090904144232.1f6ccf45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56903
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750935AbZIGJEI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 05:04:08 -0400
In-Reply-To: <20090904144232.1f6ccf45.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, shemminger@vyatta.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 4 Sep 2009 14:42:32 +1000

> Today's linux-next build (x86_64 allmodconfig gcc-4.4.0) produced this warning:
> 
> drivers/net/r8169.c: In function 'rtl8169_start_xmit':
> drivers/net/r8169.c:3421: warning: label 'out' defined but not used
> 
> Introduced by commit 61357325f377889a1daffa14962d705dc814dd0e ("netdev:
> convert bulk of drivers to netdev_tx_t").

Thanks for the report, I'll commit the fix below.

Also, Stephen Hemminger has fixed the dlci WAN driver warning
you reported too.

r8169: Fix warning in rtl8169_start_xmit().

Reported by Stephen Rothwell:

drivers/net/r8169.c: In function 'rtl8169_start_xmit':
drivers/net/r8169.c:3421: warning: label 'out' defined but not used

Introduced by commit 61357325f377889a1daffa14962d705dc814dd0e ("netdev:
convert bulk of drivers to netdev_tx_t").

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/r8169.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/r8169.c b/drivers/net/r8169.c
index a91e9b3..50c6a3c 100644
--- a/drivers/net/r8169.c
+++ b/drivers/net/r8169.c
@@ -3416,7 +3416,6 @@ static netdev_tx_t rtl8169_start_xmit(struct sk_buff *skb,
 			netif_wake_queue(dev);
 	}
 
-out:
 	return NETDEV_TX_OK;
 
 err_stop:
-- 
1.6.4.2
