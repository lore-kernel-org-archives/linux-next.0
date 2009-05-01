From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree with Linus' tree
Date: Fri, 1 May 2009 11:10:07 +1000
Message-ID: <20090501111007.83f1db68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56451 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751943AbZEABKI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 21:10:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, Borislav Petkov <petkovbb@gmail.com>, Jerome Marchand <jmarchan@redhat.com>, Jens Axboe <jens.axboe@oracle.com>

Hi Bartlomiej,

Today's linux-next merge of the ide tree got a conflict in
include/linux/blkdev.h between commit
42dad7647aec49b3ad20dd0cb832b232a6ae514f ("block: simplify I/O stat
accounting") from Linus' tree and commit
96c16743973e8c1a7b9c655d10b7973408d6d1dd ("ide-cd: fix REQ_QUIET tests in
cdrom_decode_status") from the ide tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/blkdev.h
index 2755d5c,6f841fb..0000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -600,7 -598,7 +600,8 @@@ enum 
  				 blk_failfast_transport(rq) ||	\
  				 blk_failfast_driver(rq))
  #define blk_rq_started(rq)	((rq)->cmd_flags & REQ_STARTED)
+ #define blk_rq_quiet(rq)	((rq)->cmd_flags & REQ_QUIET)
 +#define blk_rq_io_stat(rq)	((rq)->cmd_flags & REQ_IO_STAT)
  
  #define blk_account_rq(rq)	(blk_rq_started(rq) && (blk_fs_request(rq) || blk_discard_rq(rq))) 
  
