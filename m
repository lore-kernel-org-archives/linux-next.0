From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Mon, 15 Dec 2008 18:08:31 +1100
Message-ID: <20081215180831.d0eee19b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41911 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754215AbYLOHIe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 02:08:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in fs/bio.c
between commit 0bfc24559d7945506184d86739fe365a181f06b7 ("blktrace: port
to tracepoints, update") from the ftrace tree and commit
18e08407d87bed3a9c4205e53bb16fe36088a521 ("bio: allow individual slabs in
the bio_set") from the block tree.

Just an overlapping addition/removal.  I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/bio.c
index df99c88,3bd633d..0000000
--- a/fs/bio.c
+++ b/fs/bio.c
@@@ -26,12 -26,13 +26,16 @@@
  #include <linux/mempool.h>
  #include <linux/workqueue.h>
  #include <linux/blktrace_api.h>
 +#include <trace/block.h>
  #include <scsi/sg.h>		/* for struct sg_iovec */
  
 +DEFINE_TRACE(block_split);
 +
- static struct kmem_cache *bio_slab __read_mostly;
+ /*
+  * Test patch to inline a certain number of bi_io_vec's inside the bio
+  * itself, to shrink a bio data allocation from two mempool calls to one
+  */
+ #define BIO_INLINE_VECS		4
  
  static mempool_t *bio_split_pool __read_mostly;
  
