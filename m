From: David Howells <dhowells@redhat.com>
Subject: [PATCH] CRED: Fix IA64 COW credentials handling
Date: Tue, 12 Aug 2008 10:24:54 +0100
Message-ID: <20080812092454.20969.30774.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:41066 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750808AbYHLJZJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 05:25:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, jmorris@namei.org
Cc: tony.luck@intel.com, linux-next@vger.kernel.org, dhowells@redhat.com, linux-security-module@vger.kernel.org

Fix the IA64 arch's use of COW credentials.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 arch/ia64/ia32/sys_ia32.c     |    7 +++----
 arch/ia64/kernel/perfmon.c    |   32 ++++++++++++++++++++------------
 include/sound/ad1848.h        |    0 
 sound/isa/ad1848/ad1848_lib.c |    0 
 4 files changed, 23 insertions(+), 16 deletions(-)
 delete mode 100644 include/sound/ad1848.h
 delete mode 100644 sound/isa/ad1848/ad1848_lib.c

diff --git a/arch/ia64/ia32/sys_ia32.c b/arch/ia64/ia32/sys_ia32.c
index 465116a..7f0704f 100644
--- a/arch/ia64/ia32/sys_ia32.c
+++ b/arch/ia64/ia32/sys_ia32.c
@@ -2084,25 +2084,24 @@ groups16_from_user(struct group_info *group_info, short __user *grouplist)
 asmlinkage long
 sys32_getgroups16 (int gidsetsize, short __user *grouplist)
 {
+	const struct cred *cred = current_cred();
 	int i;
 
 	if (gidsetsize < 0)
 		return -EINVAL;
 
-	get_group_info(current->group_info);
-	i = current->group_info->ngroups;
+	i = cred->group_info->ngroups;
 	if (gidsetsize) {
 		if (i > gidsetsize) {
 			i = -EINVAL;
 			goto out;
 		}
-		if (groups16_to_user(grouplist, current->group_info)) {
+		if (groups16_to_user(grouplist, cred->group_info)) {
 			i = -EFAULT;
 			goto out;
 		}
 	}
 out:
-	put_group_info(current->group_info);
 	return i;
 }
 
diff --git a/arch/ia64/kernel/perfmon.c b/arch/ia64/kernel/perfmon.c
index ffe6de0..a1aead7 100644
--- a/arch/ia64/kernel/perfmon.c
+++ b/arch/ia64/kernel/perfmon.c
@@ -2403,25 +2403,33 @@ error_kmem:
 static int
 pfm_bad_permissions(struct task_struct *task)
 {
+	const struct cred *tcred;
 	uid_t uid = current_uid();
 	gid_t gid = current_gid();
+	int ret;
+
+	rcu_read_lock();
+	tcred = __task_cred(task);
 
 	/* inspired by ptrace_attach() */
 	DPRINT(("cur: uid=%d gid=%d task: euid=%d suid=%d uid=%d egid=%d sgid=%d\n",
 		uid,
 		gid,
-		task->euid,
-		task->suid,
-		task->uid,
-		task->egid,
-		task->sgid));
-
-	return (uid != task->euid)
-	    || (uid != task->suid)
-	    || (uid != task->uid)
-	    || (gid != task->egid)
-	    || (gid != task->sgid)
-	    || (gid != task->gid)) && !capable(CAP_SYS_PTRACE);
+		tcred->euid,
+		tcred->suid,
+		tcred->uid,
+		tcred->egid,
+		tcred->sgid));
+
+	ret = ((uid != tcred->euid)
+	       || (uid != tcred->suid)
+	       || (uid != tcred->uid)
+	       || (gid != tcred->egid)
+	       || (gid != tcred->sgid)
+	       || (gid != tcred->gid)) && !capable(CAP_SYS_PTRACE);
+
+	rcu_read_unlock();
+	return ret;
 }
 
 static int
diff --git a/include/sound/ad1848.h b/include/sound/ad1848.h
deleted file mode 100644
index e69de29..0000000
diff --git a/sound/isa/ad1848/ad1848_lib.c b/sound/isa/ad1848/ad1848_lib.c
deleted file mode 100644
index e69de29..0000000
