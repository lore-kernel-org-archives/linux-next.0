From: Dan Streetman <ddstreet@ieee.org>
Subject: [PATCH] modules: only use mod->param_lock if CONFIG_MODULES
Date: Wed, 24 Jun 2015 14:31:17 -0400
Message-ID: <1435170677-16492-1-git-send-email-ddstreet@ieee.org>
References: <CALZtONAqdXeV0=Enjsw6YzuWFC-4ZqpeWfwxcEgBa+1CasqbGA@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:36587 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752536AbbFXSbe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2015 14:31:34 -0400
In-Reply-To: <CALZtONAqdXeV0=Enjsw6YzuWFC-4ZqpeWfwxcEgBa+1CasqbGA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Dan Streetman <ddstreet@ieee.org>

Simplify params.c by replacing KPARAM_MUTEX() with an inline function
__param_lock(), and replacing KPARAM_IS_LOCKED() with direct calls to
mutex_is_locked().  Inside __param_lock(), only (conditionally) return
mod->param_lock #ifdef CONFIG_MODULES; if there are no modules just
return the built-in param_lock.

Since "struct module" isn't defined if !CONFIG_MODULES, we must leave
out the code that returns mod->param_lock if there are no modules.

Signed-off-by: Dan Streetman <ddstreet@ieee.org>
---
 kernel/params.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 8890d0b..9c955cd 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -29,8 +29,14 @@
 static DEFINE_MUTEX(param_lock);
 
 /* Use the module's mutex, or if built-in use the built-in mutex */
-#define KPARAM_MUTEX(mod)	((mod) ? &(mod)->param_lock : &param_lock)
-#define KPARAM_IS_LOCKED(mod)	mutex_is_locked(KPARAM_MUTEX(mod))
+static inline struct mutex *__param_lock(struct module *mod)
+{
+#ifdef CONFIG_MODULES
+	return mod ? &mod->param_lock : &param_lock;
+#else
+	return &param_lock;
+#endif
+}
 
 /* This just allows us to keep track of which parameters are kmalloced. */
 struct kmalloced_param {
@@ -459,7 +465,7 @@ static int param_array(struct module *mod,
 		/* nul-terminate and parse */
 		save = val[len];
 		((char *)val)[len] = '\0';
-		BUG_ON(!KPARAM_IS_LOCKED(mod));
+		BUG_ON(!mutex_is_locked(__param_lock(mod)));
 		ret = set(val, &kp);
 
 		if (ret != 0)
@@ -496,7 +502,7 @@ static int param_array_get(char *buffer, const struct kernel_param *kp)
 		if (i)
 			buffer[off++] = ',';
 		p.arg = arr->elem + arr->elemsize * i;
-		BUG_ON(!KPARAM_IS_LOCKED(p.mod));
+		BUG_ON(!mutex_is_locked(__param_lock(p.mod)));
 		ret = arr->ops->get(buffer + off, &p);
 		if (ret < 0)
 			return ret;
@@ -618,12 +624,12 @@ static ssize_t param_attr_store(struct module_attribute *mattr,
 
 void kernel_param_lock(struct module *mod)
 {
-	mutex_lock(KPARAM_MUTEX(mod));
+	mutex_lock(__param_lock(mod));
 }
 
 void kernel_param_unlock(struct module *mod)
 {
-	mutex_unlock(KPARAM_MUTEX(mod));
+	mutex_unlock(__param_lock(mod));
 }
 
 #ifdef CONFIG_SYSFS
-- 
2.1.0
