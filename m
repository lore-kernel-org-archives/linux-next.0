From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 14:56:02 +1100
Message-ID: <20081023145602.105edce2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38651 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751781AbYJWFBv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 01:01:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/Kconfig between commit 363a5e3d7b4b69371f21bcafd7fc76e68c73733a
("x86: add MAXSMP") from cpus4096 tree and commit
7ff10dbd907d18bb26b1a8e8ac4ec32a72c0d0ee ("x86:enable-MAXSMP") from the
rr tree.

Overlapping changes. I have fixed it up (see below) and can carry the fix.

There is also a conflict in the same file between commit
01f569c81fc075f276ec2e7c0b7cb4c72ba74635 ("x86: restore 4096 limit for
NR_CPUS") from the cpus4096 tree and commit
d08dde18aebb15633e5c4480814b77d93a4d68f6
("cpumask:CONFIG_NR_CPUS-always") from the rr tree.

Overlapping changes.  I have fixed it up (see below) and can carry the fix.

Rusty, your versions of these patches also had some leading spaces ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/Kconfig
index fa5e00e,cf8b5d9..0000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -575,24 -572,20 +575,25 @@@ config IOMMU_HELPE
  
  config MAXSMP
  	bool "Configure Maximum number of SMP Processors and NUMA Nodes"
 - 	depends on X86_64 && SMP && DEBUG_KERNEL && EXPERIMENTAL
 +	depends on X86_64 && SMP && DEBUG_KERNEL && EXPERIMENTAL
+ 	select CPUMASK_OFFSTACK
 -	default n
  	help
 -	  Configure maximum number of CPUS and NUMA Nodes for this architecture.
 +	  Configure maximum number of CPUS and NUMA Nodes for this
 +	  architecture (up to 4096!).
 +
 +	  This can increase memory usage, bigger stack footprint and can
 +	  add some runtime overhead as well so unless you want a generic
 +	  distro kernel you likely want to say N.
 +
  	  If unsure, say N.
  
  config NR_CPUS
- 	int "Maximum number of CPUs (2-4096)" if !MAXSMP
- 	range 2 4096
- 	depends on SMP
 - 	int "Maximum number of CPUs" if SMP && !MAXSMP
 - 	range 2 512 if SMP && !MAXSMP
++	int "Maximum number of CPUs (2-4096)" if SMP && !MAXSMP
++	range 2 4096 if SMP && !MAXSMP
+ 	default "1" if !SMP
 - 	default "4096" if MAXSMP
 +	default "4096" if MAXSMP
- 	default "32" if X86_NUMAQ || X86_SUMMIT || X86_BIGSMP || X86_ES7000
- 	default "8"
+ 	default "32" if SMP && (X86_NUMAQ || X86_SUMMIT || X86_BIGSMP || X86_ES7000)
+ 	default "8" if SMP
  	help
  	  This allows you to specify the maximum number of CPUs which this
  	  kernel will support.  The maximum supported value is 512 and the
