From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 4 Sep 2017 13:09:44 +1000
Message-ID: <20170904130944.3bb37efd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50629 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753124AbdIDDJq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Sep 2017 23:09:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Max Gurtovoy <maxg@mellanox.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/rdma.c

between commit:

  b925a2dc165e ("nvme-rdma: default MR page size to 4k")

from Linus' tree and commits:

  90af35123d3b ("nvme-rdma: move nvme_rdma_configure_admin_queue code location")
  a7b7c7a105a5 ("nvme-rdma: Use unlikely macro in the fast path")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/rdma.c
index a7f7d0ae3331,6a7682620d87..000000000000
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@@ -605,10 -629,9 +626,10 @@@ out_stop_queues
  	return ret;
  }
  
- static int nvme_rdma_init_io_queues(struct nvme_rdma_ctrl *ctrl)
+ static int nvme_rdma_alloc_io_queues(struct nvme_rdma_ctrl *ctrl)
  {
  	struct nvmf_ctrl_options *opts = ctrl->ctrl.opts;
 +	struct ib_device *ibdev = ctrl->device->dev;
  	unsigned int nr_io_queues;
  	int i, ret;
  
@@@ -656,10 -734,144 +741,144 @@@ static void nvme_rdma_destroy_admin_que
  {
  	nvme_rdma_free_qe(ctrl->queues[0].device->dev, &ctrl->async_event_sqe,
  			sizeof(struct nvme_command), DMA_TO_DEVICE);
- 	nvme_rdma_stop_and_free_queue(&ctrl->queues[0]);
- 	blk_cleanup_queue(ctrl->ctrl.admin_q);
- 	blk_mq_free_tag_set(&ctrl->admin_tag_set);
- 	nvme_rdma_dev_put(ctrl->device);
+ 	nvme_rdma_stop_queue(&ctrl->queues[0]);
+ 	if (remove) {
+ 		blk_cleanup_queue(ctrl->ctrl.admin_q);
+ 		nvme_rdma_free_tagset(&ctrl->ctrl, true);
+ 	}
+ 	nvme_rdma_free_queue(&ctrl->queues[0]);
+ }
+ 
+ static int nvme_rdma_configure_admin_queue(struct nvme_rdma_ctrl *ctrl,
+ 		bool new)
+ {
+ 	int error;
+ 
+ 	error = nvme_rdma_alloc_queue(ctrl, 0, NVME_AQ_DEPTH);
+ 	if (error)
+ 		return error;
+ 
+ 	ctrl->device = ctrl->queues[0].device;
+ 
+ 	ctrl->max_fr_pages = min_t(u32, NVME_RDMA_MAX_SEGMENTS,
+ 		ctrl->device->dev->attrs.max_fast_reg_page_list_len);
+ 
+ 	if (new) {
+ 		ctrl->ctrl.admin_tagset = nvme_rdma_alloc_tagset(&ctrl->ctrl, true);
+ 		if (IS_ERR(ctrl->ctrl.admin_tagset))
+ 			goto out_free_queue;
+ 
+ 		ctrl->ctrl.admin_q = blk_mq_init_queue(&ctrl->admin_tag_set);
+ 		if (IS_ERR(ctrl->ctrl.admin_q)) {
+ 			error = PTR_ERR(ctrl->ctrl.admin_q);
+ 			goto out_free_tagset;
+ 		}
+ 	} else {
+ 		error = blk_mq_reinit_tagset(&ctrl->admin_tag_set,
+ 					     nvme_rdma_reinit_request);
+ 		if (error)
+ 			goto out_free_queue;
+ 	}
+ 
+ 	error = nvme_rdma_start_queue(ctrl, 0);
+ 	if (error)
+ 		goto out_cleanup_queue;
+ 
+ 	error = ctrl->ctrl.ops->reg_read64(&ctrl->ctrl, NVME_REG_CAP,
+ 			&ctrl->ctrl.cap);
+ 	if (error) {
+ 		dev_err(ctrl->ctrl.device,
+ 			"prop_get NVME_REG_CAP failed\n");
+ 		goto out_cleanup_queue;
+ 	}
+ 
+ 	ctrl->ctrl.sqsize =
+ 		min_t(int, NVME_CAP_MQES(ctrl->ctrl.cap), ctrl->ctrl.sqsize);
+ 
+ 	error = nvme_enable_ctrl(&ctrl->ctrl, ctrl->ctrl.cap);
+ 	if (error)
+ 		goto out_cleanup_queue;
+ 
+ 	ctrl->ctrl.max_hw_sectors =
 -		(ctrl->max_fr_pages - 1) << (PAGE_SHIFT - 9);
++		(ctrl->max_fr_pages - 1) << (ilog2(SZ_4K) - 9);
+ 
+ 	error = nvme_init_identify(&ctrl->ctrl);
+ 	if (error)
+ 		goto out_cleanup_queue;
+ 
+ 	error = nvme_rdma_alloc_qe(ctrl->queues[0].device->dev,
+ 			&ctrl->async_event_sqe, sizeof(struct nvme_command),
+ 			DMA_TO_DEVICE);
+ 	if (error)
+ 		goto out_cleanup_queue;
+ 
+ 	return 0;
+ 
+ out_cleanup_queue:
+ 	if (new)
+ 		blk_cleanup_queue(ctrl->ctrl.admin_q);
+ out_free_tagset:
+ 	if (new)
+ 		nvme_rdma_free_tagset(&ctrl->ctrl, true);
+ out_free_queue:
+ 	nvme_rdma_free_queue(&ctrl->queues[0]);
+ 	return error;
+ }
+ 
+ static void nvme_rdma_destroy_io_queues(struct nvme_rdma_ctrl *ctrl,
+ 		bool remove)
+ {
+ 	nvme_rdma_stop_io_queues(ctrl);
+ 	if (remove) {
+ 		blk_cleanup_queue(ctrl->ctrl.connect_q);
+ 		nvme_rdma_free_tagset(&ctrl->ctrl, false);
+ 	}
+ 	nvme_rdma_free_io_queues(ctrl);
+ }
+ 
+ static int nvme_rdma_configure_io_queues(struct nvme_rdma_ctrl *ctrl, bool new)
+ {
+ 	int ret;
+ 
+ 	ret = nvme_rdma_alloc_io_queues(ctrl);
+ 	if (ret)
+ 		return ret;
+ 
+ 	if (new) {
+ 		ctrl->ctrl.tagset = nvme_rdma_alloc_tagset(&ctrl->ctrl, false);
+ 		if (IS_ERR(ctrl->ctrl.tagset))
+ 			goto out_free_io_queues;
+ 
+ 		ctrl->ctrl.connect_q = blk_mq_init_queue(&ctrl->tag_set);
+ 		if (IS_ERR(ctrl->ctrl.connect_q)) {
+ 			ret = PTR_ERR(ctrl->ctrl.connect_q);
+ 			goto out_free_tag_set;
+ 		}
+ 	} else {
+ 		ret = blk_mq_reinit_tagset(&ctrl->tag_set,
+ 					   nvme_rdma_reinit_request);
+ 		if (ret)
+ 			goto out_free_io_queues;
+ 
+ 		blk_mq_update_nr_hw_queues(&ctrl->tag_set,
+ 			ctrl->ctrl.queue_count - 1);
+ 	}
+ 
+ 	ret = nvme_rdma_start_io_queues(ctrl);
+ 	if (ret)
+ 		goto out_cleanup_connect_q;
+ 
+ 	return 0;
+ 
+ out_cleanup_connect_q:
+ 	if (new)
+ 		blk_cleanup_queue(ctrl->ctrl.connect_q);
+ out_free_tag_set:
+ 	if (new)
+ 		nvme_rdma_free_tagset(&ctrl->ctrl, false);
+ out_free_io_queues:
+ 	nvme_rdma_free_io_queues(ctrl);
+ 	return ret;
  }
  
  static void nvme_rdma_free_ctrl(struct nvme_ctrl *nctrl)
@@@ -927,12 -1111,8 +1118,12 @@@ static int nvme_rdma_map_sg_fr(struct n
  	struct nvme_keyed_sgl_desc *sg = &c->common.dptr.ksgl;
  	int nr;
  
 -	nr = ib_map_mr_sg(req->mr, req->sg_table.sgl, count, NULL, PAGE_SIZE);
 +	/*
 +	 * Align the MR to a 4K page size to match the ctrl page size and
 +	 * the block virtual boundary.
 +	 */
 +	nr = ib_map_mr_sg(req->mr, req->sg_table.sgl, count, NULL, SZ_4K);
- 	if (nr < count) {
+ 	if (unlikely(nr < count)) {
  		if (nr < 0)
  			return nr;
  		return -EINVAL;
