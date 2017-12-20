From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Thu, 21 Dec 2017 10:43:04 +1100
Message-ID: <20171221104304.38f94a00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53391 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755711AbdLTXnG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Dec 2017 18:43:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, Daniel Borkmann <daniel@iogearbox.net>

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/netdevsim/bpf.c: In function 'nsim_bpf_setup_tc_block_cb':
drivers/net/netdevsim/bpf.c:127:7: error: 'TC_CLSBPF_REPLACE' undeclared (first use in this function)
  case TC_CLSBPF_REPLACE:
       ^
drivers/net/netdevsim/bpf.c:129:7: error: 'TC_CLSBPF_ADD' undeclared (first use in this function)
  case TC_CLSBPF_ADD:
       ^
drivers/net/netdevsim/bpf.c:131:7: error: 'TC_CLSBPF_DESTROY' undeclared (first use in this function)
  case TC_CLSBPF_DESTROY:
       ^

Caused by commit

  31d3ad832948 ("netdevsim: add bpf offload support")

interacting with commit

  102740bd9436 ("cls_bpf: fix offload assumptions after callback conversion")

from the net tree.

I applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 Dec 2017 10:18:46 +1100
Subject: [PATCH] netdevsim: fix up for "cls_bpf: fix offload assumptions after
 callback conversion"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/netdevsim/bpf.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index 7da814686ad9..afaf980bbbe7 100644
--- a/drivers/net/netdevsim/bpf.c
+++ b/drivers/net/netdevsim/bpf.c
@@ -123,16 +123,10 @@ int nsim_bpf_setup_tc_block_cb(enum tc_setup_type type,
 	if (prog && !prog->aux->offload && !ns->bpf_tc_non_bound_accept)
 		return -EOPNOTSUPP;
 
-	switch (cls_bpf->command) {
-	case TC_CLSBPF_REPLACE:
-		return nsim_bpf_offload(ns, prog, true);
-	case TC_CLSBPF_ADD:
-		return nsim_bpf_offload(ns, prog, false);
-	case TC_CLSBPF_DESTROY:
-		return nsim_bpf_offload(ns, NULL, true);
-	default:
+	if (cls_bpf->command != TC_CLSBPF_OFFLOAD)
 		return -EOPNOTSUPP;
-	}
+
+	return nsim_bpf_offload(ns, prog, cls_bpf->oldprog);
 }
 
 int nsim_bpf_disable_tc(struct netdevsim *ns)
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
