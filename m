From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH -next v2] cred: conditionally declare groups-related functions
Date: Mon, 25 Jun 2018 08:55:32 +0200
Message-ID: <20180625065532.7268-1-omosnace@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-audit@redhat.com, Ondrej Mosnacek <omosnace@redhat.com>
List-Id: linux-next.vger.kernel.org

The groups-related functions declared in include/linux/cred.h are
defined in kernel/groups.c, which is compiled only when
CONFIG_MULTIUSER=y. Move all these function declarations under #ifdef
CONFIG_MULTIUSER to help avoid accidental usage in contexts where
CONFIG_MULTIUSER might be disabled.

This patch also adds a fallback for groups_search(). Currently this
function is only called from kernel/groups.c itself and
keys/permissions.c, which depends on CONFIG_MULTIUSER. However, the
audit subsystem (which does not depend on CONFIG_MULTIUSER) calls this
function in -next, so the fallback will be needed to avoid compilation
errors or ugly workarounds.

See also:
https://lkml.org/lkml/2018/6/20/670
https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git/commit/?h=next&id=af85d1772e31fed34165a1b3decef340cf4080c0

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 include/linux/cred.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 631286535d0f..7eed6101c791 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -65,6 +65,12 @@ extern void groups_free(struct group_info *);
 
 extern int in_group_p(kgid_t);
 extern int in_egroup_p(kgid_t);
+extern int groups_search(const struct group_info *, kgid_t);
+
+extern int set_current_groups(struct group_info *);
+extern void set_groups(struct cred *, struct group_info *);
+extern bool may_setgroups(void);
+extern void groups_sort(struct group_info *);
 #else
 static inline void groups_free(struct group_info *group_info)
 {
@@ -78,12 +84,11 @@ static inline int in_egroup_p(kgid_t grp)
 {
         return 1;
 }
+static inline int groups_search(const struct group_info *group_info, kgid_t grp)
+{
+	return 1;
+}
 #endif
-extern int set_current_groups(struct group_info *);
-extern void set_groups(struct cred *, struct group_info *);
-extern int groups_search(const struct group_info *, kgid_t);
-extern bool may_setgroups(void);
-extern void groups_sort(struct group_info *);
 
 /*
  * The security context of a task
-- 
2.17.1
