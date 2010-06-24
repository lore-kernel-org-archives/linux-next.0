From: Randy Dunlap <randy.dunlap@Oracle.com>
Subject: [PATCH -next] ipmi: fix module param sparse warnings
Date: Thu, 24 Jun 2010 15:21:22 -0700
Message-ID: <20100624152122.bfc0472a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:63268 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751048Ab0FXWW6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2010 18:22:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Corey Minyard <minyard@acm.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

The <arg> parameter in module_param_cb() should be a pointer,
i.e., like one of these:
	union {
		void *arg;
		const struct kparam_string *str;
		const struct kparam_array *arr;
	};

sparse complains:
drivers/char/ipmi/ipmi_watchdog.c:303:1: error: cannot dereference this type
drivers/char/ipmi/ipmi_watchdog.c:307:1: error: cannot dereference this type
drivers/char/ipmi/ipmi_watchdog.c:311:1: error: cannot dereference this type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Corey Minyard <minyard@acm.org>
---
Note: patch is against linux-next, since these lines have changed recently.

 drivers/char/ipmi/ipmi_watchdog.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20100528.orig/drivers/char/ipmi/ipmi_watchdog.c
+++ linux-next-20100528/drivers/char/ipmi/ipmi_watchdog.c
@@ -300,15 +300,15 @@ MODULE_PARM_DESC(timeout, "Timeout value
 module_param(pretimeout, timeout, 0644);
 MODULE_PARM_DESC(pretimeout, "Pretimeout value in seconds.");
 
-module_param_cb(action, &param_ops_str, action_op, 0644);
+module_param_cb(action, &param_ops_str, &action_op, 0644);
 MODULE_PARM_DESC(action, "Timeout action. One of: "
 		 "reset, none, power_cycle, power_off.");
 
-module_param_cb(preaction, &param_ops_str, preaction_op, 0644);
+module_param_cb(preaction, &param_ops_str, &preaction_op, 0644);
 MODULE_PARM_DESC(preaction, "Pretimeout action.  One of: "
 		 "pre_none, pre_smi, pre_nmi, pre_int.");
 
-module_param_cb(preop, &param_ops_str, preop_op, 0644);
+module_param_cb(preop, &param_ops_str, &preop_op, 0644);
 MODULE_PARM_DESC(preop, "Pretimeout driver operation.  One of: "
 		 "preop_none, preop_panic, preop_give_data.");
 
