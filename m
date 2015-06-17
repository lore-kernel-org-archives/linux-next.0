From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the rdma tree with the nfs tree
Date: Wed, 17 Jun 2015 13:17:18 +1000
Message-ID: <1434511038.24642.2.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54730 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752823AbbFQDRU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 23:17:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagi Grimberg <sagig@mellanox.com>, Anna Schumaker <anna.schumaker@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, Devesh Sharma <devesh.sharma@avagotech.com>Devesh Sharma <devesh.sharma@avagotech.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  net/sunrpc/xprtrdma/frwr_ops.c

between commit:

  951e721ca0d6 "xprtrdma: Introduce an FRMR recovery workqueue"

from the nfs tree and commit:

  76357c715f32 "xprtrdma, svcrdma: Switch to generic logging helpers"

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers

diff --cc net/sunrpc/xprtrdma/frwr_ops.c
index 661fbc1784ab,d234521320a4..000000000000
--- a/net/sunrpc/xprtrdma/frwr_ops.c
+++ b/net/sunrpc/xprtrdma/frwr_ops.c
@@@ -252,8 -128,8 +252,8 @@@ frwr_sendcompletion(struct ib_wc *wc
  
  	/* WARNING: Only wr_id and status are reliable at this point */
  	r = (struct rpcrdma_mw *)(unsigned long)wc->wr_id;
- 	pr_warn("RPC:       %s: frmr %p flushed, status %d\n",
- 		__func__, r, wc->status);
 -	dprintk("RPC:       %s: frmr %p (stale), status %s (%d)\n",
++	pr_warn("RPC:       %s: frmr %p flushed, status %s (%d)\n",
+ 		__func__, r, ib_wc_status_msg(wc->status), wc->status);
  	r->r.frmr.fr_state = FRMR_IS_STALE;
  }
  
