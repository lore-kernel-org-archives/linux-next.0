From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 20 Mar 2017 16:37:35 +1100
Message-ID: <20170320163735.332e64b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43429 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751986AbdCTFiP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Mar 2017 01:38:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>, Chao Yu <yuchao0@huawei.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/f2fs/node.c: In function 'init_free_nid_cache':
fs/f2fs/node.c:2634:25: error: implicit declaration of function 'f2fs_kvzalloc' [-Werror=implicit-function-declaration]
  nm_i->free_nid_count = f2fs_kvzalloc(nm_i->nat_blocks *
                         ^
fs/f2fs/node.c:2634:23: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  nm_i->free_nid_count = f2fs_kvzalloc(nm_i->nat_blocks *
                       ^

Caused by commit

  69e5e80117a3 ("mm: introduce kv[mz]alloc helpers")

interacting with commit

  c48b15867a2f ("f2fs: skip scanning free nid bitmap of full NAT blocks")

from the f2fs tree.

I applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Mar 2017 16:28:21 +1100
Subject: [PATCH] mm: introduce kv[mz]alloc helpers - f2fs fix up

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cdbb05745895..0ea1dca8a0e2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2631,7 +2631,7 @@ static int init_free_nid_cache(struct f2fs_sb_info *sbi)
 	if (!nm_i->nat_block_bitmap)
 		return -ENOMEM;
 
-	nm_i->free_nid_count = f2fs_kvzalloc(nm_i->nat_blocks *
+	nm_i->free_nid_count = kvzalloc(nm_i->nat_blocks *
 					sizeof(unsigned short), GFP_KERNEL);
 	if (!nm_i->free_nid_count)
 		return -ENOMEM;
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
