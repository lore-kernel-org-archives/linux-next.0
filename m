From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 7 Mar 2016 14:12:09 +1100
Message-ID: <20160307141209.548af254@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46528 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbcCGDML (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Mar 2016 22:12:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/core.c

between commit:

  075790ebba4a ("NVMe: Use IDA for namespace disk naming")

from Linus' tree and commit:

  f4f0f63e6f01 ("nvme: fix drvdata setup for the nvme device")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/core.c
index 03c46412fff4,f08dccee8143..000000000000
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@@ -561,13 -598,9 +603,13 @@@ static int nvme_revalidate_disk(struct 
  	u16 old_ms;
  	unsigned short bs;
  
 +	if (test_bit(NVME_NS_DEAD, &ns->flags)) {
 +		set_capacity(disk, 0);
 +		return -ENODEV;
 +	}
  	if (nvme_identify_ns(ns->ctrl, ns->ns_id, &id)) {
- 		dev_warn(ns->ctrl->dev, "%s: Identify failure nvme%dn%d\n",
- 				__func__, ns->ctrl->instance, ns->ns_id);
+ 		dev_warn(disk_to_dev(ns->disk), "%s: Identify failure\n",
+ 				__func__);
  		return -ENODEV;
  	}
  	if (id->ncap == 0) {
@@@ -839,24 -874,8 +883,25 @@@ int nvme_shutdown_ctrl(struct nvme_ctr
  
  	return ret;
  }
+ EXPORT_SYMBOL_GPL(nvme_shutdown_ctrl);
  
 +static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
 +		struct request_queue *q)
 +{
 +	if (ctrl->max_hw_sectors) {
 +		u32 max_segments =
 +			(ctrl->max_hw_sectors / (ctrl->page_size >> 9)) + 1;
 +
 +		blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
 +		blk_queue_max_segments(q, min_t(u32, max_segments, USHRT_MAX));
 +	}
 +	if (ctrl->stripe_size)
 +		blk_queue_chunk_sectors(q, ctrl->stripe_size >> 9);
 +	if (ctrl->vwc & NVME_CTRL_VWC_PRESENT)
 +		blk_queue_flush(q, REQ_FLUSH | REQ_FUA);
 +	blk_queue_virt_boundary(q, ctrl->page_size - 1);
 +}
 +
  /*
   * Initialize the cached copies of the Identify data and various controller
   * register in our nvme_ctrl structure.  This should be called as soon as
@@@ -1313,9 -1360,12 +1372,10 @@@ void nvme_remove_namespaces(struct nvme
  {
  	struct nvme_ns *ns, *next;
  
 -	mutex_lock(&ctrl->namespaces_mutex);
  	list_for_each_entry_safe(ns, next, &ctrl->namespaces, list)
  		nvme_ns_remove(ns);
 -	mutex_unlock(&ctrl->namespaces_mutex);
  }
+ EXPORT_SYMBOL_GPL(nvme_remove_namespaces);
  
  static DEFINE_IDA(nvme_instance_ida);
  
@@@ -1401,8 -1452,6 +1463,7 @@@ int nvme_init_ctrl(struct nvme_ctrl *ct
  		goto out_release_instance;
  	}
  	get_device(ctrl->device);
- 	dev_set_drvdata(ctrl->device, ctrl);
 +	ida_init(&ctrl->ns_ida);
  
  	spin_lock(&dev_list_lock);
  	list_add_tail(&ctrl->node, &nvme_ctrl_list);
@@@ -1414,39 -1463,8 +1475,40 @@@ out_release_instance
  out:
  	return ret;
  }
+ EXPORT_SYMBOL_GPL(nvme_init_ctrl);
  
 +/**
 + * nvme_kill_queues(): Ends all namespace queues
 + * @ctrl: the dead controller that needs to end
 + *
 + * Call this function when the driver determines it is unable to get the
 + * controller in a state capable of servicing IO.
 + */
 +void nvme_kill_queues(struct nvme_ctrl *ctrl)
 +{
 +	struct nvme_ns *ns;
 +
 +	mutex_lock(&ctrl->namespaces_mutex);
 +	list_for_each_entry(ns, &ctrl->namespaces, list) {
 +		if (!kref_get_unless_zero(&ns->kref))
 +			continue;
 +
 +		/*
 +		 * Revalidating a dead namespace sets capacity to 0. This will
 +		 * end buffered writers dirtying pages that can't be synced.
 +		 */
 +		if (!test_and_set_bit(NVME_NS_DEAD, &ns->flags))
 +			revalidate_disk(ns->disk);
 +
 +		blk_set_queue_dying(ns->queue);
 +		blk_mq_abort_requeue_list(ns->queue);
 +		blk_mq_start_stopped_hw_queues(ns->queue, true);
 +
 +		nvme_put_ns(ns);
 +	}
 +	mutex_unlock(&ctrl->namespaces_mutex);
 +}
 +
  void nvme_stop_queues(struct nvme_ctrl *ctrl)
  {
  	struct nvme_ns *ns;
