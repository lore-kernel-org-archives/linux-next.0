From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 11:14:37 +1000
Message-ID: <20170714111437.69a6b100@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752456AbdGNBOk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Jul 2017 21:14:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Eli Cohen <eli@mellanox.com>

Hi Doug,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/infiniband/core/uverbs_cmd.c
  drivers/infiniband/core/verbs.c

between commit:

  d291f1a65232 ("IB/core: Enforce PKey security on QPs")

from Linus' tree and commits:

  c7c0fb974caa ("IB/core: Introduce modify QP operation with udata")
  5f4bc420f35f ("IB/uverbs: Make use of ib_modify_qp variant to avoid resolving DMAC")

from the rdma tree.

I fixed it up (I used the latter version of uverbs_cmd.c and see below)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/core/verbs.c
index c973a83c898b,8ece2aae033d..000000000000
--- a/drivers/infiniband/core/verbs.c
+++ b/drivers/infiniband/core/verbs.c
@@@ -1280,8 -1283,15 +1298,15 @@@ int ib_modify_qp_with_udata(struct ib_q
  		if (ret)
  			return ret;
  	}
 -	return qp->device->modify_qp(qp->real_qp, attr, attr_mask, udata);
++	return ib_security_modify_qp(qp->real_qp, attr, attr_mask, udata);
+ }
+ EXPORT_SYMBOL(ib_modify_qp_with_udata);
  
- 	return ib_security_modify_qp(qp->real_qp, qp_attr, qp_attr_mask, NULL);
+ int ib_modify_qp(struct ib_qp *qp,
+ 		 struct ib_qp_attr *qp_attr,
+ 		 int qp_attr_mask)
+ {
+ 	return ib_modify_qp_with_udata(qp, qp_attr, qp_attr_mask, NULL);
  }
  EXPORT_SYMBOL(ib_modify_qp);
  
