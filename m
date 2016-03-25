From: Huang Rui <ray.huang@amd.com>
Subject: [REDO PATCH] x86/perf: Move events_sysfs_show() outside CPU_SUP_INTEL
Date: Fri, 25 Mar 2016 11:18:25 +0800
Message-ID: <1458875905-4278-1-git-send-email-ray.huang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, acme@kernel.org, Borislav Petkov <bp@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, spg_linux_kernel@amd.com, x86@kernel.org, kbuild-all@01.org, Borislav Petkov <bp@alien8.de>, Sherry Hurwitz <sherry.hurwitz@amd.com>, Fengguang Wu <fengguang.wu@intel.com>, Huang Rui <ray.huang@amd.com>
List-Id: linux-next.vger.kernel.org

This patch moves events_sysfs_show outside CONFIG_CPU_SUP_INTEL, because
this interface will be also used in an AMD power reporting PMU driver.

Otherwise, below build error would be encountered:

All error/warnings (new ones prefixed by >>):

     In file included from include/linux/kobject.h:21:0,
                      from include/linux/module.h:17,
                      from arch/x86/kernel/cpu/perf_event_amd_power.c:13:
  >> arch/x86/kernel/cpu/perf_event.h:663:31: error: 'events_sysfs_show' undeclared here (not in a function)
       .attr  = __ATTR(_name, 0444, events_sysfs_show, NULL), \
                                    ^
     include/linux/sysfs.h:103:10: note: in definition of macro '__ATTR'
       .show = _show,      \
               ^
  >> arch/x86/kernel/cpu/perf_event_amd_power.c:244:1: note: in expansion of macro 'EVENT_ATTR_STR'
      EVENT_ATTR_STR(power-pkg, power_pkg, "event=0x01");
      ^

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: build test robot <lkp@intel.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: acme@kernel.org
---

Hi Peter, Ingo, Randy,

According to the comments of below thread, I rebased this fix to
latest kernel.

http://lkml.kernel.org/r/56F41E3F.8000407@infradead.org

Orignal patch:
https://git.kernel.org/cgit/linux/kernel/git/bp/bp.git/commit/?h=tip-perf&id=f5ba42d22cb478d32363b2b8e92e14b1fd190ce1

Thanks,
Rui

---
 arch/x86/events/perf_event.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index ba6ef18..a6771e2 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -795,6 +795,9 @@ ssize_t intel_event_sysfs_show(char *page, u64 config);
 
 struct attribute **merge_attr(struct attribute **a, struct attribute **b);
 
+ssize_t events_sysfs_show(struct device *dev, struct device_attribute *attr,
+			  char *page);
+
 #ifdef CONFIG_CPU_SUP_AMD
 
 int amd_pmu_init(void);
@@ -925,9 +928,6 @@ int p6_pmu_init(void);
 
 int knc_pmu_init(void);
 
-ssize_t events_sysfs_show(struct device *dev, struct device_attribute *attr,
-			  char *page);
-
 static inline int is_ht_workaround_enabled(void)
 {
 	return !!(x86_pmu.flags & PMU_FL_EXCL_ENABLED);
-- 
1.9.1
