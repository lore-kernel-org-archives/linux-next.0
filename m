From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: linux-next: net tree build failure
Date: Mon, 20 Apr 2009 05:36:20 +0400
Message-ID: <20090420013620.GA16456@orion>
References: <20090420112629.370c209b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.156]:38648 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbZDTBga (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Apr 2009 21:36:30 -0400
Received: by fg-out-1718.google.com with SMTP id 22so189056fge.17
        for <linux-next@vger.kernel.org>; Sun, 19 Apr 2009 18:36:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20090420112629.370c209b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, Apr 20, 2009 at 11:26:29AM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/net/iseries_veth.c: In function 'veth_probe_one':
> drivers/net/iseries_veth.c:1080: error: 'struct net_device' has no member named 'netdev'
> 
> Caused by commit c2775360e82760be3ad7339a7a1442c45c35b395 ("iseries_veth:
> convert to net_device_ops").
> 
> I have used the net tree from next-20090417 for today.

Thanks and sorry.

>From bb142d6f89c99892156bb104a6f0d6f7392bf8b7 Mon Sep 17 00:00:00 2001
From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Mon, 20 Apr 2009 05:33:04 +0400
Subject: [PATCH] iseries_veth: fix build breakage


Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/net/iseries_veth.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/iseries_veth.c b/drivers/net/iseries_veth.c
index 264654d..e44215c 100644
--- a/drivers/net/iseries_veth.c
+++ b/drivers/net/iseries_veth.c
@@ -1077,7 +1077,7 @@ static struct net_device *veth_probe_one(int vlan,
 
 	memcpy(&port->mac_addr, mac_addr, ETH_ALEN);
 
-	dev->netdev = &veth_netdev_ops;
+	dev->netdev_ops = &veth_netdev_ops;
 	SET_ETHTOOL_OPS(dev, &ops);
 
 	SET_NETDEV_DEV(dev, vdev);
-- 
1.6.2.3
