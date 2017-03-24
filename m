From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Fri, 24 Mar 2017 13:18:10 +1100
Message-ID: <20170324131810.0b70ebbf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934429AbdCXCSZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Mar 2017 22:18:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Richard Guy Briggs <rgb@redhat.com>

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  net/netfilter/xt_AUDIT.c

between commit:

  613dbd95723a ("netfilter: x_tables: move hook state into xt_action_param structure")

from Linus' tree and commit:

  36fe46d172e5 ("audit: normalize NETFILTER_PKT")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

P.S. You may want to consider a newer base for your tree ...
-- 
Cheers,
Stephen Rothwell

diff --cc net/netfilter/xt_AUDIT.c
index 19247a17e511,582ee54f6664..000000000000
--- a/net/netfilter/xt_AUDIT.c
+++ b/net/netfilter/xt_AUDIT.c
@@@ -131,39 -78,24 +78,24 @@@ audit_tg(struct sk_buff *skb, const str
  	if (ab == NULL)
  		goto errout;
  
- 	audit_log_format(ab, "action=%hhu hook=%u len=%u inif=%s outif=%s",
- 			 info->type, xt_hooknum(par), skb->len,
- 			 xt_in(par) ? xt_inname(par) : "?",
- 			 xt_out(par) ? xt_outname(par) : "?");
- 
- 	if (skb->mark)
- 		audit_log_format(ab, " mark=%#x", skb->mark);
- 
- 	if (skb->dev && skb->dev->type == ARPHRD_ETHER) {
- 		audit_log_format(ab, " smac=%pM dmac=%pM macproto=0x%04x",
- 				 eth_hdr(skb)->h_source, eth_hdr(skb)->h_dest,
- 				 ntohs(eth_hdr(skb)->h_proto));
- 
- 		if (xt_family(par) == NFPROTO_BRIDGE) {
- 			switch (eth_hdr(skb)->h_proto) {
- 			case htons(ETH_P_IP):
- 				audit_ip4(ab, skb);
- 				break;
- 
- 			case htons(ETH_P_IPV6):
- 				audit_ip6(ab, skb);
- 				break;
- 			}
- 		}
- 	}
+ 	audit_log_format(ab, "mark=%#x", skb->mark);
  
 -	switch (par->family) {
 +	switch (xt_family(par)) {
+ 	case NFPROTO_BRIDGE:
+ 		switch (eth_hdr(skb)->h_proto) {
+ 		case htons(ETH_P_IP):
+ 			fam = audit_ip4(ab, skb) ? NFPROTO_IPV4 : -1;
+ 			break;
+ 		case htons(ETH_P_IPV6):
+ 			fam = audit_ip6(ab, skb) ? NFPROTO_IPV6 : -1;
+ 			break;
+ 		}
+ 		break;
  	case NFPROTO_IPV4:
- 		audit_ip4(ab, skb);
+ 		fam = audit_ip4(ab, skb) ? NFPROTO_IPV4 : -1;
  		break;
- 
  	case NFPROTO_IPV6:
- 		audit_ip6(ab, skb);
+ 		fam = audit_ip6(ab, skb) ? NFPROTO_IPV6 : -1;
  		break;
  	}
  
