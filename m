From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] gfs2: remove nameidata arg from gfs_iop_permission
Date: Fri, 18 Jul 2008 09:26:42 -0700
Message-ID: <1216398403.6029.145.camel@brick>
References: <1216328912.6029.18.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:33107 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757409AbYGRRN3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 13:13:29 -0400
Received: by yx-out-2324.google.com with SMTP id 8so145435yxm.1
        for <linux-next@vger.kernel.org>; Fri, 18 Jul 2008 10:13:28 -0700 (PDT)
In-Reply-To: <1216328912.6029.18.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>

Noticed by sparse
> fs/gfs2/ops_inode.c:1153:16: warning: incorrect type in initializer (different argument counts)
> fs/gfs2/ops_inode.c:1153:16:    expected int ( *permission )( ... )
> fs/gfs2/ops_inode.c:1153:16:    got int ( static [toplevel] *<noident> )( ... )
> fs/gfs2/ops_inode.c:1172:16: warning: incorrect type in initializer (different argument counts)
> fs/gfs2/ops_inode.c:1172:16:    expected int ( *permission )( ... )
> fs/gfs2/ops_inode.c:1172:16:    got int ( static [toplevel] *<noident> )( ... )
> fs/gfs2/ops_inode.c:1184:16: warning: incorrect type in initializer (different argument counts)
> fs/gfs2/ops_inode.c:1184:16:    expected int ( *permission )( ... )
> fs/gfs2/ops_inode.c:1184:16:    got int ( static [toplevel] *<noident> )( ... )
> fs/gfs2/ops_inode.c:1153: warning: initialization from incompatible pointer type
> fs/gfs2/ops_inode.c:1172: warning: initialization from incompatible pointer type
> fs/gfs2/ops_inode.c:1184: warning: initialization from incompatible pointer type

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080716 and next-20080717

 fs/gfs2/ops_inode.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/ops_inode.c b/fs/gfs2/ops_inode.c
index 1e252df..0456e2b 100644
--- a/fs/gfs2/ops_inode.c
+++ b/fs/gfs2/ops_inode.c
@@ -915,8 +915,7 @@ int gfs2_permission(struct inode *inode, int mask)
 	return error;
 }
 
-static int gfs2_iop_permission(struct inode *inode, int mask,
-			       struct nameidata *nd)
+static int gfs2_iop_permission(struct inode *inode, int mask)
 {
 	return gfs2_permission(inode, mask);
 }
-- 
1.5.6.3.569.ga9185
