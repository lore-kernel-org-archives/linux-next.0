From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] quota: fix redefinition of sync_quota_sb()
Date: Tue,  5 May 2009 14:43:55 +0400
Message-ID: <1241520235-16083-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: Alexander Beregalov <a.beregalov@gmail.com>
List-Id: linux-next.vger.kernel.org

Fix this build error when CONFIG_QUOTA is not set:
fs/quota/quota.c:162: error: redefinition of 'sync_quota_sb'
include/linux/quotaops.h:338: error: previous definition of 'sync_quota_sb' was here

sync_quota_sb() is already defined as "static inline" with empty body.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 fs/quota/quota.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 5edb20d..95c5b42 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -159,6 +159,7 @@ static int check_quotactl_valid(struct super_block *sb, int type, int cmd,
 	return error;
 }
 
+#ifdef CONFIG_QUOTA
 void sync_quota_sb(struct super_block *sb, int type)
 {
 	int cnt;
@@ -194,6 +195,7 @@ void sync_quota_sb(struct super_block *sb, int type)
 	}
 	mutex_unlock(&sb_dqopt(sb)->dqonoff_mutex);
 }
+#endif
 
 static void sync_dquots(int type)
 {
-- 
1.6.2.3

