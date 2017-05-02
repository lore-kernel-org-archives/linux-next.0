From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Tue, 2 May 2017 13:17:22 +1000
Message-ID: <20170502131722.77a4c2b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750902AbdEBDRZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 23:17:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@fb.com>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/nvdimm/pmem.c: In function 'pmem_freeze_queue':
drivers/nvdimm/pmem.c:237:2: error: implicit declaration of function 'blk_mq_freeze_queue_start' [-Werror=implicit-function-declaration]
  blk_mq_freeze_queue_start(q);
  ^

Caused by commit

  71389703839e ("mm, zone_device: Replace {get, put}_zone_device_page() with a single reference to fix pmem crash")

interacting with commit

  1671d522cdd9 ("block: rename blk_mq_freeze_queue_start()")

from Linus' tree.

I have applied the merge fix patch below.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 May 2017 13:09:41 +1000
Subject: [PATCH] mm, zone_device: merge fix up for blk_mq_freeze_queue_start()
 rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvdimm/pmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index fb7bbc79ac26..fbc640bf06b0 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -234,7 +234,7 @@ static void pmem_release_queue(void *q)
 
 static void pmem_freeze_queue(void *q)
 {
-	blk_mq_freeze_queue_start(q);
+	blk_freeze_queue_start(q);
 }
 
 static void pmem_release_disk(void *disk)
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
