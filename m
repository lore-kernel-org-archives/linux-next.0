From: Patrick McHardy <kaber@trash.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Thu, 10 Jul 2008 14:11:06 +0200
Message-ID: <4875FC5A.7000109@trash.net>
References: <20080710140212.753c3bce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030601050101090105070105"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from stinky.trash.net ([213.144.137.162]:58789 "EHLO
	stinky.trash.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbYGJMLJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jul 2008 08:11:09 -0400
In-Reply-To: <20080710140212.753c3bce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------030601050101090105070105
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> net/netfilter/nf_conntrack_proto_tcp.c between commit
> 6b69fe0c73c0f5a8dacf8f889db3cc9adee53649 ("netfilter: nf_conntrack_tcp:
> fix endless loop") from the net-current tree and commit
> 51091764f26ec36c02e35166f083193a30f426fc ("netfilter: nf_conntrack: add
> nf_ct_kill()") from the net tree.
> 
> Not a simple fixup.  I did what I thought was right, please check.
> 
> The conflict was in tcp_packet() and looked like this:
> 
> 		if (((ct->proto.tcp.seen[dir].flags
> 		      | ct->proto.tcp.seen[!dir].flags)
> 		     & IP_CT_TCP_FLAG_CLOSE_INIT)
> 		    || (ct->proto.tcp.last_dir == dir
> 		        && ct->proto.tcp.last_index == TCP_RST_SET)) {
> 			/* Attempt to reopen a closed/aborted connection.
> 			 * Delete this connection and look up again. */
> 			write_unlock_bh(&tcp_lock);
> <<<<<<< HEAD:net/netfilter/nf_conntrack_proto_tcp.c
> 			/* Only repeat if we can actually remove the timer.
> 			 * Destruction may already be in progress in process
> 			 * context and we must give it a chance to terminate.
> 			 */
> 			if (del_timer(&ct->timeout)) {
> 				ct->timeout.function((unsigned long)ct);
> 				return -NF_REPEAT;
> 			}
> 			return -NF_DROP;
> =======
> 			nf_ct_kill(ct);
> 			return -NF_REPEAT;
>>>>>>>> net/master:net/netfilter/nf_conntrack_proto_tcp.c
> 		}
> 		/* Fall through */
> 	case TCP_CONNTRACK_IGNORE:
> 
> I used the HEAD version.  You may need to return a value from nf_ct_kill()
> indicating if the timer was deleted to fix this properly.

Indeed. The attached against net-next does this.


--------------030601050101090105070105
Content-Type: text/plain;
 name="x"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="x"

commit 6b672c85d01e46b3fddf6c4285330df98a90d462
Author: Patrick McHardy <kaber@trash.net>
Date:   Thu Jul 10 14:10:04 2008 +0200

    netfilter: nf_conntrack_tcp: fix endless loop
    
    When a conntrack entry is destroyed in process context and destruction
    is interrupted by packet processing and the packet is an attempt to
    reopen a closed connection, TCP conntrack tries to kill the old entry
    itself and returns NF_REPEAT to pass the packet through the hook
    again. This may lead to an endless loop: TCP conntrack repeatedly
    finds the old entry, but can not kill it itself since destruction
    is already in progress, but destruction in process context can not
    complete since TCP conntrack is keeping the CPU busy.
    
    Drop the packet in TCP conntrack if we can't kill the connection
    ourselves to avoid this.
    
    Reported by: hemao77@gmail.com [ Kernel bugzilla #11058 ]
    Signed-off-by: Patrick McHardy <kaber@trash.net>

diff --git a/include/net/netfilter/nf_conntrack.h b/include/net/netfilter/nf_conntrack.h
index d5d76ec..4f367a0 100644
--- a/include/net/netfilter/nf_conntrack.h
+++ b/include/net/netfilter/nf_conntrack.h
@@ -223,23 +223,23 @@ static inline void nf_ct_refresh(struct nf_conn *ct,
 	__nf_ct_refresh_acct(ct, 0, skb, extra_jiffies, 0);
 }
 
-extern void __nf_ct_kill_acct(struct nf_conn *ct,
-				enum ip_conntrack_info ctinfo,
-				const struct sk_buff *skb,
-				int do_acct);
+extern int __nf_ct_kill_acct(struct nf_conn *ct,
+			     enum ip_conntrack_info ctinfo,
+			     const struct sk_buff *skb,
+			     int do_acct);
 
 /* kill conntrack and do accounting */
-static inline void nf_ct_kill_acct(struct nf_conn *ct,
-				enum ip_conntrack_info ctinfo,
-				const struct sk_buff *skb)
+static inline int nf_ct_kill_acct(struct nf_conn *ct,
+				  enum ip_conntrack_info ctinfo,
+				  const struct sk_buff *skb)
 {
-	__nf_ct_kill_acct(ct, ctinfo, skb, 1);
+	return __nf_ct_kill_acct(ct, ctinfo, skb, 1);
 }
 
 /* kill conntrack without accounting */
-static inline void nf_ct_kill(struct nf_conn *ct)
+static inline int nf_ct_kill(struct nf_conn *ct)
 {
-	__nf_ct_kill_acct(ct, 0, NULL, 0);
+	return __nf_ct_kill_acct(ct, 0, NULL, 0);
 }
 
 /* These are for NAT.  Icky. */
diff --git a/net/netfilter/nf_conntrack_proto_tcp.c b/net/netfilter/nf_conntrack_proto_tcp.c
index 740acd6..47f2516 100644
--- a/net/netfilter/nf_conntrack_proto_tcp.c
+++ b/net/netfilter/nf_conntrack_proto_tcp.c
@@ -844,8 +844,13 @@ static int tcp_packet(struct nf_conn *ct,
 			/* Attempt to reopen a closed/aborted connection.
 			 * Delete this connection and look up again. */
 			write_unlock_bh(&tcp_lock);
-			nf_ct_kill(ct);
-			return -NF_REPEAT;
+			/* Only repeat if we can actually remove the timer.
+			 * Destruction may already be in progress in process
+			 * context and we must give it a chance to terminate.
+			 */
+			if (nf_ct_kill(ct))
+				return -NF_REPEAT;
+			return -NF_DROP;
 		}
 		/* Fall through */
 	case TCP_CONNTRACK_IGNORE:

--------------030601050101090105070105--
