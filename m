From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Thu, 22 Jan 2009 23:56:12 -0800 (PST)
Message-ID: <20090122.235612.256786187.davem@davemloft.net>
References: <20090123182847.718fdb85.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37121
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751957AbZAWH4K (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 02:56:10 -0500
In-Reply-To: <20090123182847.718fdb85.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Jan 2009 18:28:47 +1100

> drivers/net/arcnet/com20020-pci.o:(.bss+0x10): multiple definition of `com20020_netdev_ops'
> drivers/net/arcnet/com20020.o:(.data.rel.ro+0x0): first defined here
> 
> The immediate cause is commit a1799af4d7deefccdaa9d222a886fa1373dbb49a
> ("com20020: convert to net_devic_ops") which I have reverted for today.

Does this patch fix it? I can't see any other way to end up
with a multiple definition like that.

diff --git a/include/linux/com20020.h b/include/linux/com20020.h
index 350afa7..5dcfb94 100644
--- a/include/linux/com20020.h
+++ b/include/linux/com20020.h
@@ -29,7 +29,7 @@
 
 int com20020_check(struct net_device *dev);
 int com20020_found(struct net_device *dev, int shared);
-const struct net_device_ops com20020_netdev_ops;
+extern const struct net_device_ops com20020_netdev_ops;
 
 /* The number of low I/O ports used by the card. */
 #define ARCNET_TOTAL_SIZE 8
