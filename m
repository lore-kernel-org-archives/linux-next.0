From: Tejun Heo <tj@kernel.org>
Subject: [PATCH block/for-linus] block: export bio_associate_*() and
 wbc_account_io()
Date: Thu, 23 Jul 2015 14:27:09 -0400
Message-ID: <20150723182709.GQ15934@mtj.duckdns.org>
References: <20150723105623.2f8c9548@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:34235 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490AbbGWS1N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2015 14:27:13 -0400
Content-Disposition: inline
In-Reply-To: <20150723105623.2f8c9548@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Chris Mason <clm@fb.com>, kernel-team@fb.com

bio_associate_blkcg(), bio_associate_current() and wbc_account_io()
are used to implement cgroup writeback support for filesystems and
thus need to be exported.  Export them.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
Hello, Jens.

While this change isn't strictly necessary for 4.2, I think it'd
better to push it through for-linus so that it's there before any
filesystem specific changes are merged.

Thanks.

 block/bio.c       |    2 ++
 fs/fs-writeback.c |    1 +
 2 files changed, 3 insertions(+)

--- a/block/bio.c
+++ b/block/bio.c
@@ -2009,6 +2009,7 @@ int bio_associate_blkcg(struct bio *bio,
 	bio->bi_css = blkcg_css;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(bio_associate_blkcg);
 
 /**
  * bio_associate_current - associate a bio with %current
@@ -2039,6 +2040,7 @@ int bio_associate_current(struct bio *bi
 	bio->bi_css = task_get_css(current, blkio_cgrp_id);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(bio_associate_current);
 
 /**
  * bio_disassociate_task - undo bio_associate_current()
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -702,6 +702,7 @@ void wbc_account_io(struct writeback_con
 	else
 		wbc->wb_tcand_bytes -= min(bytes, wbc->wb_tcand_bytes);
 }
+EXPORT_SYMBOL_GPL(wbc_account_io);
 
 /**
  * inode_congested - test whether an inode is congested
