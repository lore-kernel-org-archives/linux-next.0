From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] s390/dasd: hold request queue sysfs lock when calling
 elevator_init()
Date: Thu, 31 Oct 2013 14:21:52 +0100
Message-ID: <20131031132152.GD5551@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:43833 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753660Ab3JaNXO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 09:23:14 -0400
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 31 Oct 2013 13:23:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 06A3117D805F
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 13:22:45 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r9VDLgqM56754318
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 13:21:42 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id r9VDLrDS017110
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 07:21:55 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomoki Sekiyama <tomoki.sekiyama@hds.com>, Jens Axboe <axboe@kernel.dk>, Stefan Weinhuber <wein@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org

Hi Tomoki and Jens,

due to a change in linux-next the patch below is needed for s390 as well.
It looks to me as if the easiest way to get this patch upstream during
the next merge would be via the s390 tree.
Even though I'd much more like if we could get rid of the elevator_init()
call from the dasd driver, but Stefan is still reluctant ;)

>From a59819b17c4a2d06b48ee44236d848161d8d8bb9 Mon Sep 17 00:00:00 2001
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Thu, 31 Oct 2013 13:24:28 +0100
Subject: [PATCH] s390/dasd: hold request queue sysfs lock when calling
 elevator_init()

"elevator: Fix a race in elevator switching and md device initialization"
changed the semantics of elevator_init() in a way that now enforces to hold
the corresponding request queue's sysfs_lock when calling elevator_init()
to fix a race.
The patch did not convert the s390 dasd device driver which is the only
device driver which also calls elevator_init(). So add the missing locking.

Cc: Tomoki Sekiyama <tomoki.sekiyama@hds.com>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/s390/block/dasd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index 244f77f844f0..f302efa937ef 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -2979,12 +2979,12 @@ static int dasd_alloc_queue(struct dasd_block *block)
 
 	elevator_exit(block->request_queue->elevator);
 	block->request_queue->elevator = NULL;
+	mutex_lock(&block->request_queue->sysfs_lock);
 	rc = elevator_init(block->request_queue, "deadline");
-	if (rc) {
+	if (rc)
 		blk_cleanup_queue(block->request_queue);
-		return rc;
-	}
-	return 0;
+	mutex_unlock(&block->request_queue->sysfs_lock);
+	return rc;
 }
 
 /*
-- 
1.8.3.4
