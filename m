From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 30 Dec 2008 01:01:15 +1100
Message-ID: <20081230010115.754e9d01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59102 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752910AbYL2OBX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 09:01:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Alok Kataria <akataria@vmware.com>, Dan Hecht <dhecht@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, Yinghai Lu <yinghai.lu@kernel.org>

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
arch/x86/kernel/cpu/common.c between commit
88b094fb8d4fe43b7025ea8d487059e8813e02cd ("x86: Hypervisor detection and
get tsc_freq from hypervisor") from Linus' tree and commit
568991994fb3aad34504e9bdac458a2bfd388c7f ("x86: clean up
setup_clear/force_cpu_cap handling") from the boot-params tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix for now.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/common.c
index 42e0853,63531c9..0000000
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@@ -704,7 -716,9 +717,11 @@@ static void __cpuinit identify_cpu(stru
  	detect_ht(c);
  #endif
  
 +	init_hypervisor(c);
++
+ 	/* Command-line override before we AND into smp all cpus cap. */
+ 	override_capabilities(c->x86_capability);
+ 
  	/*
  	 * On SMP, boot_cpu_data holds the common feature set between
  	 * all CPUs; so make sure that we indicate which features are
