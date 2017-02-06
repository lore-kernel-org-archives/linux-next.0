From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Mon, 6 Feb 2017 16:04:51 +1100
Message-ID: <20170206160451.537ce0f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ram Pai <linuxram@us.ibm.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/uapi/linux/stddef.h:1:0,
                 from include/linux/stddef.h:4,
                 from include/uapi/linux/posix_types.h:4,
                 from include/uapi/linux/types.h:13,
                 from include/linux/types.h:5,
                 from include/linux/list.h:4,
                 from include/linux/module.h:9,
                 from drivers/scsi/mpt3sas/mpt3sas_scsih.c:45:
drivers/scsi/mpt3sas/mpt3sas_scsih.c: In function '_scsih_io_done':
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4750:28: error: 'struct request' has no member named 'cmd_type'
  if (unlikely(scmd->request->cmd_type == REQ_TYPE_FS && sector_sz &&
                            ^
include/linux/compiler.h:179:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4750:42: error: 'REQ_TYPE_FS' undeclared (first use in this function)
  if (unlikely(scmd->request->cmd_type == REQ_TYPE_FS && sector_sz &&
                                          ^
include/linux/compiler.h:179:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4750:42: note: each undeclared identifier is reported only once for each function it appears in
  if (unlikely(scmd->request->cmd_type == REQ_TYPE_FS && sector_sz &&
                                          ^
include/linux/compiler.h:179:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^

Caused by commit

  f2e767bb5d6e ("scsi: mpt3sas: Force request partial completion alignment")

interacting with commit

  aebf526b53ae ("block: fold cmd_type into the REQ_OP_ space")

from the block tree.

I have applied teh following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Feb 2017 16:00:54 +1100
Subject: [PATCH] scsi: mpt3sas: fix up for "block: fold cmd_type into the
 REQ_OP_ space"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/mpt3sas/mpt3sas_scsih.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 5f7b0c7d7e4d..81a64678390d 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -4747,7 +4747,7 @@ _scsih_io_done(struct MPT3SAS_ADAPTER *ioc, u16 smid, u8 msix_index, u32 reply)
 	 * then scsi-ml does not need to handle this misbehavior.
 	 */
 	sector_sz = scmd->device->sector_size;
-	if (unlikely(scmd->request->cmd_type == REQ_TYPE_FS && sector_sz &&
+	if (unlikely(!blk_rq_is_passthrough(scmd->request) && sector_sz &&
 		     xfer_cnt % sector_sz)) {
 		sdev_printk(KERN_INFO, scmd->device,
 		    "unaligned partial completion avoided (xfer_cnt=%u, sector_sz=%u)\n",
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
