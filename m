From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cgroup tree with the tip tree
Date: Mon, 21 Dec 2015 15:41:19 +1100
Message-ID: <20151221154119.66094285@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

Today's linux-next merge of the cgroup tree got a conflict in:

  init/Kconfig

between commits:

  257372262056 ("x86/intel_rdt: Add support for Cache Allocation detection")
  5ad9144cdb9a ("x86,cgroup/intel_rdt : Add a cgroup interface to manage Intel cache allocation")

from the tip tree and commit:

  6bf024e69333 ("cgroup: put controller Kconfig options in meaningful order")

from the cgroup tree.

I fixed it up (see below - I wasn't sure where to put the new INTEL_RDT
config option) and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc init/Kconfig
index 4139128e3cab,f8754f502c36..000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -935,77 -940,6 +935,18 @@@ menuconfig CGROUP
  
  if CGROUPS
  
 +config INTEL_RDT
 +	bool "Intel Resource Director Technology support"
 +	depends on X86_64 && CPU_SUP_INTEL
 +	help
 +	  This option provides support for Cache allocation which is a
 +	  sub-feature of Intel Resource Director  Technology(RDT).
 +	  Current implementation supports L3 cache allocation.
 +	  Using this feature a user can specify the amount of L3 cache space
 +	  into which an application can fill.
 +
 +	  Say N if unsure.
 +
- config CGROUP_DEBUG
- 	bool "Example debug cgroup subsystem"
- 	default n
- 	help
- 	  This option enables a simple cgroup subsystem that
- 	  exports useful debugging information about the cgroups
- 	  framework.
- 
- 	  Say N if unsure.
- 
- config CGROUP_FREEZER
- 	bool "Freezer cgroup subsystem"
- 	help
- 	  Provides a way to freeze and unfreeze all tasks in a
- 	  cgroup.
- 
- config CGROUP_PIDS
- 	bool "PIDs cgroup subsystem"
- 	help
- 	  Provides enforcement of process number limits in the scope of a
- 	  cgroup. Any attempt to fork more processes than is allowed in the
- 	  cgroup will fail. PIDs are fundamentally a global resource because it
- 	  is fairly trivial to reach PID exhaustion before you reach even a
- 	  conservative kmemcg limit. As a result, it is possible to grind a
- 	  system to halt without being limited by other cgroup policies. The
- 	  PIDs cgroup subsystem is designed to stop this from happening.
- 
- 	  It should be noted that organisational operations (such as attaching
- 	  to a cgroup hierarchy will *not* be blocked by the PIDs subsystem),
- 	  since the PIDs limit only affects a process's ability to fork, not to
- 	  attach to a cgroup.
- 
- config CGROUP_DEVICE
- 	bool "Device controller for cgroups"
- 	help
- 	  Provides a cgroup implementing whitelists for devices which
- 	  a process in the cgroup can mknod or open.
- 
- config CPUSETS
- 	bool "Cpuset support"
- 	help
- 	  This option will let you create and manage CPUSETs which
- 	  allow dynamically partitioning a system into sets of CPUs and
- 	  Memory Nodes and assigning tasks to run only within those sets.
- 	  This is primarily useful on large SMP or NUMA systems.
- 
- 	  Say N if unsure.
- 
- config PROC_PID_CPUSET
- 	bool "Include legacy /proc/<pid>/cpuset file"
- 	depends on CPUSETS
- 	default y
- 
- config CGROUP_CPUACCT
- 	bool "Simple CPU accounting cgroup subsystem"
- 	help
- 	  Provides a simple Resource Controller for monitoring the
- 	  total CPU consumed by the tasks in a cgroup.
- 
  config PAGE_COUNTER
         bool
  
