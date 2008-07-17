From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH 3/3] proc: make grab_header static
Date: Thu, 17 Jul 2008 14:22:35 -0700
Message-ID: <1216329755.6029.31.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.173]:50666 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758311AbYGQVWi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 17:22:38 -0400
Received: by wf-out-1314.google.com with SMTP id 27so91449wfd.4
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 14:22:38 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>

fs/proc/proc_sysctl.c:69:25: warning: symbol 'grab_header' was not declared. Should it be static?

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080716 and next-20080717

 fs/proc/proc_sysctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index f9a8b89..84f58e8 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -66,7 +66,7 @@ static struct ctl_table *find_in_table(struct ctl_table *p, struct qstr *name)
 	return NULL;
 }
 
-struct ctl_table_header *grab_header(struct inode *inode)
+static struct ctl_table_header *grab_header(struct inode *inode)
 {
 	if (PROC_I(inode)->sysctl)
 		return sysctl_head_grab(PROC_I(inode)->sysctl);
-- 
1.5.6.3.536.g61aad
