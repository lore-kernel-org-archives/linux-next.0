From: Li Zhong <lizhongfs@gmail.com>
Subject: [PATCH next] fix unused variable compiler warning
Date: Fri, 16 Aug 2013 14:48:34 +0800
Message-ID: <1376635714.2642.6.camel@ThinkPad-T5421>
Reply-To: lizhongfs@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:55311 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018Ab3HPGsk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2013 02:48:40 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so1841713pde.23
        for <linux-next@vger.kernel.org>; Thu, 15 Aug 2013 23:48:39 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>

fs/ext4/extents_status.c:950:6: warning: unused variable
'ret' [-Wunused-variable]

Signed-off-by: Li Zhong <lizhongfs@gmail.com>
---
 fs/ext4/extents_status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index dc709e1..6708257 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -947,7 +947,7 @@ static int __ext4_es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 	struct ext4_inode_info *ei;
 	struct list_head *cur, *tmp;
 	LIST_HEAD(skipped);
-	int ret, nr_shrunk = 0;
+	int nr_shrunk = 0;
 	int retried = 0, skip_precached = 1, nr_skipped = 0;
 
 	spin_lock(&sbi->s_es_lru_lock);
