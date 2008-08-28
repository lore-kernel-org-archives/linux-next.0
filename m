From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Thu, 28 Aug 2008 15:30:27 +1000
Message-ID: <20080828153027.65912347.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43634 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753068AbYH1Fad (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 01:30:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
include/linux/genhd.h between commit
abf5439370491dd6fbb4fe1a7939680d2a9bc9d4 ("block: move cmdfilter from
gendisk to request_queue") from Linus' tree (which also exists in the
block tree) and commit 53b83963cc042f14b9773a1cee5a831799f6fd1a ("block:
make partition array dynamic") from the block tree.

It looks as though the latter patch has readded some bits that were
moved to include/linux/blkdev.h by the former patch.  I fixed it up (see
below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/genhd.h
index be4f5e5,206cdf9..0000000
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@@ -108,9 -115,27 +115,18 @@@ struct hd_struct 
  #define GENHD_FL_CD				8
  #define GENHD_FL_UP				16
  #define GENHD_FL_SUPPRESS_PARTITION_INFO	32
- #define GENHD_FL_FAIL				64
+ #define GENHD_FL_EXT_DEVT			64 /* allow extended devt */
+ 
 -#define BLK_SCSI_MAX_CMDS	(256)
 -#define BLK_SCSI_CMD_PER_LONG	(BLK_SCSI_MAX_CMDS / (sizeof(long) * 8))
 -
 -struct blk_scsi_cmd_filter {
 -	unsigned long read_ok[BLK_SCSI_CMD_PER_LONG];
 -	unsigned long write_ok[BLK_SCSI_CMD_PER_LONG];
 -	struct kobject kobj;
 -};
 -
+ struct disk_part_tbl {
+ 	struct rcu_head rcu_head;
+ 	int len;
+ 	struct hd_struct *part[];
+ };
  
  struct gendisk {
+ 	/* major, first_minor and minors are input parameters only,
+ 	 * don't use directly.  Use disk_devt() and disk_max_parts().
+ 	 */
  	int major;			/* major number of driver */
  	int first_minor;
  	int minors;                     /* maximum number of minors, =1 for
