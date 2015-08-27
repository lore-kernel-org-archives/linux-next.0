From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 27 Aug 2015 12:36:57 +1000
Message-ID: <20150827123657.7228e689@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60725 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752211AbbH0Cg7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Aug 2015 22:36:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/fs-writeback.c

between commit:

  006a0973ed02 ("writeback: sync_inodes_sb() must write out I_DIRTY_TIME inodes and always call wait_sb_inodes()")

from Linus' tree and commits:

  1ed8d48c57bf ("writeback: bdi_for_each_wb() iteration is memcg ID based not blkcg")
  8a1270cda7b4 ("writeback: remove wb_writeback_work->single_wait/done")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/fs-writeback.c
index ae0f438c2ee6,f4f0f228a530..000000000000
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@@ -844,24 -783,45 +783,46 @@@ static void bdi_split_work_to_wbs(struc
  	struct wb_iter iter;
  
  	might_sleep();
 -
 -	if (!bdi_has_dirty_io(bdi))
 -		return;
  restart:
  	rcu_read_lock();
- 	bdi_for_each_wb(wb, bdi, &iter, next_blkcg_id) {
+ 	bdi_for_each_wb(wb, bdi, &iter, next_memcg_id) {
+ 		DEFINE_WB_COMPLETION_ONSTACK(fallback_work_done);
+ 		struct wb_writeback_work fallback_work;
+ 		struct wb_writeback_work *work;
+ 		long nr_pages;
+ 
 -		if (!wb_has_dirty_io(wb) ||
 -		    (skip_if_busy && writeback_in_progress(wb)))
 +		/* SYNC_ALL writes out I_DIRTY_TIME too */
 +		if (!wb_has_dirty_io(wb) &&
 +		    (base_work->sync_mode == WB_SYNC_NONE ||
 +		     list_empty(&wb->b_dirty_time)))
 +			continue;
 +		if (skip_if_busy && writeback_in_progress(wb))
  			continue;
  
- 		base_work->nr_pages = wb_split_bdi_pages(wb, nr_pages);
- 		if (!wb_clone_and_queue_work(wb, base_work)) {
- 			next_blkcg_id = wb->blkcg_css->id + 1;
- 			rcu_read_unlock();
- 			wb_wait_for_single_work(bdi, base_work);
- 			goto restart;
+ 		nr_pages = wb_split_bdi_pages(wb, base_work->nr_pages);
+ 
+ 		work = kmalloc(sizeof(*work), GFP_ATOMIC);
+ 		if (work) {
+ 			*work = *base_work;
+ 			work->nr_pages = nr_pages;
+ 			work->auto_free = 1;
+ 			wb_queue_work(wb, work);
+ 			continue;
  		}
+ 
+ 		/* alloc failed, execute synchronously using on-stack fallback */
+ 		work = &fallback_work;
+ 		*work = *base_work;
+ 		work->nr_pages = nr_pages;
+ 		work->auto_free = 0;
+ 		work->done = &fallback_work_done;
+ 
+ 		wb_queue_work(wb, work);
+ 
+ 		next_memcg_id = wb->memcg_css->id + 1;
+ 		rcu_read_unlock();
+ 		wb_wait_for_completion(bdi, &fallback_work_done);
+ 		goto restart;
  	}
  	rcu_read_unlock();
  }
@@@ -900,10 -860,9 +861,8 @@@ static void bdi_split_work_to_wbs(struc
  {
  	might_sleep();
  
 -	if (bdi_has_dirty_io(bdi) &&
 -	    (!skip_if_busy || !writeback_in_progress(&bdi->wb))) {
 +	if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
  		base_work->auto_free = 0;
- 		base_work->single_wait = 0;
- 		base_work->single_done = 0;
  		wb_queue_work(&bdi->wb, base_work);
  	}
  }
