From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH -next] ipmi: fix module param sparse warnings
Date: Fri, 25 Jun 2010 22:20:15 +0930
Message-ID: <201006252220.17228.rusty@rustcorp.com.au>
References: <20100624152122.bfc0472a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100624152122.bfc0472a.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Corey Minyard <minyard@acm.org>
List-Id: linux-next.vger.kernel.org

On Fri, 25 Jun 2010 07:51:22 am Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> The <arg> parameter in module_param_cb() should be a pointer,

Well, I don't think there's anything wrong with it being a function.

The actual problem is that it tries to figure out if the arg is a bool
or an int: if someone wants to work through the 700-odd cases of 
module_param*bool and convert those vars to actual bools, that'd allow
us to get rid of that logic.

Meanwhile, we can do this instead.  Does it solve it as well?

Subject: ipmi: fix module param sparse warnings
Date: Thu, 24 Jun 2010 15:21:22 -0700
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
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
---
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
 
