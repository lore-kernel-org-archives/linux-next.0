From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the btrfs-kdave tree
Date: Wed, 7 Sep 2016 11:22:53 +1000
Message-ID: <20160907112253.3bd54c49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41953 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755902AbcIGBW4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Sep 2016 21:22:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <jbacik@fb.com>, Jan Kara <jack@suse.cz>

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/ntfs/attrib.c: In function 'ntfs_attr_set':
fs/ntfs/attrib.c:2549:35: error: implicit declaration of function 'inode_to_bdi' [-Werror=implicit-function-declaration]
   balance_dirty_pages_ratelimited(inode_to_bdi(inode),
                                   ^
fs/ntfs/attrib.c:2549:35: warning: passing argument 1 of 'balance_dirty_pages_ratelimited' makes pointer from integer without a cast [-Wint-conversion]
In file included from include/linux/memcontrol.h:30:0,
                 from include/linux/swap.h:8,
                 from fs/ntfs/attrib.c:26:
include/linux/writeback.h:367:6: note: expected 'struct backing_dev_info *' but argument is of type 'int'
 void balance_dirty_pages_ratelimited(struct backing_dev_info *bdi,
      ^
fs/ntfs/attrib.c:2591:35: warning: passing argument 1 of 'balance_dirty_pages_ratelimited' makes pointer from integer without a cast [-Wint-conversion]
   balance_dirty_pages_ratelimited(inode_to_bdi(inode),
                                   ^
In file included from include/linux/memcontrol.h:30:0,
                 from include/linux/swap.h:8,
                 from fs/ntfs/attrib.c:26:
include/linux/writeback.h:367:6: note: expected 'struct backing_dev_info *' but argument is of type 'int'
 void balance_dirty_pages_ratelimited(struct backing_dev_info *bdi,
      ^
fs/ntfs/attrib.c:2609:35: warning: passing argument 1 of 'balance_dirty_pages_ratelimited' makes pointer from integer without a cast [-Wint-conversion]
   balance_dirty_pages_ratelimited(inode_to_bdi(inode),
                                   ^
In file included from include/linux/memcontrol.h:30:0,
                 from include/linux/swap.h:8,
                 from fs/ntfs/attrib.c:26:
include/linux/writeback.h:367:6: note: expected 'struct backing_dev_info *' but argument is of type 'int'
 void balance_dirty_pages_ratelimited(struct backing_dev_info *bdi,
      ^

Caused by commit

  a685fa61566d ("remove mapping from balance_dirty_pages*()")

I assume some forgotten include(s).

I have used the btrfs-kdave tree from next-20160906 for today.

-- 
Cheers,
Stephen Rothwell
