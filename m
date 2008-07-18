From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] security: capability.c remove nameidata argument
Date: Fri, 18 Jul 2008 11:20:56 -0700
Message-ID: <1216405257.6029.151.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:54101 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759401AbYGRSU7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 14:20:59 -0400
Received: by yx-out-2324.google.com with SMTP id 8so155448yxm.1
        for <linux-next@vger.kernel.org>; Fri, 18 Jul 2008 11:20:58 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

In next-20080718
security/capability.c:865:2: warning: incorrect type in assignment (different argument counts)
security/capability.c:865:2:    expected int ( *inode_permission )( ... )
security/capability.c:865:2:    got int ( static [toplevel] *<noident> )( ... )

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
 security/capability.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/security/capability.c b/security/capability.c
index 5b01c0b..63d10da 100644
--- a/security/capability.c
+++ b/security/capability.c
@@ -211,8 +211,7 @@ static int cap_inode_follow_link(struct dentry *dentry,
 	return 0;
 }
 
-static int cap_inode_permission(struct inode *inode, int mask,
-				struct nameidata *nd)
+static int cap_inode_permission(struct inode *inode, int mask)
 {
 	return 0;
 }
-- 
1.5.6.3.569.ga9185
