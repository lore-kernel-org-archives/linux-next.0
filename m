From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] module: fix build for CONFIG_SYSFS=n
Date: Wed, 18 Feb 2009 10:02:29 -0800
Message-ID: <499C4D35.9000104@oracle.com>
References: <20090218191640.0b023029.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:26099 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753456AbZBRSB7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Feb 2009 13:01:59 -0500
In-Reply-To: <20090218191640.0b023029.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix this build error when CONFIG_SYSFS=n:

kernel/built-in.o: In function `free_module':
module.c:(.text+0x4f8a2): undefined reference to `destroy_params'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Rusty Russell <rusty@rustcorp.com.au>
---
 kernel/module.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20090218.orig/kernel/module.c
+++ linux-next-20090218/kernel/module.c
@@ -1464,8 +1464,10 @@ static void free_module(struct module *m
 	/* Module unload stuff */
 	module_unload_free(mod);
 
+#ifdef CONFIG_SYSFS
 	/* Free any allocated parameters. */
 	destroy_params(mod->kp, mod->num_kp);
+#endif
 
 	/* release any pointers to mcount in this module */
 	ftrace_release(mod->module_core, mod->core_size);
