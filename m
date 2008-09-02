From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Tue, 2 Sep 2008 15:59:39 +1000
Message-ID: <20080902155939.b4a045ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40034 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751505AbYIBF7q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Sep 2008 01:59:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Mike Anderson <andmike@linux.vnet.ibm.com>, Kiyoshi Ueda <k-ueda@ct.jp.nec.com>, Alasdair G Kergon <agk@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/md/dm-mpath.c between commit
a51365f80fbb8b5152d1655581f93704dd989f86
("dm-mpath-remove-is_active-from-struct-dm_path") from the device-mapper
tree and commit 5ee80e583691a8d2012384d380afdff15dd28c8a ("dm: Call
blk_abort_queue on failed paths") from the block tree.

Just changes in context.  I fixed it up (see below) and can carry the
patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/md/dm-mpath.c
index 1a62196,2e16ea9..0000000
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@@ -122,8 -123,10 +124,10 @@@ static struct pgpath *alloc_pgpath(void
  {
  	struct pgpath *pgpath = kzalloc(sizeof(*pgpath), GFP_KERNEL);
  
- 	if (pgpath)
+ 	if (pgpath) {
 -		pgpath->path.is_active = 1;
 +		pgpath->is_active = 1;
+ 		INIT_WORK(&pgpath->deactivate_path, deactivate_path);
+ 	}
  
  	return pgpath;
  }
