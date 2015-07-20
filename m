From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 20 Jul 2015 13:54:39 +1000
Message-ID: <20150720135439.4b59fca2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42041 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754246AbbGTDyl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Jul 2015 23:54:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Mel Gorman <mgorman@suse.de>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/Kconfig

between commit:

  5aaeb5c01c5b ("x86/fpu, sched: Introduce CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT and use it on x86")

from Linus' tree and commit:

  caf50fadb4de ("mm: send one IPI per CPU to TLB flush all entries after unmapping pages")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/Kconfig
index 6c80c03d8e90,d9a83b54d86a..000000000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -41,7 -41,7 +41,8 @@@ config X8
  	select ARCH_USE_CMPXCHG_LOCKREF		if X86_64
  	select ARCH_USE_QUEUED_RWLOCKS
  	select ARCH_USE_QUEUED_SPINLOCKS
 +	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
+ 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP
  	select ARCH_WANT_FRAME_POINTERS
  	select ARCH_WANT_IPC_PARSE_VERSION	if X86_32
  	select ARCH_WANT_OPTIONAL_GPIOLIB
