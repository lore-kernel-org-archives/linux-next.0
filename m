From: Sebastian Ott <sebott@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the block tree with the s390 tree
Date: Tue, 13 Jun 2017 13:20:17 +0200 (CEST)
Message-ID: <alpine.LFD.2.20.1706131315280.1680@schleppi>
References: <20170613130649.6bcede94@canb.auug.org.au> <20170613062055.GA30813@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49513 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752081AbdFMLUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 07:20:30 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5DBKKUS140559
        for <linux-next@vger.kernel.org>; Tue, 13 Jun 2017 07:20:30 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2b2d41g22m-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 13 Jun 2017 07:20:28 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sebott@linux.vnet.ibm.com>;
        Tue, 13 Jun 2017 12:20:22 +0100
In-Reply-To: <20170613062055.GA30813@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On Tue, 13 Jun 2017, Christoph Hellwig wrote:
> Btw, scm_blk.c blk-mq conversion seems odd if not broken.  It should
> always call blk_mq_complete_request from scm_request_finish and
> then pass the error to blk_mq_end_request frin
> there.

OK. I had added that because rq->errors went away. Would the change below
be ok?

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index 71c0158..86a8d80 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -249,13 +249,13 @@ static void scm_request_requeue(struct scm_request *scmrq)
 static void scm_request_finish(struct scm_request *scmrq)
 {
 	struct scm_blk_dev *bdev = scmrq->bdev;
+	int *error;
 	int i;
 
 	for (i = 0; i < nr_requests_per_io && scmrq->request[i]; i++) {
-		if (scmrq->error)
-			blk_mq_end_request(scmrq->request[i], scmrq->error);
-		else
-			blk_mq_complete_request(scmrq->request[i]);
+		error = blk_mq_rq_to_pdu(scmrq->request[i]);
+		*error = scmrq->error;
+		blk_mq_complete_request(scmrq->request[i]);
 	}
 
 	atomic_dec(&bdev->queued_reqs);
@@ -415,7 +415,9 @@ void scm_blk_irq(struct scm_device *scmdev, void *data, int error)
 
 static void scm_blk_request_done(struct request *req)
 {
-	blk_mq_end_request(req, 0);
+	int *error = blk_mq_rq_to_pdu(req);
+
+	blk_mq_end_request(req, *error);
 }
 
 static const struct block_device_operations scm_blk_devops = {
@@ -448,6 +450,7 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	atomic_set(&bdev->queued_reqs, 0);
 
 	bdev->tag_set.ops = &scm_mq_ops;
+	bdev->tag_set.cmd_size = sizeof(int);
 	bdev->tag_set.nr_hw_queues = nr_requests;
 	bdev->tag_set.queue_depth = nr_requests_per_io * nr_requests;
 	bdev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
