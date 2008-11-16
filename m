From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: next-20081114 build failure
Date: Sun, 16 Nov 2008 12:42:19 -0800 (PST)
Message-ID: <20081116.124219.247386006.davem@davemloft.net>
References: <20081116223612.02c1c06f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57084
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752287AbYKPUmU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 15:42:20 -0500
In-Reply-To: <20081116223612.02c1c06f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, wangchen@cn.fujitsu.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 16 Nov 2008 22:36:12 +1100

> Today's linux-next build (mips allmodconfig) failed like this:
> 
> drivers/net/dm9000.c:1450: error: expected ')' before ';' token
> drivers/net/dm9000.c:1455: error: expected ';' before '}' token

I just checked the following fix into net-next-2.6

Let me know if it doesn't work

dm9000: Fix build error.

Reported by Stephen Rothwell:

drivers/net/dm9000.c:1450: error: expected ')' before ';' token
drivers/net/dm9000.c:1455: error: expected ';' before '}' token

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/dm9000.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/dm9000.c b/drivers/net/dm9000.c
index 0d9a217..bcf9291 100644
--- a/drivers/net/dm9000.c
+++ b/drivers/net/dm9000.c
@@ -1447,7 +1447,7 @@ dm9000_drv_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	unregister_netdev(ndev);
-	dm9000_release_board(pdev, (board_info_t *) netdev_priv(ndev);
+	dm9000_release_board(pdev, (board_info_t *) netdev_priv(ndev));
 	free_netdev(ndev);		/* free device structure */
 
 	dev_dbg(&pdev->dev, "released and freed device\n");
-- 
1.5.6.5
