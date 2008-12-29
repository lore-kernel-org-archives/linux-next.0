From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 30 Dec 2008 01:22:31 +1100
Message-ID: <20081230012231.fcd112cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42964 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750818AbYL2OWe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 09:22:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
init/main.c between commit 0b8f1efad30bd58f89961b82dfe68b9edf8fd2ac
("sparse irq_desc[] array: core kernel and x86 changes") from the
sparseirq tree and commit 25bf48b74b9fb23b347d00656b604f9e55c72183 ("Fix
powerpc (tested on ppc64) command line handling") from the boot-params
tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc init/main.c
index 396b271,ad933ad..0000000
--- a/init/main.c
+++ b/init/main.c
@@@ -543,20 -522,30 +526,40 @@@ void __init __weak thread_info_cache_in
  {
  }
  
 +int __init __weak arch_early_irq_init(void)
 +{
 +	return 0;
 +}
 +
 +int __init __weak early_irq_init(void)
 +{
 +	return arch_early_irq_init();
 +}
 +
+ /* Non-destructive early parse of commandline.  PowerPC calls this early. */
+ void __init parse_early_and_core_params(char *cmdline)
+ {
+ 	static bool __initdata done = false;
+ 
+ 	if (done)
+ 		return;
+ 
+ 	parse_args("Core and early params", cmdline,
+ 		   __start___core_param,
+ 		   __stop___core_param - __start___core_param,
+ 		   do_early_param, true);
+ 	done = true;
+ }
+ 
  asmlinkage void __init start_kernel(void)
  {
- 	char * command_line;
- 	extern struct kernel_param __start___param[], __stop___param[];
+ 	char *static_command_line;
+ 
+ 	printk(KERN_NOTICE);
+ 	printk(linux_banner);
+ 
+ 	arch_get_boot_command_line();
+ 	parse_early_and_core_params(boot_command_line);
  
  	smp_setup_processor_id();
  
