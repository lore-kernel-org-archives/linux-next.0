From: Namhyung Kim <namhyung@gmail.com>
Subject: [PATCH] block: fix an warning of calling blk_rq_aligned()
Date: Thu, 16 Sep 2010 12:55:57 +0900
Message-ID: <1284609357-3076-1-git-send-email-namhyung@gmail.com>
References: <20100916133005.56baad7e.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:54609 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752386Ab0IPD4K (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Sep 2010 23:56:10 -0400
In-Reply-To: <20100916133005.56baad7e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2nd argument of blk_rq_aligned() has changed to 'unsigned long' by
previous commit 'block: fix an address space warning in blk-map.c'.
According to that change, its caller has to be modified. This also
removes address space warnings from sparse.

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
 drivers/scsi/sg.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 78d6163..655ab92 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1657,7 +1657,7 @@ static int sg_start_req(Sg_request *srp, unsigned char *cmd)
 	if (sg_allow_dio && hp->flags & SG_FLAG_DIRECT_IO &&
 	    dxfer_dir != SG_DXFER_UNKNOWN && !iov_count &&
 	    !sfp->parentdp->device->host->unchecked_isa_dma &&
-	    blk_rq_aligned(q, hp->dxferp, dxfer_len))
+	    blk_rq_aligned(q, (unsigned long)hp->dxferp, dxfer_len))
 		md = NULL;
 	else
 		md = &map_data;
-- 
1.7.2.2
