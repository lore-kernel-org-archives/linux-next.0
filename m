From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Fri, 14 Nov 2008 15:13:17 +1100
Message-ID: <20081114151317.8ab89475.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56254 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751160AbYKNENZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 23:13:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Wang Chen <wangchen@cn.fujitsu.com>, "David S. Miller" <davem@davemloft.net>, Mark McLoughlin <markmc@redhat.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/net/virtio_net.c between commit
8f15ea42b64941001a401cf855a0869e24f3a845 ("netdevice: safe convert to
netdev_priv() #part-3") from the net tree and commits
59c738ddde6c8661e70fb48ca5604cefed77da48 ("virtio_net: Recycle some more
rx buffer pages") and 6de41d64eb3558a4fca25f225f931e2ca7d419ab
("virtio_net: Improve the recv buffer allocation scheme") from the rr
tree.

I fixed it up (see below) and can carry the fix.  However, netdev_priv()
should be being used in the rr tree as it already exists in Linus' tree
and is used elsewhere in virtio_net.c.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/virtio_net.c
index ede0a80,79b59cc..0000000
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@@ -111,8 -120,10 +120,10 @@@ static void skb_xmit_done(struct virtqu
  static void receive_skb(struct net_device *dev, struct sk_buff *skb,
  			unsigned len)
  {
 -	struct virtnet_info *vi = dev->priv;
++	struct virtnet_info *vi = netdev_priv(dev);
  	struct virtio_net_hdr *hdr = skb_vnet_hdr(skb);
  	int err;
+ 	int i;
  
  	if (unlikely(len < sizeof(struct virtio_net_hdr) + ETH_HLEN)) {
  		pr_debug("%s: short packet %i\n", dev->name, len);
@@@ -326,10 -454,10 +454,8 @@@ static int xmit_skb(struct virtnet_inf
  
  	sg_init_table(sg, 2+MAX_SKB_FRAGS);
  
 -	pr_debug("%s: xmit %p " MAC_FMT "\n", vi->dev->name, skb,
 -		 dest[0], dest[1], dest[2],
 -		 dest[3], dest[4], dest[5]);
 +	pr_debug("%s: xmit %p %pM\n", vi->dev->name, skb, dest);
  
- 	/* Encode metadata header at front. */
- 	hdr = skb_vnet_hdr(skb);
  	if (skb->ip_summed == CHECKSUM_PARTIAL) {
  		hdr->flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
  		hdr->csum_start = skb->csum_start - skb_headroom(skb);
