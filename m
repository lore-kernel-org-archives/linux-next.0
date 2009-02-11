From: Steve Wise <swise@opengridcomputing.com>
Subject: [PATCH 2.6.30] RDMA/cxgb3: remove modulo math from build_rdma_recv().
Date: Wed, 11 Feb 2009 16:29:15 -0600
Message-ID: <20090211222915.19520.22647.stgit@dell3.ogc.int>
Content-Type: text/plain; charset=utf-8; format=fixed
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.opengridcomputing.com ([209.198.142.2]:35396 "EHLO
	smtp.opengridcomputing.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751555AbZBKW3Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Feb 2009 17:29:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdreier@cisco.com
Cc: general@lists.openfabrics.org, randy.dunlap@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Steve Wise <swise@opengridcomputing.com>

- remove modulo usage

Signed-off-by: Steve Wise <swise@opengridcomputing.com>
---

 drivers/infiniband/hw/cxgb3/iwch_qp.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb3/iwch_qp.c b/drivers/infiniband/hw/cxgb3/iwch_qp.c
index c2b3cf7..bf549ed 100644
--- a/drivers/infiniband/hw/cxgb3/iwch_qp.c
+++ b/drivers/infiniband/hw/cxgb3/iwch_qp.c
@@ -263,8 +263,8 @@ static int build_rdma_recv(struct iwch_qp *qhp, union t3_wr *wqe,
 		wqe->recv.sgl[i].len = cpu_to_be32(wr->sg_list[i].length);
 
 		/* to in the WQE == the offset into the page */
-		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
-				(1UL << (12 + page_size[i])));
+		wqe->recv.sgl[i].to = cpu_to_be64(((u32)wr->sg_list[i].addr) &
+				((1UL << (12 + page_size[i]) - 1)));
 
 		/* pbl_addr is the adapters address in the PBL */
 		wqe->recv.pbl_addr[i] = cpu_to_be32(pbl_addr[i]);
