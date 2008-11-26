From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Wed, 26 Nov 2008 18:15:43 +1100
Message-ID: <20081126181543.0d7fba17.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55852 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751954AbYKZHQA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 02:16:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Patrick McHardy <kaber@trash.net>, Alexey Dobriyan <adobriyan@gmail.com>

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

net/bridge/br_netfilter.c:112: error: unknown field 'entry_size' specified in initializer
net/bridge/br_netfilter.c:112: warning: initialization makes pointer from integer without a cast

Caused by commit 631339f1e544a4d39a63cfe6708c5bddcd5a2c48 ("bridge:
netfilter: fix update_pmtu crash with GRE") from the net-current tree
interacting with commit 6bb3ce25d05f2990c8a19adaf427531430267c1f ("net:
remove struct dst_entry::entry_size") from the net tree.

I added the below patch as a temporary merge fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/net/bridge/br_netfilter.c b/net/bridge/br_netfilter.c
index 0b3cd89..274194b 100644
--- a/net/bridge/br_netfilter.c
+++ b/net/bridge/br_netfilter.c
@@ -109,7 +109,6 @@ static struct dst_ops fake_dst_ops = {
 	.family =		AF_INET,
 	.protocol =		__constant_htons(ETH_P_IP),
 	.update_pmtu =		fake_update_pmtu,
-	.entry_size =		sizeof(struct rtable),
 	.entries =		ATOMIC_INIT(0),
 };
 
-- 
1.5.6.5
