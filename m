From: Jesper Dangaard Brouer <jbrouer@redhat.com>
Subject: Re: [RFC PATCH net-next] packet: fix using smp_processor_id() in
 preemptible code
Date: Thu, 12 Dec 2013 08:18:38 +0100
Message-ID: <20131212081838.2d2eafb9@redhat.com>
References: <1386828604.2584.13.camel@ThinkPad-T5421>
	<52A83699.9010504@redhat.com>
	<1386892503.2586.13.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:6159 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751831Ab3LLHSq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Dec 2013 02:18:46 -0500
In-Reply-To: <1386892503.2586.13.camel@ThinkPad-T5421>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: Daniel Borkmann <dborkman@redhat.com>, linux-next list <linux-next@vger.kernel.org>, brouer@redhat.com, davem@davemloft.net


On Fri, 13 Dec 2013 07:55:03 +0800 Li Zhong <zhong@linux.vnet.ibm.com> wrote:
> On Wed, 2013-12-11 at 10:55 +0100, Daniel Borkmann wrote:
> > On 12/12/2013 07:10 AM, Li Zhong wrote:
[...]
> > > Also, it seems that we could move skb_set_queue_mapping() into
> > > packet_pick_tx_queue(), so we avoid calling it one more time
> > > unnecessarily if we are going into the normal dev_queue_xmit() code
> > > path.
> > 
> > I don't agree with that part, I think this can be also beneficiary for
> > packets without direct xmit, as in PF_PACKET we don't have a notion of
> > "flow" but just raw packets instead, and can keep the mapping local
> > depending on the current CPU as we do queue setting elsewhere in the
> > stack just as well.
> 
> It seems to me that the newly added xmit in packet_sock is
> dev_queue_xmit() by default, and in this default case, dev_queue_xmit()
> would call netdev_pick_tx(), which would set the skb queue_mapping again
> to override the value based on the current CPU. 

Yes, I think you are right, that is also my experience with the code path.

> Or did I miss something here? 

A bit related; One thing I'm missing to understand, is why the
RAW/PF_PACKET sockets have a NULL in skb->sk when they reach
__netdev_pick_tx() ? (resulting in they cannot store/cache the queue in
sk_tx_queue_set)

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Sr. Network Kernel Developer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer
