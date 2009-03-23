From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: wireless tree build failure
Date: Sun, 22 Mar 2009 21:55:41 -0700 (PDT)
Message-ID: <20090322.215541.205935147.davem@davemloft.net>
References: <20090323153954.95094b80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:36093
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751431AbZCWEzy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 00:55:54 -0400
In-Reply-To: <20090323153954.95094b80.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, yanghy@cn.fujitsu.com


Stephen does this fix the build for you?

I want to have you test it before I commit because unlike
some people I'd like to build test changes before submitting
them anywhere.

Yang, I am pretty pissed at you, this is beyond unforgivable.
There is zero excuse for this build regression.

Grumble!

diff --git a/drivers/net/spider_net.c b/drivers/net/spider_net.c
index 136d9f1..0288054 100644
--- a/drivers/net/spider_net.c
+++ b/drivers/net/spider_net.c
@@ -2260,18 +2260,18 @@ spider_net_tx_timeout(struct net_device *netdev)
 }
 
 static const struct net_device_ops spider_net_ops = {
-	.ndo_open		= spider_net_open;
-	.ndo_stop		= spider_net_stop;
-	.ndo_start_xmit		= spider_net_xmit;
-	.ndo_set_multicast_list	= spider_net_set_multi;
-	.ndo_set_mac_address	= spider_net_set_mac;
-	.ndo_change_mtu		= spider_net_change_mtu;
-	.ndo_do_ioctl		= spider_net_do_ioctl;
-	.ndo_tx_timeout		= spider_net_tx_timeout;
+	.ndo_open		= spider_net_open,
+	.ndo_stop		= spider_net_stop,
+	.ndo_start_xmit		= spider_net_xmit,
+	.ndo_set_multicast_list	= spider_net_set_multi,
+	.ndo_set_mac_address	= spider_net_set_mac,
+	.ndo_change_mtu		= spider_net_change_mtu,
+	.ndo_do_ioctl		= spider_net_do_ioctl,
+	.ndo_tx_timeout		= spider_net_tx_timeout,
 	/* HW VLAN */
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	/* poll controller */
-	.ndo_poll_controller	= spider_net_poll_controller;
+	.ndo_poll_controller	= spider_net_poll_controller,
 #endif /* CONFIG_NET_POLL_CONTROLLER */
 };
 
