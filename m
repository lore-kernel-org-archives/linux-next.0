From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the cgroup tree
Date: Mon, 21 Dec 2015 18:13:26 +1100
Message-ID: <20151221181326.069e7a42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35920 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750794AbbLUHN3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Dec 2015 02:13:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  init/Kconfig

between commit:

  6bf024e69333 ("cgroup: put controller Kconfig options in meaningful order")

from the cgroup tree and commit:

  "mm: memcontrol: introduce CONFIG_MEMCG_LEGACY_KMEM"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc init/Kconfig
index faa4d087d69e,8185e8de04a1..000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -1010,43 -1072,39 +1013,48 @@@ config MEMCG_KME
  	  the kmem extension can use it to guarantee that no group of processes
  	  will ever exhaust kernel resources alone.
  
+ 	  This option affects the ORIGINAL cgroup interface. The cgroup2 memory
+ 	  controller includes important in-kernel memory consumers per default.
+ 
+ 	  If you're using cgroup2, say N.
+ 
 -config CGROUP_HUGETLB
 -	bool "HugeTLB Resource Controller for Control Groups"
 -	depends on HUGETLB_PAGE
 -	select PAGE_COUNTER
 +config BLK_CGROUP
 +	bool "IO controller"
 +	depends on BLOCK
  	default n
 -	help
 -	  Provides a cgroup Resource Controller for HugeTLB pages.
 -	  When you enable this, you can put a per cgroup limit on HugeTLB usage.
 -	  The limit is enforced during page fault. Since HugeTLB doesn't
 -	  support page reclaim, enforcing the limit at page fault time implies
 -	  that, the application will get SIGBUS signal if it tries to access
 -	  HugeTLB pages beyond its limit. This requires the application to know
 -	  beforehand how much HugeTLB pages it would require for its use. The
 -	  control group is tracked in the third page lru pointer. This means
 -	  that we cannot use the controller with huge page less than 3 pages.
 +	---help---
 +	Generic block IO controller cgroup interface. This is the common
 +	cgroup interface which should be used by various IO controlling
 +	policies.
  
 -config CGROUP_PERF
 -	bool "Enable perf_event per-cpu per-container group (cgroup) monitoring"
 -	depends on PERF_EVENTS && CGROUPS
 -	help
 -	  This option extends the per-cpu mode to restrict monitoring to
 -	  threads which belong to the cgroup specified and run on the
 -	  designated cpu.
 +	Currently, CFQ IO scheduler uses it to recognize task groups and
 +	control disk bandwidth allocation (proportional time slice allocation)
 +	to such task groups. It is also used by bio throttling logic in
 +	block layer to implement upper limit in IO rates on a device.
  
 -	  Say N if unsure.
 +	This option only enables generic Block IO controller infrastructure.
 +	One needs to also enable actual IO controlling logic/policy. For
 +	enabling proportional weight division of disk bandwidth in CFQ, set
 +	CONFIG_CFQ_GROUP_IOSCHED=y; for enabling throttling policy, set
 +	CONFIG_BLK_DEV_THROTTLING=y.
 +
 +	See Documentation/cgroups/blkio-controller.txt for more information.
 +
 +config DEBUG_BLK_CGROUP
 +	bool "IO controller debugging"
 +	depends on BLK_CGROUP
 +	default n
 +	---help---
 +	Enable some debugging help. Currently it exports additional stat
 +	files in a cgroup which can be useful for debugging.
 +
 +config CGROUP_WRITEBACK
 +	bool
 +	depends on MEMCG && BLK_CGROUP
 +	default y
  
  menuconfig CGROUP_SCHED
 -	bool "Group CPU scheduler"
 +	bool "CPU controller"
  	default n
  	help
  	  This feature lets CPU scheduler recognize task groups and control CPU
t
