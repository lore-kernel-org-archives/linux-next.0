From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 12 Jan 2017 14:49:33 +1100
Message-ID: <20170112144933.7f161c69@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54015 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750736AbdALDtf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Jan 2017 22:49:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Ren <zren@suse.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from fs/ocfs2/file.c:49:0:
fs/ocfs2/file.c: In function 'ocfs2_permission':
fs/ocfs2/dlmglue.h:189:29: error: inlining failed in call to always_inline 'ocfs2_is_locked_by_me': function body not available
 inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
                             ^
fs/ocfs2/file.c:1345:16: error: called from here
  has_locked = (ocfs2_is_locked_by_me(lockres) != NULL);
                ^
In file included from fs/ocfs2/file.c:49:0:
fs/ocfs2/dlmglue.h:189:29: error: inlining failed in call to always_inline 'ocfs2_is_locked_by_me': function body not available
 inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
                             ^
fs/ocfs2/file.c:1345:16: error: called from here
  has_locked = (ocfs2_is_locked_by_me(lockres) != NULL);
                ^
In file included from fs/ocfs2/file.c:49:0:
fs/ocfs2/dlmglue.h:185:13: error: inlining failed in call to always_inline 'ocfs2_add_holder': function body not available
 inline void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
             ^
fs/ocfs2/file.c:1353:3: error: called from here
   ocfs2_add_holder(lockres, &oh);
   ^
In file included from fs/ocfs2/file.c:49:0:
fs/ocfs2/dlmglue.h:187:13: error: inlining failed in call to always_inline 'ocfs2_remove_holder': function body not available
 inline void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
             ^
fs/ocfs2/file.c:1359:3: error: called from here
   ocfs2_remove_holder(lockres, &oh);
   ^
In file included from fs/ocfs2/acl.c:31:0:
fs/ocfs2/acl.c: In function 'ocfs2_iop_set_acl':
fs/ocfs2/dlmglue.h:189:29: error: inlining failed in call to always_inline 'ocfs2_is_locked_by_me': function body not available
 inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
                             ^
fs/ocfs2/acl.c:292:16: error: called from here
  has_locked = (ocfs2_is_locked_by_me(lockres) != NULL);
                ^
In file included from fs/ocfs2/acl.c:31:0:
fs/ocfs2/dlmglue.h:189:29: error: inlining failed in call to always_inline 'ocfs2_is_locked_by_me': function body not available
 inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
                             ^
fs/ocfs2/acl.c:292:16: error: called from here
  has_locked = (ocfs2_is_locked_by_me(lockres) != NULL);
                ^
In file included from fs/ocfs2/acl.c:31:0:
fs/ocfs2/dlmglue.h:185:13: error: inlining failed in call to always_inline 'ocfs2_add_holder': function body not available
 inline void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
             ^
fs/ocfs2/acl.c:302:3: error: called from here
   ocfs2_add_holder(lockres, &oh);
   ^
In file included from fs/ocfs2/acl.c:31:0:
fs/ocfs2/dlmglue.h:187:13: error: inlining failed in call to always_inline 'ocfs2_remove_holder': function body not available
 inline void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
             ^
fs/ocfs2/acl.c:307:3: error: called from here
   ocfs2_remove_holder(lockres, &oh);
   ^

Caused by commits

  984c4659d463 ("ocfs2/dlmglue: prepare tracking logic to avoid recursive cluster lock")
  0ca17730270e ("ocfs2: fix deadlocks when taking inode lock at vfs entry points")

I applied this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Jan 2017 14:40:03 +1100
Subject: [PATCH] ocfs2/dmglue: do not inline functions whose bodies are not in
 scope

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ocfs2/dlmglue.c | 6 +++---
 fs/ocfs2/dlmglue.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 951f5d9a0884..f0823f4d0afd 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -750,7 +750,7 @@ void ocfs2_lock_res_free(struct ocfs2_lock_res *res)
 	res->l_flags = 0UL;
 }
 
-inline void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
+void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
 				   struct ocfs2_holder *oh)
 {
 	INIT_LIST_HEAD(&oh->oh_list);
@@ -761,7 +761,7 @@ inline void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
 	spin_unlock(&lockres->l_lock);
 }
 
-inline void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
+void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
 				       struct ocfs2_holder *oh)
 {
 	spin_lock(&lockres->l_lock);
@@ -771,7 +771,7 @@ inline void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
 	put_pid(oh->oh_owner_pid);
 }
 
-inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres)
+struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres)
 {
 	struct ocfs2_holder *oh;
 	struct pid *pid;
diff --git a/fs/ocfs2/dlmglue.h b/fs/ocfs2/dlmglue.h
index d65ff1e49552..7f0c07bb30a3 100644
--- a/fs/ocfs2/dlmglue.h
+++ b/fs/ocfs2/dlmglue.h
@@ -182,10 +182,10 @@ void ocfs2_set_locking_protocol(void);
  * Keep a list of processes who have interest in a lockres.
  * Note: this is now only uesed for check recursive cluster lock.
  */
-inline void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
+void ocfs2_add_holder(struct ocfs2_lock_res *lockres,
 			     struct ocfs2_holder *oh);
-inline void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
+void ocfs2_remove_holder(struct ocfs2_lock_res *lockres,
 			     struct ocfs2_holder *oh);
-inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
+struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
 
 #endif	/* DLMGLUE_H */
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
