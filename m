From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH net-next] packet: fix using smp_processor_id() in
 preemptible code
Date: Fri, 13 Dec 2013 15:40:21 +0800
Message-ID: <1386920421.2614.13.camel@ThinkPad-T5421>
References: <1386828604.2584.13.camel@ThinkPad-T5421>
	 <52A83699.9010504@redhat.com>	<1386892503.2586.13.camel@ThinkPad-T5421>
	 <20131212081838.2d2eafb9@redhat.com>
	 <1386916909.2614.7.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:60737 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153Ab3LMHke (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Dec 2013 02:40:34 -0500
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Fri, 13 Dec 2013 13:10:29 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id 86498394005C
	for <linux-next@vger.kernel.org>; Fri, 13 Dec 2013 13:10:26 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rBD7eLds56229960
	for <linux-next@vger.kernel.org>; Fri, 13 Dec 2013 13:10:22 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rBD7eN4S002685
	for <linux-next@vger.kernel.org>; Fri, 13 Dec 2013 13:10:24 +0530
In-Reply-To: <1386916909.2614.7.camel@ThinkPad-T5421>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc: Daniel Borkmann <dborkman@redhat.com>, linux-next list <linux-next@vger.kernel.org>, brouer@redhat.com, davem@davemloft.net

On Fri, 2013-12-13 at 14:41 +0800, Li Zhong wrote:
> On Thu, 2013-12-12 at 08:18 +0100, Jesper Dangaard Brouer wrote:
> > On Fri, 13 Dec 2013 07:55:03 +0800 Li Zhong <zhong@linux.vnet.ibm.com> wrote:
> > > On Wed, 2013-12-11 at 10:55 +0100, Daniel Borkmann wrote:
> > > > On 12/12/2013 07:10 AM, Li Zhong wrote:
> > [...]
> > > > > Also, it seems that we could move skb_set_queue_mapping() into
> > > > > packet_pick_tx_queue(), so we avoid calling it one more time
> > > > > unnecessarily if we are going into the normal dev_queue_xmit() code
> > > > > path.
> > > > 
> > > > I don't agree with that part, I think this can be also beneficiary for
> > > > packets without direct xmit, as in PF_PACKET we don't have a notion of
> > > > "flow" but just raw packets instead, and can keep the mapping local
> > > > depending on the current CPU as we do queue setting elsewhere in the
> > > > stack just as well.
> > > 
> > > It seems to me that the newly added xmit in packet_sock is
> > > dev_queue_xmit() by default, and in this default case, dev_queue_xmit()
> > > would call netdev_pick_tx(), which would set the skb queue_mapping again
> > > to override the value based on the current CPU. 
> > 
> > Yes, I think you are right, that is also my experience with the code path.
> > 
> > > Or did I miss something here? 
> > 
> > A bit related; One thing I'm missing to understand, is why the
> > RAW/PF_PACKET sockets have a NULL in skb->sk when they reach
> > __netdev_pick_tx() ? (resulting in they cannot store/cache the queue in
> > sk_tx_queue_set)
> 
> I checked the code, it seems skb->sk is not set in this code path (for
> tcp, seems tcp_transmit_skb() sets it). 
> 
> Do you think we could set it here where skb_set_queue_mapping() is used,
> so for this code path, we could also have it cached(but for devices
> which define their queue selection method, it will not take effect)?

Sorry, seems it will not take effect, as the sk_tx_queue_set/get logic
depends on sk->sk_dst_cache, which is used by tcp, connected udp ...

Not sure why we need this dependency ... 

Thanks, Zhong

> something like below: 
> 
> @@ -2219,7 +2219,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
>  			}
>  		}
>  
> -		skb_set_queue_mapping(skb, packet_pick_tx_queue(dev));
> +		skb->sk = (struct sock *)po;
>  		skb->destructor = tpacket_destruct_skb;
>  		__packet_set_status(po, ph, TP_STATUS_SENDING);
>  		atomic_inc(&po->tx_ring.pending);
> @@ -2429,7 +2429,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
>  	skb->dev = dev;
>  	skb->priority = sk->sk_priority;
>  	skb->mark = sk->sk_mark;
> -	skb_set_queue_mapping(skb, packet_pick_tx_queue(dev));
> +	skb->sk = sk;
>  
>  	if (po->has_vnet_hdr) {
>  		if (vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
> 
> 
> 
