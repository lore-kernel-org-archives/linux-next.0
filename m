From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Wed, 3 Sep 2008 15:58:58 +1000
Message-ID: <20080903155858.cdd54ca6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34609 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752581AbYICF7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 01:59:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Tejun Heo <tj@kernel.org>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
block/cmd-filter.c between commit
bb23b431db7405f6d79f989ad0236bf6428ba1cb ("remove blk_register_filter and
blk_unregister_filter in gendisk") from Linus' tree and commit
d68103f74be7c93f36705651a2115da177308751 ("block: move holder_dir from
disk to part0") from the block tree.

Just a trivial add/removal clash.  I fixed it up (see below) and can
carry the fix while necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc block/cmd-filter.c
index 228b644,df450d6..0000000
--- a/block/cmd-filter.c
+++ b/block/cmd-filter.c
@@@ -230,6 -225,4 +226,5 @@@ void blk_unregister_filter(struct gendi
  	struct blk_cmd_filter *filter = &disk->queue->cmd_filter;
  
  	kobject_put(&filter->kobj);
- 	kobject_put(disk->holder_dir->parent);
  }
 +EXPORT_SYMBOL(blk_unregister_filter);
