From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the ide tree
Date: Tue, 9 Jun 2009 15:09:31 +1000
Message-ID: <20090609150931.9aa5da56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54619 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756113AbZFIGeb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 02:34:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <petkovbb@googlemail.com>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Tejun Heo <tj@kernel.org>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/ide/ide-atapi.c between several commit
626542ca2277961aaa64855206574f8ca4f360e3 ("ide-tape: change
IDE_AFLAG_IGNORE_DSC non-atomically") from the ide tree and commit
8f6205cd572fece673da0255d74843680f67f879 ("ide: dequeue in-flight
request") from the block tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/ide/ide-atapi.c
index fbcb851,8a894fa..0000000
--- a/drivers/ide/ide-atapi.c
+++ b/drivers/ide/ide-atapi.c
@@@ -255,13 -256,22 +256,22 @@@ void ide_retry_pc(ide_drive_t *drive
  	ide_init_pc(pc);
  	memcpy(pc->c, sense_rq->cmd, 12);
  	pc->buf = bio_data(sense_rq->bio);	/* pointer to mapped address */
- 	pc->req_xfer = sense_rq->data_len;
+ 	pc->req_xfer = blk_rq_bytes(sense_rq);
  
  	if (drive->media == ide_tape)
 -		set_bit(IDE_AFLAG_IGNORE_DSC, &drive->atapi_flags);
 +		drive->atapi_flags |= IDE_AFLAG_IGNORE_DSC;
  
- 	if (ide_queue_sense_rq(drive, pc))
- 		ide_complete_rq(drive, -EIO, blk_rq_bytes(drive->hwif->rq));
+ 	/*
+ 	 * Push back the failed request and put request sense on top
+ 	 * of it.  The failed command will be retried after sense data
+ 	 * is acquired.
+ 	 */
+ 	blk_requeue_request(failed_rq->q, failed_rq);
+ 	drive->hwif->rq = NULL;
+ 	if (ide_queue_sense_rq(drive, pc)) {
+ 		blk_start_request(failed_rq);
+ 		ide_complete_rq(drive, -EIO, blk_rq_bytes(failed_rq));
+ 	}
  }
  EXPORT_SYMBOL_GPL(ide_retry_pc);
  
