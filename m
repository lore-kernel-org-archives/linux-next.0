From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: creds tree build failure
Date: Fri, 8 Aug 2008 16:36:33 +1000
Message-ID: <20080808163633.d9e10b46.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48867 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752893AbYHHGgi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 02:36:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org

Hi David,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/spufs/inode.c: In function 'spufs_context_open':
arch/powerpc/platforms/cell/spufs/inode.c:326: error: too few arguments to function 'dentry_open'
arch/powerpc/platforms/cell/spufs/inode.c: In function 'spufs_gang_open':
arch/powerpc/platforms/cell/spufs/inode.c:563: error: too few arguments to function 'dentry_open'
kernel/cred.c:71: warning: 'struct thread_group_cred' declared inside parameter list
kernel/cred.c:71: warning: its scope is only this definition or declaration, which is probably not what you want
kernel/cred.c: In function 'put_cred_rcu':
kernel/cred.c:93: error: 'struct cred' has no member named 'tgcred'
kernel/cred.c: In function 'copy_creds':
kernel/cred.c:291: error: 'const struct cred' has no member named 'thread_keyring'
kernel/cred.c:286: warning: unused variable 'tgcred'

I applied the following (almost certainly wrong) patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From e963c9f33fae20e19f5b97bf512c41b07199def4 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Aug 2008 16:26:19 +1000
Subject: [PATCH] creds: build fixes 1

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/cell/spufs/inode.c |    5 +++--
 kernel/cred.c                             |   12 ++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 60bd5ed..80f4506 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -34,6 +34,7 @@
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/parser.h>
+#include <linux/cred.h>
 
 #include <asm/prom.h>
 #include <asm/spu.h>
@@ -323,7 +324,7 @@ static int spufs_context_open(struct dentry *dentry, struct vfsmount *mnt)
 		goto out;
 	}
 
-	filp = dentry_open(dentry, mnt, O_RDONLY);
+	filp = dentry_open(dentry, mnt, O_RDONLY, current_cred());
 	if (IS_ERR(filp)) {
 		put_unused_fd(ret);
 		ret = PTR_ERR(filp);
@@ -560,7 +561,7 @@ static int spufs_gang_open(struct dentry *dentry, struct vfsmount *mnt)
 		goto out;
 	}
 
-	filp = dentry_open(dentry, mnt, O_RDONLY);
+	filp = dentry_open(dentry, mnt, O_RDONLY, current_cred());
 	if (IS_ERR(filp)) {
 		put_unused_fd(ret);
 		ret = PTR_ERR(filp);
diff --git a/kernel/cred.c b/kernel/cred.c
index 6e9cfbf..f89c5e5 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -65,16 +65,18 @@ static void put_tgcred_rcu(struct rcu_head *rcu)
 }
 #endif
 
+#ifdef CONFIG_KEYS
 /*
  * Release a set of thread group credentials.
  */
 void put_tgcred(struct thread_group_cred *tgcred)
 {
-#ifdef CONFIG_KEYS
 	if (atomic_dec_and_test(&tgcred->usage))
 		call_rcu(&tgcred->rcu, put_tgcred_rcu);
-#endif
 }
+#else
+#define put_tgcred(t)
+#endif
 
 /*
  * The RCU callback to actually dispose of a set of credentials
@@ -283,12 +285,18 @@ error:
  */
 int copy_creds(struct task_struct *p, unsigned long clone_flags)
 {
+#ifdef CONFIG_KEYS
 	struct thread_group_cred *tgcred;
+#endif
 	struct cred *new;
 
 	mutex_init(&p->cred_exec_mutex);
 
+#ifdef CONFIG_KEYS
 	if (!p->cred->thread_keyring && clone_flags & CLONE_THREAD) {
+#else
+	if (clone_flags & CLONE_THREAD) {
+#endif
 		p->real_cred = get_cred(p->cred);
 		get_cred(p->cred);
 		return 0;
-- 
1.5.6.3
