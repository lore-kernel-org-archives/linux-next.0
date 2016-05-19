From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the nfs tree
Date: Thu, 19 May 2016 11:53:57 +1000
Message-ID: <20160519115357.23f7e19d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38656 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753491AbcESByB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 21:54:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Bart Van Assche <bart.vanassche@sandisk.com>, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  net/sunrpc/xprtrdma/frwr_ops.c

between commit:

  55fdfce101a0 ("xprtrdma: Rename rpcrdma_frwr::sg and sg_nents")

from the nfs tree and commits:

  ff2ba9936591 ("IB/core: Add passing an offset into the SG to ib_map_mr_sg")
  9aa8b3217ed3 ("IB/core: Enhance ib_map_mr_sg()")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/sunrpc/xprtrdma/frwr_ops.c
index a192b91ad67e,94c3fa910b85..000000000000
--- a/net/sunrpc/xprtrdma/frwr_ops.c
+++ b/net/sunrpc/xprtrdma/frwr_ops.c
@@@ -450,10 -421,10 +450,10 @@@ frwr_op_map(struct rpcrdma_xprt *r_xprt
  		return -ENOMEM;
  	}
  
- 	n = ib_map_mr_sg(mr, frmr->fr_sg, frmr->fr_nents, PAGE_SIZE);
 -	n = ib_map_mr_sg(mr, frmr->sg, frmr->sg_nents, NULL, PAGE_SIZE);
 -	if (unlikely(n != frmr->sg_nents)) {
++	n = ib_map_mr_sg(mr, frmr->fr_sg, frmr->fr_nents, NULL, PAGE_SIZE);
 +	if (unlikely(n != frmr->fr_nents)) {
  		pr_err("RPC:       %s: failed to map mr %p (%u/%u)\n",
 -		       __func__, frmr->fr_mr, n, frmr->sg_nents);
 +		       __func__, frmr->fr_mr, n, frmr->fr_nents);
  		rc = n < 0 ? n : -EINVAL;
  		goto out_senderr;
  	}
