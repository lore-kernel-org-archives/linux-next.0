From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Thu, 2 Nov 2017 19:10:19 +1100
Message-ID: <20171102191019.13107683@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Sasha Levin <alexander.levin@verizon.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  net/ipv4/tcp_input.c

between commit:

  c92e8c02fe66 ("tcp/dccp: fix ireq->opt races")

from Linus' tree and commit:

  8a3e1a11b8af ("kmemcheck: remove annotations")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/ipv4/tcp_input.c
index e7a426ceafca,4d2e31273a25..000000000000
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@@ -6179,8 -6195,7 +6179,7 @@@ struct request_sock *inet_reqsk_alloc(c
  	if (req) {
  		struct inet_request_sock *ireq = inet_rsk(req);
  
- 		kmemcheck_annotate_bitfield(ireq, flags);
 -		ireq->opt = NULL;
 +		ireq->ireq_opt = NULL;
  #if IS_ENABLED(CONFIG_IPV6)
  		ireq->pktopts = NULL;
  #endif
