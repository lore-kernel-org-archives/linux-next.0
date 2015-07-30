From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the f2fs tree
Date: Thu, 30 Jul 2015 13:19:43 +1000
Message-ID: <20150730131943.3ab8bac5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33441 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751130AbbG3DTq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2015 23:19:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Chao Yu <chao2.yu@samsung.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/f2fs/data.c

between commit:

  8e5b935bf1ce ("f2fs: maintain extent cache in separated file")

from the f2fs tree and commit:

  4246a0b63bd8 ("block: add a bi_error field to struct bio")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/f2fs/data.c
index 111f180fd1d2,8f0baa7ffb50..000000000000
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@@ -27,7 -26,10 +27,7 @@@
  #include "trace.h"
  #include <trace/events/f2fs.h>
  
- static void f2fs_read_end_io(struct bio *bio, int err)
 -static struct kmem_cache *extent_tree_slab;
 -static struct kmem_cache *extent_node_slab;
 -
+ static void f2fs_read_end_io(struct bio *bio)
  {
  	struct bio_vec *bvec;
  	int i;
