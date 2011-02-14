From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cleancache tree with Linus' tree
Date: Mon, 14 Feb 2011 17:17:15 +1100
Message-ID: <20110214171715.5f3c6cb4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59480 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750911Ab1BNGRS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Feb 2011 01:17:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boaz Harrosh <bharrosh@panasas.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Dan,

Today's linux-next merge of the cleancache tree got a conflict in
fs/super.c between commit d863b50ab01333659314c2034890cb76d9fdc3c7 ("vfs:
call rcu_barrier after ->kill_sb()") from Linus' tree and commit
03e838947c8abe29a9d7abfaf7fd9125a46b70e9 ("mm/fs: add hooks to support
cleancache") from the cleancache tree.

I fixed it up (see below) and can carry the fix as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/super.c
index 7e9dd4c,30a54e0..0000000
--- a/fs/super.c
+++ b/fs/super.c
@@@ -30,7 -30,7 +30,8 @@@
  #include <linux/idr.h>
  #include <linux/mutex.h>
  #include <linux/backing-dev.h>
 +#include <linux/rculist_bl.h>
+ #include <linux/cleancache.h>
  #include "internal.h"
  
  
@@@ -177,11 -178,7 +179,12 @@@ void deactivate_locked_super(struct sup
  	struct file_system_type *fs = s->s_type;
  	if (atomic_dec_and_test(&s->s_active)) {
  		fs->kill_sb(s);
 +		/*
 +		 * We need to call rcu_barrier so all the delayed rcu free
 +		 * inodes are flushed before we release the fs module.
 +		 */
 +		rcu_barrier();
+ 		cleancache_flush_fs(s);
  		put_filesystem(fs);
  		put_super(s);
  	} else {
