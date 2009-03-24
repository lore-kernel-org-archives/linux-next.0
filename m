From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the infiniband tree
Date: Tue, 24 Mar 2009 13:31:47 +1100
Message-ID: <20090324133147.d73c2987.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39745 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752218AbZCXCbw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 22:31:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Roland Dreier <rolandd@cisco.com>
Cc: linux-next@vger.kernel.org, Faisal Latif <faisal.latif@intel.com>, Stephen Hemminger <shemminger@vyatta.com>

Hi Dave, Roland,

Today's linux-next merge of the net tree got a conflict in
drivers/infiniband/hw/nes/nes_nic.c between commit
2869975cfbd58dc6591d8c3ba1f171e7f758be28 ("RDMA/nes: Remove LLTX") from
the infiniband tree and commit d0929553bebcac828b612e7d6d239559e08feaf4
("infiniband: convert nes driver to net_device_ops") from the net tree.

Just a trivial context change (the commits deleted lines next to each
other).  I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/infiniband/hw/nes/nes_nic.c
index 025ed9f,ae8c688..0000000
--- a/drivers/infiniband/hw/nes/nes_nic.c
+++ b/drivers/infiniband/hw/nes/nes_nic.c
@@@ -1598,9 -1618,10 +1601,9 @@@ struct net_device *nes_netdev_init(stru
  	netif_napi_add(netdev, &nesvnic->napi, nes_netdev_poll, 128);
  	nes_debug(NES_DBG_INIT, "Enabling VLAN Insert/Delete.\n");
  	netdev->features |= NETIF_F_HW_VLAN_TX | NETIF_F_HW_VLAN_RX;
- 	netdev->vlan_rx_register = nes_netdev_vlan_rx_register;
 -	netdev->features |= NETIF_F_LLTX;
  
  	/* Fill in the port structure */
+ 	nesvnic = netdev_priv(netdev);
  	nesvnic->netdev = netdev;
  	nesvnic->nesdev = nesdev;
  	nesvnic->msg_enable = netif_msg_init(debug, default_msg);
