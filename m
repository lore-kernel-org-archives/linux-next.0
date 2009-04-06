From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] module.c: fix build breakage when !MODULE_UNLOAD
Date: Mon, 6 Apr 2009 17:14:44 +0400
Message-ID: <20090406131444.GA3928@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.179]:34700 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754995AbZDFNPA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 09:15:00 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kees.cook@canonical.com, serue@us.ibm.com, jmorris@namei.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this build error when CONFIG_MODULE_UNLOAD is not set:
kernel/module.c: In function 'sys_init_module':
kernel/module.c:2401: error: 'modules_disabled' undeclared

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 kernel/module.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
