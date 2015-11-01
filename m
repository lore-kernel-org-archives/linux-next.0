From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 2 Nov 2015 03:29:32 +1100
Message-ID: <20151102032932.3b9eaeb2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48699 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752723AbbKAQ3g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 11:29:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Theodore Ts'o <tytso@mit.edu>

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/ext4/mballoc.c: In function 'ext4_mb_check_group_pa':
/home/sfr/next/next/fs/ext4/mballoc.c:3335:17: error: implicit declaration of function 'abs64' [-Werror=implicit-function-declaration]
  cur_distance = abs64(goal_block - cpa->pa_pstart);
                 ^

Caused by patch

  "Remove abs64()"

interacting with commit

  1a70ea8d47aa ("ext4: fix abs() usage in ext4_mb_check_group_pa")

from the ext4 tree.

I just reverted the ext4 tree commit as it is no longer needed:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Nov 2015 03:26:31 +1100
Subject: [PATCH] Revert "ext4: fix abs() usage in ext4_mb_check_group_pa"

This reverts commit 1a70ea8d47aa484e03b2540f7523f429f5af2334.
---
 fs/ext4/mballoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 1e97ac1dd4bb..b4da7f2a5db2 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -3332,8 +3332,8 @@ ext4_mb_check_group_pa(ext4_fsblk_t goal_block,
 		atomic_inc(&pa->pa_count);
 		return pa;
 	}
-	cur_distance = abs64(goal_block - cpa->pa_pstart);
-	new_distance = abs64(goal_block - pa->pa_pstart);
+	cur_distance = abs(goal_block - cpa->pa_pstart);
+	new_distance = abs(goal_block - pa->pa_pstart);
 
 	if (cur_distance <= new_distance)
 		return cpa;
-- 
2.6.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
