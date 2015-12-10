From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Subject: [PATCH] staging/rdma/hfi1: Fix a possible null pointer dereference
Date: Thu, 10 Dec 2015 11:13:38 -0500
Message-ID: <20151210161338.3341.95259.stgit@phlsvslse11.ph.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:4043 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751185AbbLJQPp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Dec 2015 11:15:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: devel@driverdev.osuosl.org
Cc: linux-rdma@vger.kernel.org, dledford@redhat.com, linux-next@vger.kernel.org

From: Easwar Hariharan <easwar.hariharan@intel.com>

A code inspection pointed out that kmalloc_array may return NULL and
memset doesn't check the input pointer for NULL, resulting in a possible
NULL dereference. This patch fixes this.

Reviewed-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
Signed-off-by: Easwar Hariharan <easwar.hariharan@intel.com>
---
 drivers/staging/rdma/hfi1/chip.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rdma/hfi1/chip.c b/drivers/staging/rdma/hfi1/chip.c
index dc69159..49d49b2 100644
--- a/drivers/staging/rdma/hfi1/chip.c
+++ b/drivers/staging/rdma/hfi1/chip.c
@@ -10129,6 +10129,8 @@ static void init_qos(struct hfi1_devdata *dd, u32 first_ctxt)
 	if (num_vls * qpns_per_vl > dd->chip_rcv_contexts)
 		goto bail;
 	rsmmap = kmalloc_array(NUM_MAP_REGS, sizeof(u64), GFP_KERNEL);
+	if (!rsmmap)
+		goto bail;
 	memset(rsmmap, rxcontext, NUM_MAP_REGS * sizeof(u64));
 	/* init the local copy of the table */
 	for (i = 0, ctxt = first_ctxt; i < num_vls; i++) {
