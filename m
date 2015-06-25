From: Dan Streetman <ddstreet@ieee.org>
Subject: [PATCH] modules: elide param_lock if !CONFIG_SYSFS
Date: Thu, 25 Jun 2015 09:04:08 -0400
Message-ID: <1435237448-13684-1-git-send-email-ddstreet@ieee.org>
References: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35673 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbbFYNEd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 09:04:33 -0400
In-Reply-To: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Streetman <ddstreet@ieee.org>

Only include the built-in and per-module param_lock, and corresponding
lock/unlock functions, if sysfs is enabled.  If there is no sysfs there
is no need for locking kernel params.

This fixes a build break when CONFIG_SYSFS is not enabled, introduced
by commit b51d23e.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Dan Streetman <ddstreet@ieee.org>
---
 include/linux/module.h |  2 ++
 kernel/params.c        | 21 ++++++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 6ba0e87..46efa1c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -240,7 +240,9 @@ struct module {
 	unsigned int num_syms;
 
 	/* Kernel parameters. */
+#ifdef CONFIG_SYSFS
 	struct mutex param_lock;
+#endif
 	struct kernel_param *kp;
 	unsigned int num_kp;
 
diff --git a/kernel/params.c b/kernel/params.c
index 9c955cd..d2c6a2a 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/ctype.h>
 
+#ifdef CONFIG_SYSFS
 /* Protects all built-in parameters, modules use their own param_lock */
 static DEFINE_MUTEX(param_lock);
 
@@ -38,6 +39,17 @@ static inline struct mutex *__param_lock(struct module *mod)
 #endif
 }
 
+static inline void __check_param_lock(struct module *mod)
+{
+	BUG_ON(!mutex_is_locked(__param_lock(mod)));
+}
+#else /* !CONFIG_SYSFS */
+/* we don't need any param lock if there's no sysfs */
+static inline void __check_param_lock(struct module *mod)
+{
+}
+#endif
+
 /* This just allows us to keep track of which parameters are kmalloced. */
 struct kmalloced_param {
 	struct list_head list;
@@ -465,7 +477,7 @@ static int param_array(struct module *mod,
 		/* nul-terminate and parse */
 		save = val[len];
 		((char *)val)[len] = '\0';
-		BUG_ON(!mutex_is_locked(__param_lock(mod)));
+		__check_param_lock(mod);
 		ret = set(val, &kp);
 
 		if (ret != 0)
@@ -502,7 +514,7 @@ static int param_array_get(char *buffer, const struct kernel_param *kp)
 		if (i)
 			buffer[off++] = ',';
 		p.arg = arr->elem + arr->elemsize * i;
-		BUG_ON(!mutex_is_locked(__param_lock(p.mod)));
+		__check_param_lock(p.mod);
 		ret = arr->ops->get(buffer + off, &p);
 		if (ret < 0)
 			return ret;
@@ -622,18 +634,17 @@ static ssize_t param_attr_store(struct module_attribute *mattr,
 #define __modinit __init
 #endif
 
+#ifdef CONFIG_SYSFS
 void kernel_param_lock(struct module *mod)
 {
 	mutex_lock(__param_lock(mod));
 }
+EXPORT_SYMBOL(kernel_param_lock);
 
 void kernel_param_unlock(struct module *mod)
 {
 	mutex_unlock(__param_lock(mod));
 }
-
-#ifdef CONFIG_SYSFS
-EXPORT_SYMBOL(kernel_param_lock);
 EXPORT_SYMBOL(kernel_param_unlock);
 
 /*
-- 
2.1.0
