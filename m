From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Fri, 5 Sep 2008 16:12:12 +1000
Message-ID: <20080905161212.e3612601.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39669 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752377AbYIEGMm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Sep 2008 02:12:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Mike Christie <michaelc@cs.wisc.edu>, James Bottomley <James.Bottomley@HansenPartnership.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
include/linux/bio.h and include/linux/blkdev.h between commit
81449f3f2013d92ec3bcb9d2c1877ce3140d2271 ("[SCSI] block: separate
failfast into multiple bits") from the scsi tree and commit
5d112a624058caabe5b570d2c9827bce82c18be1 ("Add 'discard' request
handling") from the block tree.

Overlapping changes/additions to some bit definitions.  I have fixed it
up as best I can (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/bio.h
index 425a4ec,7af373f..0000000
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@@ -147,20 -125,18 +125,22 @@@ struct bio 
   * bit 0 -- read (not set) or write (set)
   * bit 1 -- rw-ahead when set
   * bit 2 -- barrier
 - * bit 3 -- fail fast, don't want low level driver retries
 - * bit 4 -- synchronous I/O hint: the block layer will unplug immediately
 - * bit 5 -- metadata request
 - * bit 6 -- discard sectors
 + * bit 3 -- synchronous I/O hint: the block layer will unplug immediately
 + * bit 4 -- meta data
 + * bit 5 -- fail fast device errors
 + * bit 6 -- fail fast transport errors
 + * bit 7 -- fail fast driver errors
++ * bit 8 -- discard sectors
   */
- #define BIO_RW				0
- #define BIO_RW_AHEAD			1
 -#define BIO_RW		0	/* Must match RW in req flags (blkdev.h) */
 -#define BIO_RW_AHEAD	1	/* Must match FAILFAST in req flags */
 -#define BIO_RW_BARRIER	2
 -#define BIO_RW_FAILFAST	3
 -#define BIO_RW_SYNC	4
 -#define BIO_RW_META	5
 -#define BIO_RW_DISCARD	6
++#define BIO_RW				0	/* Must match RW in req flags (blkdev.h) */
++#define BIO_RW_AHEAD			1	/* Must match FAILFAST in req flags */
 +#define BIO_RW_BARRIER			2
 +#define BIO_RW_SYNC			3
 +#define BIO_RW_META			4
 +#define BIO_RW_FAILFAST_DEV		5
 +#define BIO_RW_FAILFAST_TRANSPORT	6
 +#define BIO_RW_FAILFAST_DRIVER		7
++#define BIO_RW_DISCARD			8
  
  /*
   * upper 16 bits of bi_rw define the io priority of this bio
@@@ -187,13 -163,11 +167,14 @@@
  #define bio_sectors(bio)	((bio)->bi_size >> 9)
  #define bio_barrier(bio)	((bio)->bi_rw & (1 << BIO_RW_BARRIER))
  #define bio_sync(bio)		((bio)->bi_rw & (1 << BIO_RW_SYNC))
 -#define bio_failfast(bio)	((bio)->bi_rw & (1 << BIO_RW_FAILFAST))
 +#define bio_failfast_dev(bio)	((bio)->bi_rw &	(1 << BIO_RW_FAILFAST_DEV))
 +#define bio_failfast_transport(bio)	\
 +	((bio)->bi_rw & (1 << BIO_RW_FAILFAST_TRANSPORT))
 +#define bio_failfast_driver(bio) ((bio)->bi_rw & (1 << BIO_RW_FAILFAST_DRIVER))
  #define bio_rw_ahead(bio)	((bio)->bi_rw & (1 << BIO_RW_AHEAD))
  #define bio_rw_meta(bio)	((bio)->bi_rw & (1 << BIO_RW_META))
- #define bio_empty_barrier(bio)	(bio_barrier(bio) && !(bio)->bi_size)
+ #define bio_discard(bio)	((bio)->bi_rw & (1 << BIO_RW_DISCARD))
+ #define bio_empty_barrier(bio)	(bio_barrier(bio) && !bio_has_data(bio) && !bio_discard(bio))
  
  static inline unsigned int bio_cur_sectors(struct bio *bio)
  {
diff --cc include/linux/blkdev.h
index 2d8d90c,4cd8caa..0000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -88,9 -86,8 +86,10 @@@ enum 
   */
  enum rq_flag_bits {
  	__REQ_RW,		/* not set, read. set, write */
 -	__REQ_FAILFAST,		/* no low level driver retries */
 +	__REQ_FAILFAST_DEV,	/* no driver retries of device errors */
 +	__REQ_FAILFAST_TRANSPORT, /* no driver retries of transport errors */
 +	__REQ_FAILFAST_DRIVER,	/* no driver retries of driver errors */
+ 	__REQ_DISCARD,		/* request to discard sectors */
  	__REQ_SORTED,		/* elevator knows about this request */
  	__REQ_SOFTBARRIER,	/* may not be passed by ioscheduler */
  	__REQ_HARDBARRIER,	/* may not be passed by drive either */
@@@ -113,9 -110,8 +112,10 @@@
  };
  
  #define REQ_RW		(1 << __REQ_RW)
 +#define REQ_FAILFAST_DEV	(1 << __REQ_FAILFAST_DEV)
 +#define REQ_FAILFAST_TRANSPORT	(1 << __REQ_FAILFAST_TRANSPORT)
 +#define REQ_FAILFAST_DRIVER	(1 << __REQ_FAILFAST_DRIVER)
+ #define REQ_DISCARD	(1 << __REQ_DISCARD)
 -#define REQ_FAILFAST	(1 << __REQ_FAILFAST)
  #define REQ_SORTED	(1 << __REQ_SORTED)
  #define REQ_SOFTBARRIER	(1 << __REQ_SOFTBARRIER)
  #define REQ_HARDBARRIER	(1 << __REQ_HARDBARRIER)
@@@ -537,15 -535,10 +539,15 @@@ enum 
  #define blk_special_request(rq)	((rq)->cmd_type == REQ_TYPE_SPECIAL)
  #define blk_sense_request(rq)	((rq)->cmd_type == REQ_TYPE_SENSE)
  
 -#define blk_noretry_request(rq)	((rq)->cmd_flags & REQ_FAILFAST)
 +#define blk_failfast_dev(rq)	((rq)->cmd_flags & REQ_FAILFAST_DEV)
 +#define blk_failfast_transport(rq) ((rq)->cmd_flags & REQ_FAILFAST_TRANSPORT)
 +#define blk_failfast_driver(rq)	((rq)->cmd_flags & REQ_FAILFAST_DRIVER)
 +#define blk_noretry_request(rq)	(blk_failfast_dev(rq) ||	\
 +				 blk_failfast_transport(rq) ||	\
 +				 blk_failfast_driver(rq))
  #define blk_rq_started(rq)	((rq)->cmd_flags & REQ_STARTED)
  
- #define blk_account_rq(rq)	(blk_rq_started(rq) && blk_fs_request(rq))
+ #define blk_account_rq(rq)	(blk_rq_started(rq) && (blk_fs_request(rq) || blk_discard_rq(rq))) 
  
  #define blk_pm_suspend_request(rq)	((rq)->cmd_type == REQ_TYPE_PM_SUSPEND)
  #define blk_pm_resume_request(rq)	((rq)->cmd_type == REQ_TYPE_PM_RESUME)
