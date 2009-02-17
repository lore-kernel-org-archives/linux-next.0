From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the ftrace tree
Date: Tue, 17 Feb 2009 16:12:45 +1100
Message-ID: <20090217161245.42fc6bfa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55193 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751098AbZBQFMw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 00:12:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in kernel/module.c
between commit 3861a17bcc0af815f684c6178bc9ec2d790c350e
("tracing/function-graph-tracer: drop the kernel_text_address check")
from the ftrace tree and commit 820936d2f463760545e8ef2ae2cd09d92605c69e
("module:module_address") from the rr tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/module.c
index a687023,b6864a9..0000000
--- a/kernel/module.c
+++ b/kernel/module.c
@@@ -2708,29 -2726,31 +2721,31 @@@ const struct exception_table_entry *sea
  }
  
  /*
-  * Is this a valid module address?
+  * is_module_address - is this address inside a module?
+  * @addr: the address to check.
+  *
+  * See is_module_text_address() if you simply want to see if the address
+  * is code (not data).
   */
- int is_module_address(unsigned long addr)
+ bool is_module_address(unsigned long addr)
  {
- 	struct module *mod;
+ 	bool ret;
  
  	preempt_disable();
- 
- 	list_for_each_entry_rcu(mod, &modules, list) {
- 		if (within_module_core(addr, mod)) {
- 			preempt_enable();
- 			return 1;
- 		}
- 	}
- 
+ 	ret = __module_address(addr) != NULL;
  	preempt_enable();
  
- 	return 0;
+ 	return ret;
  }
  
- 
- /* Is this a valid kernel address? */
- struct module *__module_text_address(unsigned long addr)
+ /*
+  * __module_address - get the module which contains an address.
+  * @addr: the address.
+  *
+  * Must be called with preempt disabled or module mutex held so that
+  * module doesn't get freed during this.
+  */
 -__notrace_funcgraph struct module *__module_address(unsigned long addr)
++struct module *__module_address(unsigned long addr)
  {
  	struct module *mod;
  
