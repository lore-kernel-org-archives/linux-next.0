From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 10 Jul 2017 15:21:34 +1000
Message-ID: <20170710152134.0f78c1e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750969AbdGJFVh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jul 2017 01:21:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/uapi/linux/stddef.h:1:0,
                 from include/linux/stddef.h:4,
                 from include/uapi/linux/posix_types.h:4,
                 from include/uapi/linux/types.h:13,
                 from include/linux/types.h:5,
                 from include/linux/syscalls.h:71,
                 from fs/dcache.c:17:
fs/dcache.c: In function 'release_dentry_name_snapshot':
include/linux/compiler.h:542:38: error: call to '__compiletime_assert_305' declared with attribute error: pointer type mismatch in container_of()
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:525:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
include/linux/compiler.h:542:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/build_bug.h:46:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/kernel.h:860:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
  ^
fs/dcache.c:305:7: note: in expansion of macro 'container_of'
   p = container_of(name->name, struct external_name, name[0]);
       ^

Caused by commit

  2f23633e9c84 ("kernel.h: handle pointers to arrays better in container_of()")

interacting with commit

  49d31c2f389a ("dentry name snapshots")

from the vfs tree.

I applied the following fix patch.  I hope it is ok.  If so, please
apply to the vfs tree.

-- 
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Jul 2017 15:09:12 +1000
Subject: [PATCH] fix type for "dentry name snapshots"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/dcache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index fcaba2d8638a..aae1cdb76851 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -597,8 +597,8 @@ static inline struct inode *d_real_inode(const struct dentry *dentry)
 }
 
 struct name_snapshot {
-	const char *name;
-	char inline_name[DNAME_INLINE_LEN];
+	const unsigned char *name;
+	unsigned char inline_name[DNAME_INLINE_LEN];
 };
 void take_dentry_name_snapshot(struct name_snapshot *, struct dentry *);
 void release_dentry_name_snapshot(struct name_snapshot *);
-- 
2.13.2
