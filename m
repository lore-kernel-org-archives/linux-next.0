From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Mon, 18 May 2009 22:04:52 +0930
Message-ID: <200905182204.54512.rusty@rustcorp.com.au>
References: <20090518145318.c199842e.sfr@canb.auug.org.au> <20090518062747.GF4140@kernel.dk>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_uXVEKUqhlL+zPg1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:36623 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751260AbZERMfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 May 2009 08:35:00 -0400
In-Reply-To: <20090518062747.GF4140@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Tejun Heo <tj@kernel.org>

--Boundary-00=_uXVEKUqhlL+zPg1
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 18 May 2009 03:57:47 pm Jens Axboe wrote:
> On Mon, May 18 2009, Stephen Rothwell wrote:
> Rusty, perhaps it would be easier if I took the SG_IO patch through the
> block tree?

Thanks; they're orthogonal to the rest of my changes anyway.

Here are the two patches (first one is a prereq).  I've attached them, or you 
can grab them out of linux-next or my patchqueue.

Thanks,
Rusty.

--Boundary-00=_uXVEKUqhlL+zPg1
Content-Type: text/x-patch;
  charset="UTF-8";
  name="virtio:blk_don_t_blindly_derefence_req_rq_disk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="virtio:blk_don_t_blindly_derefence_req_rq_disk.patch"

Subject: virtio_blk: don't blindly derefence req->rq_disk
Date: Mon, 11 May 2009 10:35:19 +0200
From: Christoph Hellwig <hch@lst.de>

request->rq_disk is only set for FS requests or BLOCK_PC requests
originating from the generic block layer scsi ioctls.  It's not set
for requests origination from other soures or internal cache flush
commands implemented by the patch I'll send after this.

So instead of using it to get at the private data in do_virtblk_request
setup queue->queuedata and use it.


Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
---
 drivers/block/virtio_blk.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: xfs/drivers/block/virtio_blk.c
===================================================================
--- xfs.orig/drivers/block/virtio_blk.c	2009-05-11 10:09:59.833784412 +0200
+++ xfs/drivers/block/virtio_blk.c	2009-05-11 10:33:31.099659254 +0200
@@ -153,12 +153,11 @@ static bool do_req(struct request_queue 
 
 static void do_virtblk_request(struct request_queue *q)
 {
-	struct virtio_blk *vblk = NULL;
+	struct virtio_blk *vblk = q->queuedata;
 	struct request *req;
 	unsigned int issued = 0;
 
 	while ((req = elv_next_request(q)) != NULL) {
-		vblk = req->rq_disk->private_data;
 		BUG_ON(req->nr_phys_segments + 2 > vblk->sg_elems);
 
 		/* If this request fails, stop queue and wait for something to
@@ -286,6 +285,7 @@ static int virtblk_probe(struct virtio_d
 		goto out_put_disk;
 	}
 
+	vblk->disk->queue->queuedata = vblk;
 	queue_flag_set_unlocked(QUEUE_FLAG_VIRT, vblk->disk->queue);
 
 	if (index < 26) {

--Boundary-00=_uXVEKUqhlL+zPg1
Content-Type: text/x-patch;
  charset="UTF-8";
  name="virtio:blk_sg_io_passthru_support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="virtio:blk_sg_io_passthru_support.patch"

Subject: virtio_blk: SG_IO passthru support
Date: Mon, 27 Apr 2009 10:21:21 +0200
From: Hannes Reinecke <hare@suse.de>

Add support for SG_IO passthru to virtio_blk.  We add the scsi command
block after the normal outhdr, and the scsi inhdr with full status
information aswell as the sense buffer before the regular inhdr.

[hch: forward ported, added the VIRTIO_BLK_F_SCSI flags, some comments
 and tested the whole beast]


Signed-off-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au> (+ checkpatch.pl tweak)
---
 drivers/block/virtio_blk.c |   68 +++++++++++++++++++++++++++++++++++----------
 include/linux/virtio_blk.h |    8 +++++
 2 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -37,6 +37,7 @@ struct virtblk_req
 	struct list_head list;
 	struct request *req;
 	struct virtio_blk_outhdr out_hdr;
+	struct virtio_scsi_inhdr in_hdr;
 	u8 status;
 };
 
@@ -49,7 +50,9 @@ static void blk_done(struct virtqueue *v
 
 	spin_lock_irqsave(&vblk->lock, flags);
 	while ((vbr = vblk->vq->vq_ops->get_buf(vblk->vq, &len)) != NULL) {
+		unsigned int nr_bytes;
 		int error;
+
 		switch (vbr->status) {
 		case VIRTIO_BLK_S_OK:
 			error = 0;
@@ -62,7 +65,15 @@ static void blk_done(struct virtqueue *v
 			break;
 		}
 
-		__blk_end_request(vbr->req, error, blk_rq_bytes(vbr->req));
+		if (blk_pc_request(vbr->req)) {
+			vbr->req->data_len = vbr->in_hdr.residual;
+			nr_bytes = vbr->in_hdr.data_len;
+			vbr->req->sense_len = vbr->in_hdr.sense_len;
+			vbr->req->errors = vbr->in_hdr.errors;
+		} else
+			nr_bytes = blk_rq_bytes(vbr->req);
+
+		__blk_end_request(vbr->req, error, nr_bytes);
 		list_del(&vbr->list);
 		mempool_free(vbr, vblk->pool);
 	}
@@ -74,7 +85,7 @@ static void blk_done(struct virtqueue *v
 static bool do_req(struct request_queue *q, struct virtio_blk *vblk,
 		   struct request *req)
 {
-	unsigned long num, out, in;
+	unsigned long num, out = 0, in = 0;
 	struct virtblk_req *vbr;
 
 	vbr = mempool_alloc(vblk->pool, GFP_ATOMIC);
@@ -99,18 +110,36 @@ static bool do_req(struct request_queue 
 	if (blk_barrier_rq(vbr->req))
 		vbr->out_hdr.type |= VIRTIO_BLK_T_BARRIER;
 
-	sg_set_buf(&vblk->sg[0], &vbr->out_hdr, sizeof(vbr->out_hdr));
-	num = blk_rq_map_sg(q, vbr->req, vblk->sg+1);
-	sg_set_buf(&vblk->sg[num+1], &vbr->status, sizeof(vbr->status));
+	sg_set_buf(&vblk->sg[out++], &vbr->out_hdr, sizeof(vbr->out_hdr));
 
-	if (rq_data_dir(vbr->req) == WRITE) {
-		vbr->out_hdr.type |= VIRTIO_BLK_T_OUT;
-		out = 1 + num;
-		in = 1;
-	} else {
-		vbr->out_hdr.type |= VIRTIO_BLK_T_IN;
-		out = 1;
-		in = 1 + num;
+	/*
+	 * If this is a packet command we need a couple of additional headers.
+	 * Behind the normal outhdr we put a segment with the scsi command
+	 * block, and before the normal inhdr we put the sense data and the
+	 * inhdr with additional status information before the normal inhdr.
+	 */
+	if (blk_pc_request(vbr->req))
+		sg_set_buf(&vblk->sg[out++], vbr->req->cmd, vbr->req->cmd_len);
+
+	num = blk_rq_map_sg(q, vbr->req, vblk->sg + out);
+
+	if (blk_pc_request(vbr->req)) {
+		sg_set_buf(&vblk->sg[num + out + in++], vbr->req->sense, 96);
+		sg_set_buf(&vblk->sg[num + out + in++], &vbr->in_hdr,
+			   sizeof(vbr->in_hdr));
+	}
+
+	sg_set_buf(&vblk->sg[num + out + in++], &vbr->status,
+		   sizeof(vbr->status));
+
+	if (num) {
+		if (rq_data_dir(vbr->req) == WRITE) {
+			vbr->out_hdr.type |= VIRTIO_BLK_T_OUT;
+			out += num;
+		} else {
+			vbr->out_hdr.type |= VIRTIO_BLK_T_IN;
+			in += num;
+		}
 	}
 
 	if (vblk->vq->vq_ops->add_buf(vblk->vq, vblk->sg, out, in, vbr)) {
@@ -148,8 +177,16 @@ static void do_virtblk_request(struct re
 static int virtblk_ioctl(struct block_device *bdev, fmode_t mode,
 			 unsigned cmd, unsigned long data)
 {
-	return scsi_cmd_ioctl(bdev->bd_disk->queue,
-			      bdev->bd_disk, mode, cmd,
+	struct gendisk *disk = bdev->bd_disk;
+	struct virtio_blk *vblk = disk->private_data;
+
+	/*
+	 * Only allow the generic SCSI ioctls if the host can support it.
+	 */
+	if (!virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_SCSI))
+		return -ENOIOCTLCMD;
+
+	return scsi_cmd_ioctl(disk->queue, disk, mode, cmd,
 			      (void __user *)data);
 }
 
@@ -356,6 +393,7 @@ static struct virtio_device_id id_table[
 static unsigned int features[] = {
 	VIRTIO_BLK_F_BARRIER, VIRTIO_BLK_F_SEG_MAX, VIRTIO_BLK_F_SIZE_MAX,
 	VIRTIO_BLK_F_GEOMETRY, VIRTIO_BLK_F_RO, VIRTIO_BLK_F_BLK_SIZE,
+	VIRTIO_BLK_F_SCSI,
 };
 
 static struct virtio_driver virtio_blk = {
diff --git a/include/linux/virtio_blk.h b/include/linux/virtio_blk.h
--- a/include/linux/virtio_blk.h
+++ b/include/linux/virtio_blk.h
@@ -15,6 +15,7 @@
 #define VIRTIO_BLK_F_GEOMETRY	4	/* Legacy geometry available  */
 #define VIRTIO_BLK_F_RO		5	/* Disk is read-only */
 #define VIRTIO_BLK_F_BLK_SIZE	6	/* Block size of disk is available*/
+#define VIRTIO_BLK_F_SCSI	7	/* Supports scsi command passthru */
 
 struct virtio_blk_config
 {
@@ -55,6 +56,13 @@ struct virtio_blk_outhdr
 	__u64 sector;
 };
 
+struct virtio_scsi_inhdr {
+	__u32 errors;
+	__u32 data_len;
+	__u32 sense_len;
+	__u32 residual;
+};
+
 /* And this is the final byte of the write scatter-gather list. */
 #define VIRTIO_BLK_S_OK		0
 #define VIRTIO_BLK_S_IOERR	1

--Boundary-00=_uXVEKUqhlL+zPg1--
