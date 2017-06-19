From: Sebastian Ott <sebott@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 19 Jun 2017 11:00:23 +0200 (CEST)
Message-ID: <alpine.LFD.2.20.1706191056510.1794@schleppi>
References: <20170613205409.4b7e06f9@canb.auug.org.au> <alpine.LFD.2.20.1706151649160.1848@schleppi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44456 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753591AbdFSJAb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 05:00:31 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5J8xFPa011213
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2017 05:00:30 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2b64mrgdxx-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2017 05:00:30 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sebott@linux.vnet.ibm.com>;
        Mon, 19 Jun 2017 10:00:28 +0100
In-Reply-To: <alpine.LFD.2.20.1706151649160.1848@schleppi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On Thu, 15 Jun 2017, Sebastian Ott wrote:
> On Tue, 13 Jun 2017, Stephen Rothwell wrote:
> > After merging the block tree, today's linux-next build (s390x
> > s390-defconfig) failed like this:
> > 
> > drivers/s390/block/scm_blk.c:293:10: error: 'BLK_MQ_RQ_QUEUE_BUSY' undeclared (first use in this function)
> > drivers/s390/block/scm_blk.c:327:9: error: 'BLK_MQ_RQ_QUEUE_OK' undeclared (first use in this function)
> > 
> > Caused by commit
> > 
> >   fc17b6534eb8 ("blk-mq: switch ->queue_rq return value to blk_status_t")
> > 
> > interacting with commit
> > 
> >   12d907626539 ("s390/scm: convert to blk-mq")
> > 
> > from the s390 tree.
> > 
> > Is the following the correct merge fixup?
> 
> Yes, that looks good!

Ok, we should also adjust the return code to fix this:

drivers/s390/block/scm_blk.c:426:2: warning: initialization from incompatible pointer type [enabled by default]
  .queue_rq = scm_blk_request,
  ^

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index 2cd6123c8f18..4279685901bf 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -278,8 +278,8 @@ struct scm_queue {
 	spinlock_t lock;
 };
 
-static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
-			   const struct blk_mq_queue_data *qd)
+static blk_status_t scm_blk_request(struct blk_mq_hw_ctx *hctx,
+				    const struct blk_mq_queue_data *qd)
 {
 	struct scm_device *scmdev = hctx->queue->queuedata;
 	struct scm_blk_dev *bdev = dev_get_drvdata(&scmdev->dev);
