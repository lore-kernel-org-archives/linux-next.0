From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Sun, 1 Nov 2015 18:48:15 +1100
Message-ID: <20151101184815.1c854867@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43806 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751047AbbKAHsT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 02:48:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sagi Grimberg <sagig@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, "J. Bruce Fields" <bfields@redhat.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  net/sunrpc/xprtrdma/svc_rdma_recvfrom.c

between commit:

  c91aed989694 ("svcrdma: handle rdma read with a non-zero initial page offset")

from Linus' tree and commit:

  412a15c0fe53 ("svcrdma: Port to new memory registration API")

from the rdma tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
index f0c3ff67ca98,cb0991345816..000000000000
--- a/net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
@@@ -235,17 -234,14 +235,14 @@@ int rdma_read_chunk_frmr(struct svcxprt
  
  	ctxt->direction = DMA_FROM_DEVICE;
  	ctxt->frmr = frmr;
- 	pages_needed = min_t(int, pages_needed, xprt->sc_frmr_pg_list_len);
- 	read = min_t(int, (pages_needed << PAGE_SHIFT) - *page_offset,
- 		     rs_length);
+ 	nents = min_t(unsigned int, nents, xprt->sc_frmr_pg_list_len);
 -	read = min_t(int, nents << PAGE_SHIFT, rs_length);
++	read = min_t(int, (nents << PAGE_SHIFT) - *page_offset, rs_length);
  
- 	frmr->kva = page_address(rqstp->rq_arg.pages[pg_no]);
  	frmr->direction = DMA_FROM_DEVICE;
  	frmr->access_flags = (IB_ACCESS_LOCAL_WRITE|IB_ACCESS_REMOTE_WRITE);
- 	frmr->map_len = pages_needed << PAGE_SHIFT;
- 	frmr->page_list_len = pages_needed;
+ 	frmr->sg_nents = nents;
  
- 	for (pno = 0; pno < pages_needed; pno++) {
+ 	for (pno = 0; pno < nents; pno++) {
  		int len = min_t(int, rs_length, PAGE_SIZE - pg_off);
  
  		head->arg.pages[pg_no] = rqstp->rq_arg.pages[pg_no];
