From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the nfsd
 tree
Date: Thu, 31 Dec 2015 19:28:06 +1100
Message-ID: <20151231192806.0a2d7415@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54185 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751952AbbLaI2J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 03:28:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jenny Derzhavetz <jennyf@mellanox.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got conflicts in:

  drivers/infiniband/ulp/iser/iser_memory.c
  drivers/infiniband/ulp/isert/ib_isert.c

between commit:

  6c7b6d2d442c ("IB: merge struct ib_device_attr into struct ib_device")

from the nfsd tree and commits:

  6d2cb3ad4bc2 ("iser-target: Support the remote invalidation exception")
  9a4a71456262 ("IB/iser: Support the remote invalidation exception")

from the target-updates tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/infiniband/ulp/iser/iser_memory.c
index 81ad5e998fc2,8a57d4eadda6..000000000000
--- a/drivers/infiniband/ulp/iser/iser_memory.c
+++ b/drivers/infiniband/ulp/iser/iser_memory.c
@@@ -69,16 -69,17 +69,17 @@@ static struct iser_reg_ops fmr_ops = 
  
  int iser_assign_reg_ops(struct iser_device *device)
  {
 -	struct ib_device_attr *dev_attr = &device->dev_attr;
 +	struct ib_device *ib_dev = device->ib_device;
  
  	/* Assign function handles  - based on FMR support */
 -	if (device->ib_device->alloc_fmr && device->ib_device->dealloc_fmr &&
 -	    device->ib_device->map_phys_fmr && device->ib_device->unmap_fmr) {
 +	if (ib_dev->alloc_fmr && ib_dev->dealloc_fmr &&
 +	    ib_dev->map_phys_fmr && ib_dev->unmap_fmr) {
  		iser_info("FMR supported, using FMR for registration\n");
  		device->reg_ops = &fmr_ops;
 -	} else if (dev_attr->device_cap_flags & IB_DEVICE_MEM_MGT_EXTENSIONS) {
 +	} else if (ib_dev->device_cap_flags & IB_DEVICE_MEM_MGT_EXTENSIONS) {
  		iser_info("FastReg supported, using FastReg for registration\n");
  		device->reg_ops = &fastreg_ops;
+ 		device->remote_inv_sup = iser_always_reg;
  	} else {
  		iser_err("IB device does not support FMRs nor FastRegs, can't register memory\n");
  		return -1;
diff --cc drivers/infiniband/ulp/isert/ib_isert.c
index 77f894970aeb,91eb22c4fdba..000000000000
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@@ -654,6 -679,32 +653,32 @@@ out_login_buf
  	return ret;
  }
  
+ static void
+ isert_set_nego_params(struct isert_conn *isert_conn,
+ 		      struct rdma_conn_param *param)
+ {
+ 	struct isert_device *device = isert_conn->device;
+ 
+ 	/* Set max inflight RDMA READ requests */
+ 	isert_conn->initiator_depth = min_t(u8, param->initiator_depth,
 -				device->dev_attr.max_qp_init_rd_atom);
++				device->ib_device->max_qp_init_rd_atom);
+ 	isert_dbg("Using initiator_depth: %u\n", isert_conn->initiator_depth);
+ 
+ 	if (param->private_data) {
+ 		u8 flags = *(u8 *)param->private_data;
+ 
+ 		/*
+ 		 * use remote invalidation if the both initiator
+ 		 * and the HCA support it
+ 		 */
+ 		isert_conn->snd_w_inv = !(flags & ISER_SEND_W_INV_NOT_SUP) &&
 -					  (device->dev_attr.device_cap_flags &
++					  (device->ib_device->device_cap_flags &
+ 					   IB_DEVICE_MEM_MGT_EXTENSIONS);
+ 		if (isert_conn->snd_w_inv)
+ 			isert_info("Using remote invalidation\n");
+ 	}
+ }
+ 
  static int
  isert_connect_request(struct rdma_cm_id *cma_id, struct rdma_cm_event *event)
  {
