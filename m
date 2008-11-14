From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 14 Nov 2008 16:06:38 +1100
Message-ID: <20081114160638.12340c65.sfr@canb.auug.org.au>
References: <20081114152054.e448fde8.sfr@canb.auug.org.au>
	<20081113.203059.225040990.davem@davemloft.net>
	<20081114153625.1ea7e841.sfr@canb.auug.org.au>
	<20081113.204121.09566067.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47614 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbYKNFGp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 00:06:45 -0500
In-Reply-To: <20081113.204121.09566067.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: rusty@rustcorp.com.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com, markmc@redhat.com

Hi Dave,

On Thu, 13 Nov 2008 20:41:21 -0800 (PST) David Miller <davem@davemloft.net> wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 14 Nov 2008 15:36:25 +1100
> 
> > The only issue would be if you have patches to remove/rename the netdev
> > priv field - they would have to be delayed until after Rusty's tree was
> > merged, or someone could submit a trivial patch to Linus to do that last
> > netdev_priv() conversion in virtio_net.c and you could both rebase/merge
> > that.
> 
> Another option is simply for Rusty to submit his virtio stuff
> through my tree.  I'm more than happy to take care of that
> as soon as Rusty can put the patches together.

I was about to send the below to Linus.  I will hold onto it for a couple
of days.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Rusty Russell <rusty@rustcorp.com.au>,
 netdev@vger.kernel.org
Subject: [PATCH] virtio: remove the last direct reference to the netdev priv field

This is to help with conflict resolution during the next merge window.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/virtio_net.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

Rusty, Dave, you will need to rebase/merge against Linus' tree after (if?)
this goes in.

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0196a0d..fce1854 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -125,7 +125,8 @@ static void receive_skb(struct net_device *dev, struct sk_buff *skb,
 		unsigned int i;
 
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)
-			give_a_page(dev->priv, skb_shinfo(skb)->frags[i].page);
+			give_a_page(netdev_priv(dev),
+				skb_shinfo(skb)->frags[i].page);
 		skb->data_len = 0;
 		skb_shinfo(skb)->nr_frags = 0;
 	}
-- 
1.5.6.5
