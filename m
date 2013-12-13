From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH net-next] packet: fix using smp_processor_id() in
 preemptible code
Date: Fri, 13 Dec 2013 14:41:49 +0800
Message-ID: <1386916909.2614.7.camel@ThinkPad-T5421>
References: <1386828604.2584.13.camel@ThinkPad-T5421>
	 <52A83699.9010504@redhat.com>	<1386892503.2586.13.camel@ThinkPad-T5421>
	 <20131212081838.2d2eafb9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:57838 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306Ab3LMGmC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Dec 2013 01:42:02 -0500
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Fri, 13 Dec 2013 16:41:57 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 04C7B2BB0054
	for <linux-next@vger.kernel.org>; Fri, 13 Dec 2013 17:41:54 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rBD6NdJB6291966
	for <linux-next@vger.kernel.org>; Fri, 13 Dec 2013 17:23:39 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rBD6frXs000637
	for <linux-next@vger.kernel.org>; Fri, 13 Dec 2013 17:41:53 +1100
In-Reply-To: <20131212081838.2d2eafb9@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc: Daniel Borkmann <dborkman@redhat.com>, linux-next list <linux-next@vger.kernel.org>, brouer@redhat.com, davem@davemloft.net

On Thu, 2013-12-12 at 08:18 +0100, Jesper Dangaard Brouer wrote:
> On Fri, 13 Dec 2013 07:55:03 +0800 Li Zhong <zhong@linux.vnet.ibm.com> wrote:
> > On Wed, 2013-12-11 at 10:55 +0100, Daniel Borkmann wrote:
> > > On 12/12/2013 07:10 AM, Li Zhong wrote:
> [...]
> > > > Also, it seems that we could move skb_set_queue_mapping() into
> > > > packet_pick_tx_queue(), so we avoid calling it one more time
> > > > unnecessarily if we are going into the normal dev_queue_xmit() code
> > > > path.
> > > 
> > > I don't agree with that part, I think this can be also beneficiary for
> > > packets without direct xmit, as in PF_PACKET we don't have a notion of
> > > "flow" but just raw packets instead, and can keep the mapping local
> > > depending on the current CPU as we do queue setting elsewhere in the
> > > stack just as well.
> > 
> > It seems to me that the newly added xmit in packet_sock is
> > dev_queue_xmit() by default, and in this default case, dev_queue_xmit()
> > would call netdev_pick_tx(), which would set the skb queue_mapping again
> > to override the value based on the current CPU. 
> 
> Yes, I think you are right, that is also my experience with the code path.
> 
> > Or did I miss something here? 
> 
> A bit related; One thing I'm missing to understand, is why the
> RAW/PF_PACKET sockets have a NULL in skb->sk when they reach
> __netdev_pick_tx() ? (resulting in they cannot store/cache the queue in
> sk_tx_queue_set)

I checked the code, it seems skb->sk is not set in this code path (for
tcp, seems tcp_transmit_skb() sets it). 

Do you think we could set it here where skb_set_queue_mapping() is used,
so for this code path, we could also have it cached(but for devices
which define their queue selection method, it will not take effect)?
something like below: 

@@ -2219,7 +2219,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 			}
 		}
 
-		skb_set_queue_mapping(skb, packet_pick_tx_queue(dev));
+		skb->sk = (struct sock *)po;
 		skb->destructor = tpacket_destruct_skb;
 		__packet_set_status(po, ph, TP_STATUS_SENDING);
 		atomic_inc(&po->tx_ring.pending);
@@ -2429,7 +2429,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 	skb->dev = dev;
 	skb->priority = sk->sk_priority;
 	skb->mark = sk->sk_mark;
-	skb_set_queue_mapping(skb, packet_pick_tx_queue(dev));
+	skb->sk = sk;
 
 	if (po->has_vnet_hdr) {
 		if (vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
