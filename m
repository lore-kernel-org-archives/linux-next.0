From: Alex Williamson <alex.williamson@hp.com>
Subject: [PATCH] virtio_net: memset scatterlist before using
Date: Fri, 24 Apr 2009 08:37:03 -0600
Message-ID: <1240583823.16438.14.camel@lappy>
References: <20090423163847.200f227e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0006.atlanta.hp.com ([15.192.0.43]:32547 "EHLO
	g5t0006.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752769AbZDXOhH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2009 10:37:07 -0400
In-Reply-To: <20090423163847.200f227e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, LKML.netdev@vger.kernel.org

A powerpc gcc-4.4 build generates the following warnings:

drivers/net/virtio_net.c: In function 'virnet_vlan_rx_add_vid':
include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
drivers/net/virtio_net.c:746: note: 'sg' was declared here
drivers/net/virtio_net.c: In function 'virnet_vlan_rx_kill_vid':
include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
drivers/net/virtio_net.c:758: note: 'sg' was declared here

We need to clear the scatterlist before using it.  This sg entry will
get copied into another scatterlist before it's used, so memset it
rather than using sg_init_table or sg_init_one to avoid a bogus end
marker.

Signed-off-by: Alex Williamson <alex.williamson@hp.com>
--

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0718558..be1a9fe 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -745,6 +745,7 @@ static void virnet_vlan_rx_add_vid(struct net_device *dev, u16 vid)
 	struct virtnet_info *vi = netdev_priv(dev);
 	struct scatterlist sg;
 
+	memset(&sg, 0, sizeof(sg));
 	sg_set_buf(&sg, &vid, sizeof(vid));
 
 	if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_VLAN,
@@ -757,6 +758,7 @@ static void virnet_vlan_rx_kill_vid(struct net_device *dev, u16 vid)
 	struct virtnet_info *vi = netdev_priv(dev);
 	struct scatterlist sg;
 
+	memset(&sg, 0, sizeof(sg));
 	sg_set_buf(&sg, &vid, sizeof(vid));
 
 	if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_VLAN,
