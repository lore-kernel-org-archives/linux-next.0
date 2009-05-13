From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Wed, 13 May 2009 14:04:13 +1000
Message-ID: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54634 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750722AbZEMEET (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 May 2009 00:04:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Tejun Heo <tj@kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hi Jens,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/scsi/scsi_transport_fc.c: In function 'fc_bsg_jobdone':
drivers/scsi/scsi_transport_fc.c:3428: error: 'struct request' has no member named 'data_len'
drivers/scsi/scsi_transport_fc.c:3434: error: 'struct request' has no member named 'data_len'
drivers/scsi/scsi_transport_fc.c:3437: error: implicit declaration of function 'blk_end_bidi_request'
drivers/scsi/scsi_transport_fc.c: In function 'fc_bsg_map_buffer':
drivers/scsi/scsi_transport_fc.c:3499: error: 'struct request' has no member named 'data_len'
drivers/scsi/scsi_transport_fc.c: In function 'fc_bsg_request_handler':
drivers/scsi/scsi_transport_fc.c:3765: error: implicit declaration of function 'elv_next_request'
drivers/scsi/scsi_transport_fc.c:3765: warning: assignment makes pointer from integer without a cast
drivers/scsi/scsi_transport_fc.c:3772: error: implicit declaration of function 'blkdev_dequeue_request'

Caused by commit 1bfe9caaff367601134c14fc428017419f628f7d ("[SCSI] FC
Pass Thru support") from the scsi tree interacting with commits
a2dec7b36364a5cc564c4d76cf16d2e7d33f5c05 ("block: hide request sector and
data_len"), 9934c8c04561413609d2bc38c6b9f268cba774a4 ("block:
implement and enforce request peek/start/fetch") and
b1f744937f1be3e6d3009382a755679133cf782d ("block: move completion related
functions back to blk-core.c") from the block tree.

Removing old interfaces is a particularly unfriendly thing to do within
the same time frame as creating replacements.  Better would be to
deprecate them or reimplement them in terms of the new interfaces if
possible.

I have reverted commit b1f744937f1be3e6d3009382a755679133cf782d ("block:
move completion related functions back to blk-core.c") and applied the
following patch (which I realise is probably not correct) for today.
Maybe someone can come up with a better solution for the scsi guys and me.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 13 May 2009 13:54:48 +1000
Subject: [PATCH] scsi/block: fixup scsi_transport_fc for block changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/scsi_transport_fc.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index 4df8c3c..c8b8fb7 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -3425,13 +3425,13 @@ fc_bsg_jobdone(struct fc_bsg_job *job)
 		job->req->sense_len = job->reply_len;
 
 	/* we assume all request payload was transferred, residual == 0 */
-	req->data_len = 0;
+	req->__data_len = 0;
 
 	if (rsp) {
 		rsp_len = blk_rq_bytes(rsp);
 		BUG_ON(job->reply->reply_payload_rcv_len > rsp_len);
 		/* set reply (bidi) residual */
-		rsp->data_len = (rsp_len - job->reply->reply_payload_rcv_len);
+		rsp->__data_len = (rsp_len - job->reply->reply_payload_rcv_len);
 	}
 
 	blk_end_bidi_request(req, err, req_len, rsp_len);
@@ -3496,7 +3496,7 @@ fc_bsg_map_buffer(struct fc_bsg_buffer *buf, struct request *req)
 		return -ENOMEM;
 	sg_init_table(buf->sg_list, req->nr_phys_segments);
 	buf->sg_cnt = blk_rq_map_sg(req->q, req, buf->sg_list);
-	buf->payload_len = req->data_len;
+	buf->payload_len = blk_rq_bytes(req);
 	return 0;
 }
 
@@ -3762,14 +3762,14 @@ fc_bsg_request_handler(struct request_queue *q, struct Scsi_Host *shost,
 		return;
 
 	while (!blk_queue_plugged(q)) {
-		req = elv_next_request(q);
+		req = blk_peek_request(q);
 		if (!req)
 			break;
 
 		if (rport && (rport->port_state == FC_PORTSTATE_BLOCKED))
 				break;
 
-		blkdev_dequeue_request(req);
+		blk_start_request(req);
 
 		if (rport && (rport->port_state != FC_PORTSTATE_ONLINE)) {
 			req->errors = -ENXIO;
-- 
1.6.3
