From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the block tree
Date: Wed, 21 Jun 2017 15:55:01 +1000
Message-ID: <20170621155501.7d834479@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44283 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750859AbdFUFzD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 01:55:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@sandisk.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/scsi_lib.c

between commit:

  ca18d6f769d2 ("block: Make most scsi_req_init() calls implicit")

from the block tree and commit:

  2dd6fb5957a7 ("scsi: Only add commands to the device command list if required by the LLD")

from the scsi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/scsi_lib.c
index 550e29f903b7,41c19c75dab4..000000000000
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@@ -1116,20 -1124,35 +1106,49 @@@ err_exit
  }
  EXPORT_SYMBOL(scsi_init_io);
  
+ /* Add a command to the list used by the aacraid and dpt_i2o drivers */
+ void scsi_add_cmd_to_list(struct scsi_cmnd *cmd)
+ {
+ 	struct scsi_device *sdev = cmd->device;
+ 	struct Scsi_Host *shost = sdev->host;
+ 	unsigned long flags;
+ 
+ 	if (shost->use_cmd_list) {
+ 		spin_lock_irqsave(&sdev->list_lock, flags);
+ 		list_add_tail(&cmd->list, &sdev->cmd_list);
+ 		spin_unlock_irqrestore(&sdev->list_lock, flags);
+ 	}
+ }
+ 
+ /* Remove a command from the list used by the aacraid and dpt_i2o drivers */
+ void scsi_del_cmd_from_list(struct scsi_cmnd *cmd)
+ {
+ 	struct scsi_device *sdev = cmd->device;
+ 	struct Scsi_Host *shost = sdev->host;
+ 	unsigned long flags;
+ 
+ 	if (shost->use_cmd_list) {
+ 		spin_lock_irqsave(&sdev->list_lock, flags);
+ 		BUG_ON(list_empty(&cmd->list));
+ 		list_del_init(&cmd->list);
+ 		spin_unlock_irqrestore(&sdev->list_lock, flags);
+ 	}
+ }
+ 
 +/**
 + * scsi_initialize_rq - initialize struct scsi_cmnd.req
 + *
 + * Called from inside blk_get_request().
 + */
 +void scsi_initialize_rq(struct request *rq)
 +{
 +	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
 +
 +	scsi_req_init(&cmd->req);
 +}
 +EXPORT_SYMBOL(scsi_initialize_rq);
 +
 +/* Called after a request has been started. */
  void scsi_init_command(struct scsi_device *dev, struct scsi_cmnd *cmd)
  {
  	void *buf = cmd->sense_buffer;
@@@ -2974,10 -2989,7 +2989,7 @@@ int scsi_internal_device_block_nowait(s
  	 * request queue. 
  	 */
  	if (q->mq_ops) {
- 		if (wait)
- 			blk_mq_quiesce_queue(q);
- 		else
- 			blk_mq_quiesce_queue_nowait(q);
 -		blk_mq_stop_hw_queues(q);
++		blk_mq_quiesce_queue_nowait(q);
  	} else {
  		spin_lock_irqsave(q->queue_lock, flags);
  		blk_stop_queue(q);
@@@ -2988,31 -2998,77 +2998,77 @@@
  
  	return 0;
  }
- EXPORT_SYMBOL_GPL(scsi_internal_device_block);
-  
+ EXPORT_SYMBOL_GPL(scsi_internal_device_block_nowait);
+ 
  /**
-  * scsi_internal_device_unblock - resume a device after a block request
-  * @sdev:	device to resume
-  * @new_state:	state to set devices to after unblocking
+  * scsi_internal_device_block - try to transition to the SDEV_BLOCK state
+  * @sdev: device to block
+  *
+  * Pause SCSI command processing on the specified device and wait until all
+  * ongoing scsi_request_fn() / scsi_queue_rq() calls have finished. May sleep.
   *
-  * Called by scsi lld's or the midlayer to restart the device queue
-  * for the previously suspended scsi device.  Called from interrupt or
-  * normal process context.
+  * Returns zero if successful or a negative error code upon failure.
   *
-  * Returns zero if successful or error if not.
+  * Note:
+  * This routine transitions the device to the SDEV_BLOCK state (which must be
+  * a legal transition). When the device is in this state, command processing
+  * is paused until the device leaves the SDEV_BLOCK state. See also
+  * scsi_internal_device_unblock().
   *
-  * Notes:       
-  *	This routine transitions the device to the SDEV_RUNNING state
-  *	or to one of the offline states (which must be a legal transition)
-  *	allowing the midlayer to goose the queue for this device.
+  * To do: avoid that scsi_send_eh_cmnd() calls queuecommand() after
+  * scsi_internal_device_block() has blocked a SCSI device and also
+  * remove the rport mutex lock and unlock calls from srp_queuecommand().
   */
- int
- scsi_internal_device_unblock(struct scsi_device *sdev,
- 			     enum scsi_device_state new_state)
+ static int scsi_internal_device_block(struct scsi_device *sdev)
  {
- 	struct request_queue *q = sdev->request_queue; 
+ 	struct request_queue *q = sdev->request_queue;
+ 	int err;
+ 
+ 	mutex_lock(&sdev->state_mutex);
+ 	err = scsi_internal_device_block_nowait(sdev);
+ 	if (err == 0) {
+ 		if (q->mq_ops)
+ 			blk_mq_quiesce_queue(q);
+ 		else
+ 			scsi_wait_for_queuecommand(sdev);
+ 	}
+ 	mutex_unlock(&sdev->state_mutex);
+ 
+ 	return err;
+ }
+  
+ void scsi_start_queue(struct scsi_device *sdev)
+ {
+ 	struct request_queue *q = sdev->request_queue;
  	unsigned long flags;
  
+ 	if (q->mq_ops) {
 -		blk_mq_start_stopped_hw_queues(q, false);
++		blk_mq_unquiesce_queue(q);
+ 	} else {
+ 		spin_lock_irqsave(q->queue_lock, flags);
+ 		blk_start_queue(q);
+ 		spin_unlock_irqrestore(q->queue_lock, flags);
+ 	}
+ }
+ 
+ /**
+  * scsi_internal_device_unblock_nowait - resume a device after a block request
+  * @sdev:	device to resume
+  * @new_state:	state to set the device to after unblocking
+  *
+  * Restart the device queue for a previously suspended SCSI device. Does not
+  * sleep.
+  *
+  * Returns zero if successful or a negative error code upon failure.
+  *
+  * Notes:
+  * This routine transitions the device to the SDEV_RUNNING state or to one of
+  * the offline states (which must be a legal transition) allowing the midlayer
+  * to goose the queue for this device.
+  */
+ int scsi_internal_device_unblock_nowait(struct scsi_device *sdev,
+ 					enum scsi_device_state new_state)
+ {
  	/*
  	 * Try to transition the scsi device to SDEV_RUNNING or one of the
  	 * offlined states and goose the device queue if successful.
