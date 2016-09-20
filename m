From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Sep 2016 16:26:30 +1000
Message-ID: <20160920162630.0724a982@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35980 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752075AbcITG0e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 02:26:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/notify/notification.c: In function 'fsnotify_add_event':
fs/notify/notification.c:116:22: error: 'struct fsnotify_group' has no member named 'notification_mutex'
   mutex_unlock(&group->notification_mutex);
                      ^

Caused by a bad git merge automatic resolution.  I had to apply the
following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 20 Sep 2016 16:23:48 +1000
Subject: [PATCH] fix bad merge of fs/notify/notification.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/notify/notification.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/notify/notification.c b/fs/notify/notification.c
index ac14fa4d266b..1a8010e7a2a0 100644
--- a/fs/notify/notification.c
+++ b/fs/notify/notification.c
@@ -112,11 +112,6 @@ int fsnotify_add_event(struct fsnotify_group *group,
 		return 2;
 	}
 
-	if (group->shutdown) {
-		mutex_unlock(&group->notification_mutex);
-		return 2;
-	}
-
 	if (group->q_len >= group->max_events) {
 		ret = 2;
 		/* Queue overflow event only if it isn't already queued */
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
