From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the block tree
Date: Mon, 19 Jun 2017 15:35:48 +1000
Message-ID: <20170619153548.5a676fde@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46875 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752487AbdFSFfv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 01:35:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Bart Van Assche <Bart.VanAssche@sandisk.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/scsi_lib.c

between commit:

  f660174e8bcd ("blk-mq: use the introduced blk_mq_unquiesce_queue()")

from the block tree and commits:

  551eb598e5ea ("scsi: Split scsi_internal_device_block()")
  66483a4a9f34 ("scsi: Introduce scsi_start_queue()")

from the scsi tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/scsi_lib.c
index fb18ed284e55,41c19c75dab4..000000000000
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@@ -2959,10 -2989,7 +2974,7 @@@ int scsi_internal_device_block_nowait(s
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
@@@ -2973,31 -2998,77 +2983,77 @@@
  
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
