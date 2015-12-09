From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Wed, 9 Dec 2015 12:19:16 +1100
Message-ID: <20151209121916.1d4cdba4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44725 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751960AbbLIBTU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2015 20:19:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Mike Marshall <hubcap@omnibond.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from fs/orangefs/acl.c:8:0:
fs/orangefs/acl.c: In function 'pvfs2_get_acl':
fs/orangefs/pvfs2-kernel.h:203:38: error: 'POSIX_ACL_XATTR_ACCESS' undeclared (first use in this function)
 #define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
                                      ^
fs/orangefs/acl.c:21:9: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_ACCESS'
   key = PVFS2_XATTR_NAME_ACL_ACCESS;
         ^
fs/orangefs/pvfs2-kernel.h:203:38: note: each undeclared identifier is reported only once for each function it appears in
 #define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
                                      ^
fs/orangefs/acl.c:21:9: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_ACCESS'
   key = PVFS2_XATTR_NAME_ACL_ACCESS;
         ^
fs/orangefs/pvfs2-kernel.h:204:38: error: 'POSIX_ACL_XATTR_DEFAULT' undeclared (first use in this function)
 #define PVFS2_XATTR_NAME_ACL_DEFAULT POSIX_ACL_XATTR_DEFAULT
                                      ^
fs/orangefs/acl.c:24:9: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_DEFAULT'
   key = PVFS2_XATTR_NAME_ACL_DEFAULT;
         ^
fs/orangefs/acl.c: In function 'pvfs2_set_acl':
fs/orangefs/pvfs2-kernel.h:203:38: error: 'POSIX_ACL_XATTR_ACCESS' undeclared (first use in this function)
 #define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
                                      ^
fs/orangefs/acl.c:77:10: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_ACCESS'
   name = PVFS2_XATTR_NAME_ACL_ACCESS;
          ^
fs/orangefs/pvfs2-kernel.h:204:38: error: 'POSIX_ACL_XATTR_DEFAULT' undeclared (first use in this function)
 #define PVFS2_XATTR_NAME_ACL_DEFAULT POSIX_ACL_XATTR_DEFAULT
                                      ^
fs/orangefs/acl.c:101:10: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_DEFAULT'
   name = PVFS2_XATTR_NAME_ACL_DEFAULT;
          ^

Caused by commit

  97d79299223b ("posix acls: Remove duplicate xattr name definitions")

interacting with the addition of orangefs in the orangefs tree.

I applied this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 9 Dec 2015 12:13:37 +1100
Subject: [PATCH] orangefs: update for POSIX ACL name changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/orangefs/pvfs2-kernel.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/orangefs/pvfs2-kernel.h b/fs/orangefs/pvfs2-kernel.h
index 4295e263e25b..9beeddbf8aa9 100644
--- a/fs/orangefs/pvfs2-kernel.h
+++ b/fs/orangefs/pvfs2-kernel.h
@@ -200,8 +200,8 @@ struct client_debug_mask {
 #endif
 #endif
 
-#define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
-#define PVFS2_XATTR_NAME_ACL_DEFAULT POSIX_ACL_XATTR_DEFAULT
+#define PVFS2_XATTR_NAME_ACL_ACCESS  XATTR_NAME_POSIX_ACL_ACCESS
+#define PVFS2_XATTR_NAME_ACL_DEFAULT XATTR_NAME_POSIX_ACL_DEFAULT
 #define PVFS2_XATTR_NAME_TRUSTED_PREFIX "trusted."
 #define PVFS2_XATTR_NAME_DEFAULT_PREFIX ""
 
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
