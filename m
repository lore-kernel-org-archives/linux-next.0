From: Daniel Borkmann <dborkman@redhat.com>
Subject: Re: [RFC PATCH net-next] packet: fix using smp_processor_id() in
 preemptible code
Date: Wed, 11 Dec 2013 10:55:37 +0100
Message-ID: <52A83699.9010504@redhat.com>
References: <1386828604.2584.13.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:3990 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751030Ab3LKJzl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Dec 2013 04:55:41 -0500
In-Reply-To: <1386828604.2584.13.camel@ThinkPad-T5421>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, brouer@redhat.com, davem@davemloft.net

On 12/12/2013 07:10 AM, Li Zhong wrote:
> This patches tries to fix the following warning on next-1211 by
> replacing smp_processor_id() with raw_smp_processor_id().

I agree with that part. Please send a fix just replacing smp_processor_id()
into raw_smp_processor_id() for net-next to netdev directly.

> Also, it seems that we could move skb_set_queue_mapping() into
> packet_pick_tx_queue(), so we avoid calling it one more time
> unnecessarily if we are going into the normal dev_queue_xmit() code
> path.

I don't agree with that part, I think this can be also beneficiary for
packets without direct xmit, as in PF_PACKET we don't have a notion of
"flow" but just raw packets instead, and can keep the mapping local
depending on the current CPU as we do queue setting elsewhere in the
stack just as well.

> [   11.120893] BUG: using smp_processor_id() in preemptible [00000000] code: arping/3510
> [   11.120913] caller is .packet_sendmsg+0xc14/0xe68
> [   11.120920] CPU: 13 PID: 3510 Comm: arping Not tainted 3.13.0-rc3-next-20131211-dirty #1
> [   11.120926] Call Trace:
> [   11.120932] [c0000001f803f6f0] [c0000000000138dc] .show_stack+0x110/0x25c (unreliable)
> [   11.120942] [c0000001f803f7e0] [c00000000083dd24] .dump_stack+0xa0/0x37c
> [   11.120951] [c0000001f803f870] [c000000000493fd4] .debug_smp_processor_id+0xfc/0x12c
> [   11.120959] [c0000001f803f900] [c0000000007eba78] .packet_sendmsg+0xc14/0xe68
> [   11.120968] [c0000001f803fa80] [c000000000700968] .sock_sendmsg+0xa0/0xe0
> [   11.120975] [c0000001f803fbf0] [c0000000007014d8] .SyS_sendto+0x100/0x148
> [   11.120983] [c0000001f803fd60] [c0000000006fff10] .SyS_socketcall+0x1c4/0x2e8
> [   11.120990] [c0000001f803fe30] [c00000000000a1e4] syscall_exit+0x0/0x9c
>
> Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
> ---
>   net/packet/af_packet.c |   16 ++++++++--------
>   1 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 9d70f13..20f6d56 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -237,6 +237,13 @@ struct packet_skb_cb {
>   static void __fanout_unlink(struct sock *sk, struct packet_sock *po);
>   static void __fanout_link(struct sock *sk, struct packet_sock *po);
>
> +static u16 packet_pick_tx_queue(struct net_device *dev, struct sk_buff *skb)
> +{
> +	u16 queue_index = (u16)raw_smp_processor_id() % dev->real_num_tx_queues;
> +	skb_set_queue_mapping(skb, queue_index);
> +	return queue_index;
> +}
> +
>   static int packet_direct_xmit(struct sk_buff *skb)
>   {
>   	struct net_device *dev = skb->dev;
> @@ -259,7 +266,7 @@ static int packet_direct_xmit(struct sk_buff *skb)
>   		return NET_XMIT_DROP;
>   	}
>
> -	queue_map = skb_get_queue_mapping(skb);
> +	queue_map = packet_pick_tx_queue(dev, skb);
>   	txq = netdev_get_tx_queue(dev, queue_map);
>
>   	__netif_tx_lock_bh(txq);
> @@ -308,11 +315,6 @@ static bool packet_use_direct_xmit(const struct packet_sock *po)
>   	return po->xmit == packet_direct_xmit;
>   }
>
> -static u16 packet_pick_tx_queue(struct net_device *dev)
> -{
> -	return (u16) smp_processor_id() % dev->real_num_tx_queues;
> -}
> -
>   /* register_prot_hook must be invoked with the po->bind_lock held,
>    * or from a context in which asynchronous accesses to the packet
>    * socket is not possible (packet_create()).
> @@ -2219,7 +2221,6 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
>   			}
>   		}
>
> -		skb_set_queue_mapping(skb, packet_pick_tx_queue(dev));
>   		skb->destructor = tpacket_destruct_skb;
>   		__packet_set_status(po, ph, TP_STATUS_SENDING);
>   		atomic_inc(&po->tx_ring.pending);
> @@ -2429,7 +2430,6 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
>   	skb->dev = dev;
>   	skb->priority = sk->sk_priority;
>   	skb->mark = sk->sk_mark;
> -	skb_set_queue_mapping(skb, packet_pick_tx_queue(dev));
>
>   	if (po->has_vnet_hdr) {
>   		if (vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
>
>
