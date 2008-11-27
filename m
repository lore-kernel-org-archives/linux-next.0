From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 27 Nov 2008 14:40:43 +1100
Message-ID: <20081127144043.6cba4a7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43945 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbYK0DlA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 22:41:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Hemminger <shemminger@vyatta.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/hp-plus.c between commit
1d71da164d7fb40fac72c0406a4a531265916fc8 ("net: hp-plus uses eip_poll")
from the net-current tree and commit
d4a97d425c2f59849ebdcc94281ecf108818efbf ("hp-plus: convert to
net_device_ops") from the net tree.

The fixed it up (see below) but assume it will be fixed soon in the net
tree.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/hp-plus.c
index c01e290,c34411c..0000000
--- a/drivers/net/hp-plus.c
+++ b/drivers/net/hp-plus.c
@@@ -158,6 -158,21 +158,21 @@@ out
  }
  #endif
  
+ static const struct net_device_ops hpp_netdev_ops = {
+ 	.ndo_open		= hpp_open,
+ 	.ndo_stop		= hpp_close,
+ 	.ndo_start_xmit		= ei_start_xmit,
+ 	.ndo_tx_timeout		= ei_tx_timeout,
+ 	.ndo_get_stats		= ei_get_stats,
+ 	.ndo_set_multicast_list = ei_set_multicast_list,
+ 	.ndo_validate_addr	= eth_validate_addr,
+ 	.ndo_change_mtu		= eth_change_mtu,
+ #ifdef CONFIG_NET_POLL_CONTROLLER
 -	.ndo_poll_controller	= ei_poll,
++	.ndo_poll_controller	= eip_poll,
+ #endif
+ };
+ 
+ 
  /* Do the interesting part of the probe at a single address. */
  static int __init hpp_probe1(struct net_device *dev, int ioaddr)
  {
