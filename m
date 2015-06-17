From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the rdma tree with the nfs tree
Date: Wed, 17 Jun 2015 13:19:25 +1000
Message-ID: <1434511165.24642.4.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38080 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751684AbbFQDT2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 23:19:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matan Barak <matanb@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Chuck Lever <chuck.lever@oracle.com>, Steve Wise <swise@opengridcomputing.com>, Devesh Sharma <"devesh.sha rma"@avagotech.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  net/sunrpc/xprtrdma/verbs.c

between commit:

  89e0d11258e9 "xprtrdma: Use ib_device pointer safely"

from the nfs tree and commit:

  8e37210b38fb "IB/core: Change ib_create_cq to use struct ib_cq_init_attr"

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc net/sunrpc/xprtrdma/verbs.c
index 234083560d0e,52df265b472a..000000000000
--- a/net/sunrpc/xprtrdma/verbs.c
+++ b/net/sunrpc/xprtrdma/verbs.c
@@@ -763,9 -692,9 +684,9 @@@ rpcrdma_ep_create(struct rpcrdma_ep *ep
  	init_waitqueue_head(&ep->rep_connect_wait);
  	INIT_DELAYED_WORK(&ep->rep_connect_worker, rpcrdma_connect_worker);
  
+ 	cq_attr.cqe = ep->rep_attr.cap.max_send_wr + 1;
 -	sendcq = ib_create_cq(ia->ri_id->device, rpcrdma_sendcq_upcall,
 -				  rpcrdma_cq_async_error_upcall, ep, &cq_attr);
 +	sendcq = ib_create_cq(ia->ri_device, rpcrdma_sendcq_upcall,
- 			      rpcrdma_cq_async_error_upcall, ep,
- 			      ep->rep_attr.cap.max_send_wr + 1, 0);
++			      rpcrdma_cq_async_error_upcall, ep, &cq_attr);
  	if (IS_ERR(sendcq)) {
  		rc = PTR_ERR(sendcq);
  		dprintk("RPC:       %s: failed to create send CQ: %i\n",
@@@ -780,9 -709,9 +701,9 @@@
  		goto out2;
  	}
  
+ 	cq_attr.cqe = ep->rep_attr.cap.max_recv_wr + 1;
 -	recvcq = ib_create_cq(ia->ri_id->device, rpcrdma_recvcq_upcall,
 -				  rpcrdma_cq_async_error_upcall, ep, &cq_attr);
 +	recvcq = ib_create_cq(ia->ri_device, rpcrdma_recvcq_upcall,
- 			      rpcrdma_cq_async_error_upcall, ep,
- 			      ep->rep_attr.cap.max_recv_wr + 1, 0);
++			      rpcrdma_cq_async_error_upcall, ep, &cq_attr);
  	if (IS_ERR(recvcq)) {
  		rc = PTR_ERR(recvcq);
  		dprintk("RPC:       %s: failed to create recv CQ: %i\n",
