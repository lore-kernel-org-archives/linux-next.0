From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] modules: Fix up build when CONFIG_MODULE_UNLOAD=n.
Date: Fri, 10 Apr 2009 00:49:44 +0900
Message-ID: <20090409154944.GC7789@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:60947 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935861AbZDIPyc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 11:54:32 -0400
Received: from localhost (unknown [127.0.0.1])
	by master.linux-sh.org (Postfix) with ESMTP id 04E5F63754
	for <linux-next@vger.kernel.org>; Thu,  9 Apr 2009 15:49:45 +0000 (UTC)
Received: from master.linux-sh.org ([127.0.0.1])
	by localhost (master.linux-sh.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ekSuafXr+zv for <linux-next@vger.kernel.org>;
	Fri, 10 Apr 2009 00:49:44 +0900 (JST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Commit 3d43321b7015387cfebbe26436d0e9d299162ea1 ("modules: sysctl to
block module loading") introduces a modules_disabled variable that is
only defined if CONFIG_MODULE_UNLOAD is enabled, despite being used in
other places. This moves it up and fixes up the build.

  CC      kernel/module.o
kernel/module.c: In function 'sys_init_module':
kernel/module.c:2401: error: 'modules_disabled' undeclared (first use in this function)
kernel/module.c:2401: error: (Each undeclared identifier is reported only once
kernel/module.c:2401: error: for each function it appears in.)
make[1]: *** [kernel/module.o] Error 1
make: *** [kernel/module.o] Error 2

Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 kernel/module.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 274ab43..5fb0ece 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -73,6 +73,9 @@ DEFINE_MUTEX(module_mutex);
 EXPORT_SYMBOL_GPL(module_mutex);
 static LIST_HEAD(modules);
 
+/* Block module loading/unloading? */
+int modules_disabled = 0;
+
 /* Waiting for a module to finish initializing? */
 static DECLARE_WAIT_QUEUE_HEAD(module_wq);
 
@@ -782,9 +785,6 @@ static void wait_for_zero_refcount(struct module *mod)
 	mutex_lock(&module_mutex);
 }
 
-/* Block module loading/unloading? */
-int modules_disabled = 0;
-
 SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
 		unsigned int, flags)
 {
