From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 16 Jan 2018 10:36:43 +1100
Message-ID: <20180116103643.56542126@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750716AbeAOXgp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jan 2018 18:36:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Maloney <maloney@google.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv6/ip6_output.c

between commit:

  749439bfac6e ("ipv6: fix udpv6 sendmsg crash caused by too small MTU")

from the net tree and commit:

  0f6c480f23f4 ("xfrm: Move dst->path into struct xfrm_dst")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/ipv6/ip6_output.c
index 4f7d8de56611,18547a44bdaf..000000000000
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@@ -1206,18 -1215,16 +1215,18 @@@ static int ip6_setup_cork(struct sock *
  	v6_cork->tclass = ipc6->tclass;
  	if (rt->dst.flags & DST_XFRM_TUNNEL)
  		mtu = np->pmtudisc >= IPV6_PMTUDISC_PROBE ?
 -		      rt->dst.dev->mtu : dst_mtu(&rt->dst);
 +		      READ_ONCE(rt->dst.dev->mtu) : dst_mtu(&rt->dst);
  	else
  		mtu = np->pmtudisc >= IPV6_PMTUDISC_PROBE ?
- 		      READ_ONCE(rt->dst.dev->mtu) : dst_mtu(rt->dst.path);
 -		      rt->dst.dev->mtu : dst_mtu(xfrm_dst_path(&rt->dst));
++		      READ_ONCE(rt->dst.dev->mtu) : dst_mtu(xfrm_dst_path(&rt->dst));
  	if (np->frag_size < mtu) {
  		if (np->frag_size)
  			mtu = np->frag_size;
  	}
 +	if (mtu < IPV6_MIN_MTU)
 +		return -EINVAL;
  	cork->base.fragsize = mtu;
- 	if (dst_allfrag(rt->dst.path))
+ 	if (dst_allfrag(xfrm_dst_path(&rt->dst)))
  		cork->base.flags |= IPCORK_ALLFRAG;
  	cork->base.length = 0;
  
