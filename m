From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] modules: elide param_lock if !CONFIG_SYSFS
Date: Fri, 26 Jun 2015 06:48:37 +0930
Message-ID: <87616bsd02.fsf@rustcorp.com.au>
References: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com> <1435237448-13684-1-git-send-email-ddstreet@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57029 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750993AbbFYVTb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2015 17:19:31 -0400
In-Reply-To: <1435237448-13684-1-git-send-email-ddstreet@ieee.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Streetman <ddstreet@ieee.org>

Dan Streetman <ddstreet@ieee.org> writes:
> Only include the built-in and per-module param_lock, and corresponding
> lock/unlock functions, if sysfs is enabled.  If there is no sysfs there
> is no need for locking kernel params.
>
> This fixes a build break when CONFIG_SYSFS is not enabled, introduced
> by commit b51d23e.

This doesn't even come close to applying to my tree?

I've fixed it like so, and tested it compiles both with and without
SYSFS.

Subject: param: fix module param locks when !CONFIG_SYSFS.

As Dan Streetman points out, the entire point of locking for is to
stop sysfs accesses, so they're elided entirely in the !SYSFS case.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/include/linux/module.h b/include/linux/module.h
index abaecf1a63df..237bce382e32 100644
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
 
diff --git a/kernel/module.c b/kernel/module.c
index 1dcf09f214fa..c19b2c50b317 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1820,6 +1820,10 @@ static void mod_sysfs_fini(struct module *mod)
 	mod_kobject_put(mod);
 }
 
+static void init_param_lock(struct module *mod)
+{
+	mutex_init(&mod->param_lock);
+}
 #else /* !CONFIG_SYSFS */
 
 static int mod_sysfs_setup(struct module *mod,
@@ -1842,6 +1846,9 @@ static void del_usage_links(struct module *mod)
 {
 }
 
+static void init_param_lock(struct module *mod)
+{
+}
 #endif /* CONFIG_SYSFS */
 
 static void mod_sysfs_teardown(struct module *mod)
@@ -3442,7 +3449,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	if (err)
 		goto unlink_mod;
 
-	mutex_init(&mod->param_lock);
+	init_param_lock(mod);
 
 	/* Now we've got everything in the final locations, we can
 	 * find optional sections. */
diff --git a/kernel/params.c b/kernel/params.c
index 8890d0b8dffc..faa461c16f12 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -25,12 +25,22 @@
 #include <linux/slab.h>
 #include <linux/ctype.h>
 
+#ifdef CONFIG_SYSFS
 /* Protects all built-in parameters, modules use their own param_lock */
 static DEFINE_MUTEX(param_lock);
 
 /* Use the module's mutex, or if built-in use the built-in mutex */
 #define KPARAM_MUTEX(mod)	((mod) ? &(mod)->param_lock : &param_lock)
-#define KPARAM_IS_LOCKED(mod)	mutex_is_locked(KPARAM_MUTEX(mod))
+
+static inline void check_kparam_locked(struct module *mod)
+{
+	BUG_ON(!mutex_is_locked(KPARAM_MUTEX(mod)));
+}
+#else
+static inline void check_kparam_locked(struct module *mod)
+{
+}
+#endif /* !CONFIG_SYSFS */
 
 /* This just allows us to keep track of which parameters are kmalloced. */
 struct kmalloced_param {
@@ -459,7 +469,7 @@ static int param_array(struct module *mod,
 		/* nul-terminate and parse */
 		save = val[len];
 		((char *)val)[len] = '\0';
-		BUG_ON(!KPARAM_IS_LOCKED(mod));
+		check_kparam_locked(mod);
 		ret = set(val, &kp);
 
 		if (ret != 0)
@@ -496,7 +506,7 @@ static int param_array_get(char *buffer, const struct kernel_param *kp)
 		if (i)
 			buffer[off++] = ',';
 		p.arg = arr->elem + arr->elemsize * i;
-		BUG_ON(!KPARAM_IS_LOCKED(p.mod));
+		check_kparam_locked(p.mod);
 		ret = arr->ops->get(buffer + off, &p);
 		if (ret < 0)
 			return ret;
@@ -616,6 +626,7 @@ static ssize_t param_attr_store(struct module_attribute *mattr,
 #define __modinit __init
 #endif
 
+#ifdef CONFIG_SYSFS
 void kernel_param_lock(struct module *mod)
 {
 	mutex_lock(KPARAM_MUTEX(mod));
@@ -626,7 +637,6 @@ void kernel_param_unlock(struct module *mod)
 	mutex_unlock(KPARAM_MUTEX(mod));
 }
 
-#ifdef CONFIG_SYSFS
 EXPORT_SYMBOL(kernel_param_lock);
 EXPORT_SYMBOL(kernel_param_unlock);
 
