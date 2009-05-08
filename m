From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Fri, 8 May 2009 13:23:52 +1000
Message-ID: <20090508132352.4763ae91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58722 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753742AbZEHDXy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 23:23:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Eric Dumazet <dada1@cosmosbay.com>, Satoru SATOH <satoru.satoh@gmail.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
include/net/tcp.h between commit 0c266898b42fe4e4e2f9edfc9d3474c10f93aa6a
("tcp: Fix tcp_prequeue() to get correct rto_min value") from Linus' tree
and commit f5f8d86b231e0489c33542c42afbb14d32411ee8 ("tcp: tcp_prequeue()
cleanup") from the net tree.

I fixed it up (see below - please check) and can carry the fix for a
while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/net/tcp.h
index 646dbe3,87d210b..0000000
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@@ -889,30 -890,32 +902,32 @@@ static inline int tcp_prequeue(struct s
  {
  	struct tcp_sock *tp = tcp_sk(sk);
  
- 	if (!sysctl_tcp_low_latency && tp->ucopy.task) {
- 		__skb_queue_tail(&tp->ucopy.prequeue, skb);
- 		tp->ucopy.memory += skb->truesize;
- 		if (tp->ucopy.memory > sk->sk_rcvbuf) {
- 			struct sk_buff *skb1;
- 
- 			BUG_ON(sock_owned_by_user(sk));
- 
- 			while ((skb1 = __skb_dequeue(&tp->ucopy.prequeue)) != NULL) {
- 				sk_backlog_rcv(sk, skb1);
- 				NET_INC_STATS_BH(sock_net(sk), LINUX_MIB_TCPPREQUEUEDROPPED);
- 			}
- 
- 			tp->ucopy.memory = 0;
- 		} else if (skb_queue_len(&tp->ucopy.prequeue) == 1) {
- 			wake_up_interruptible(sk->sk_sleep);
- 			if (!inet_csk_ack_scheduled(sk))
- 				inet_csk_reset_xmit_timer(sk, ICSK_TIME_DACK,
- 						          (3 * tcp_rto_min(sk)) / 4,
- 							  TCP_RTO_MAX);
+ 	if (sysctl_tcp_low_latency || !tp->ucopy.task)
+ 		return 0;
+ 
+ 	__skb_queue_tail(&tp->ucopy.prequeue, skb);
+ 	tp->ucopy.memory += skb->truesize;
+ 	if (tp->ucopy.memory > sk->sk_rcvbuf) {
+ 		struct sk_buff *skb1;
+ 
+ 		BUG_ON(sock_owned_by_user(sk));
+ 
+ 		while ((skb1 = __skb_dequeue(&tp->ucopy.prequeue)) != NULL) {
+ 			sk_backlog_rcv(sk, skb1);
+ 			NET_INC_STATS_BH(sock_net(sk),
+ 					 LINUX_MIB_TCPPREQUEUEDROPPED);
  		}
- 		return 1;
+ 
+ 		tp->ucopy.memory = 0;
+ 	} else if (skb_queue_len(&tp->ucopy.prequeue) == 1) {
+ 		wake_up_interruptible_poll(sk->sk_sleep,
+ 					   POLLIN | POLLRDNORM | POLLRDBAND);
+ 		if (!inet_csk_ack_scheduled(sk))
+ 			inet_csk_reset_xmit_timer(sk, ICSK_TIME_DACK,
 -						  (3 * TCP_RTO_MIN) / 4,
++					          (3 * tcp_rto_min(sk)) / 4,
+ 						  TCP_RTO_MAX);
  	}
- 	return 0;
+ 	return 1;
  }
  
  
