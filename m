From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 30 Jan 2017 12:43:50 +1100
Message-ID: <20170130124350.36a57549@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51293 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751553AbdA3Bnx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Jan 2017 20:43:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Jens,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/nvme/host/scsi.c: In function 'nvme_scsi_translate':
drivers/nvme/host/scsi.c:2350:9: error: 'BLK_MAX_CDB' undeclared (first use in this function)
  u8 cmd[BLK_MAX_CDB];
         ^
drivers/nvme/host/scsi.c:2350:9: note: each undeclared identifier is reported only once for each function it appears in
drivers/nvme/host/scsi.c:2350:5: warning: unused variable 'cmd' [-Wunused-variable]
  u8 cmd[BLK_MAX_CDB];
     ^
drivers/nvme/host/scsi.c: In function 'nvme_sg_io':
drivers/nvme/host/scsi.c:2454:20: error: 'BLK_MAX_CDB' undeclared (first use in this function)  
  if (hdr.cmd_len > BLK_MAX_CDB)
                    ^

Caused by commit

  82ed4db499b8 ("block: split scsi_request out of struct request")

I have used the block tree from next-20170125 for today.

-- 
Cheers,
Stephen Rothwell
