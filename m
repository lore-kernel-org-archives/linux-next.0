From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cgroup tree with the tip tree
Date: Mon, 21 Dec 2015 15:41:21 +1100
Message-ID: <20151221154121.4bfb97b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54298 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750738AbbLUElX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Dec 2015 23:41:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Oleg Nesterov <oleg@redhat.com>

Hi Tejun,

Today's linux-next merge of the cgroup tree got a conflict in:

  include/linux/cgroup_subsys.h

between commit:

  5ad9144cdb9a ("x86,cgroup/intel_rdt : Add a cgroup interface to manage Intel cache allocation")

from the tip tree and commit:

  b53202e63089 ("cgroup: kill cgrp_ss_priv[CGROUP_CANFORK_COUNT] and friends")

from the cgroup tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/cgroup_subsys.h
index c559ef5cae23,0df0336acee9..000000000000
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@@ -58,15 -52,6 +52,10 @@@ SUBSYS(net_prio
  SUBSYS(hugetlb)
  #endif
  
 +#if IS_ENABLED(CONFIG_INTEL_RDT)
 +SUBSYS(intel_rdt)
 +#endif
 +
- /*
-  * Subsystems that implement the can_fork() family of callbacks.
-  */
- SUBSYS_TAG(CANFORK_START)
- 
  #if IS_ENABLED(CONFIG_CGROUP_PIDS)
  SUBSYS(pids)
  #endif
