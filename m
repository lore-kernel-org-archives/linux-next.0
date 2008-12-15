From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 16 Dec 2008 00:20:54 +1100
Message-ID: <20081216002054.62a446fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45733 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751358AbYLONU5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 08:20:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
init/main.c between commit 0b8f1efad30bd58f89961b82dfe68b9edf8fd2ac
("sparse irq_desc[] array: core kernel and x86 changes") from the
sparseirq tree and commit 0de5c2d9f02d2018fd671ca1015432dffa5eb338
("param: arch_get_boot_command_line()") from the boot-params tree.

Just overlapping additions. I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc init/main.c
index 1d3ccf8,e0d6592..0000000
--- a/init/main.c
+++ b/init/main.c
@@@ -543,19 -522,19 +526,28 @@@ void __init __weak thread_info_cache_in
  {
  }
  
 +void __init __weak arch_early_irq_init(void)
 +{
 +}
 +
 +void __init __weak early_irq_init(void)
 +{
 +	arch_early_irq_init();
 +}
 +
+ /* Ideally, this would take a 'const char *cmdline' param. */
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
+ 	parse_args("Core and early params", boot_command_line,
+ 		   __start___core_param,
+ 		   __stop___core_param - __start___core_param,
+ 		   do_early_param, true);
  
  	smp_setup_processor_id();
  
