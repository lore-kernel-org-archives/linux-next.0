From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 13 Jun 2014 11:12:06 -0400
Message-ID: <539b14d3.e75eb40a.5896.6d75SMTPIN_ADDED_BROKEN@mx.google.com>
References: <20140613150550.7b2e2c4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20140613150550.7b2e2c4c@canb.auug.org.au>
Content-Disposition: inline
Sender: owner-linux-mm@kvack.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

# cced: linux-mm

Hi Stephen,

On Fri, Jun 13, 2014 at 03:05:50PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc ppc64_defconfig)
> failed like this:
> 
> fs/proc/task_mmu.c: In function 'smaps_pmd':
> include/linux/compiler.h:363:38: error: call to '__compiletime_assert_505' declared with attribute error: BUILD_BUG failed
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                       ^
> include/linux/compiler.h:346:4: note: in definition of macro '__compiletime_assert'
>     prefix ## suffix();    \
>     ^
> include/linux/compiler.h:363:2: note: in expansion of macro '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>   ^
> include/linux/bug.h:50:37: note: in expansion of macro 'compiletime_assert'
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^
> include/linux/bug.h:84:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>  #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                      ^
> include/linux/huge_mm.h:167:27: note: in expansion of macro 'BUILD_BUG'
>  #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
>                            ^
> fs/proc/task_mmu.c:505:39: note: in expansion of macro 'HPAGE_PMD_SIZE'
>   smaps_pte((pte_t *)pmd, addr, addr + HPAGE_PMD_SIZE, walk);
>                                        ^
> 
> Caused by commit b0e08c526179 ("mm/pagewalk: move pmd_trans_huge_lock()
> from callbacks to common code").
> 
> The reference to HPAGE_PMD_SIZE (which contains a BUILD_BUG() when
> CONFIG_TRANSPARENT_HUGEPAGE is not defined) used to be protected by a
> call to pmd_trans_huge_lock() (a static inline function that was
> contact 0 when CONFIG_TRANSPARENT_HUGEPAGE is not defined) so gcc did
> not see the reference and the BUG_ON.  That protection has been
> removed ...
> 
> I have reverted that commit and commit 2dc554765dd1
> ("mm-pagewalk-move-pmd_trans_huge_lock-from-callbacks-to-common-code-checkpatch-fixes")
> that depend on it for today.

Sorry about that, this build failure happens because I moved the
pmd_trans_huge_lock() into the common pagewalk code,
clearly this makes mm_walk->pmd_entry handle only transparent hugepage,
so the additional patch below explicitly declare it with #ifdef
CONFIG_TRANSPARENT_HUGEPAGE.

I'll merge this in the next version of my series, but this will help
linux-next for a quick solution.

Thanks,
Naoya Horiguchi
---
>From da0850cd03baa3d50c8e353976b5b9edbfbd4413 Mon Sep 17 00:00:00 2001
Date: Fri, 13 Jun 2014 10:33:26 -0400
Subject: [PATCH] fix build error of v3.15-mmotm-2014-06-12-16-38

Signed-off-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
---
 fs/proc/task_mmu.c | 17 +++++++++++++++++
 mm/memcontrol.c    |  8 ++++++++
 mm/mincore.c       |  4 ++++
 3 files changed, 29 insertions(+)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f42f658640cd..60ce441ee103 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -498,6 +498,7 @@ static int smaps_pte(pte_t *pte, unsigned long addr, unsigned long end,
 	return 0;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int smaps_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 			struct mm_walk *walk)
 {
@@ -506,6 +507,7 @@ static int smaps_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 	mss->anonymous_thp += HPAGE_PMD_SIZE;
 	return 0;
 }
+#endif
 
 static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 {
@@ -568,7 +570,9 @@ static int show_smap(struct seq_file *m, void *v, int is_pid)
 	struct vm_area_struct *vma = v;
 	struct mem_size_stats mss;
 	struct mm_walk smaps_walk = {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		.pmd_entry = smaps_pmd,
+#endif
 		.pte_entry = smaps_pte,
 		.mm = vma->vm_mm,
 		.vma = vma,
@@ -774,6 +778,7 @@ static int clear_refs_pte(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int clear_refs_pmd(pmd_t *pmd, unsigned long addr,
 				unsigned long end, struct mm_walk *walk)
 {
@@ -800,6 +805,7 @@ static int clear_refs_pmd(pmd_t *pmd, unsigned long addr,
 	walk->control = PTWALK_DOWN;
 	return 0;
 }
+#endif
 
 static int clear_refs_test_walk(unsigned long start, unsigned long end,
 				struct mm_walk *walk)
@@ -865,7 +871,9 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 		};
 		struct mm_walk clear_refs_walk = {
 			.pte_entry = clear_refs_pte,
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 			.pmd_entry = clear_refs_pmd,
+#endif
 			.test_walk = clear_refs_test_walk,
 			.mm = mm,
 			.private = &cp,
@@ -1030,6 +1038,7 @@ static int pagemap_pte(pte_t *pte, unsigned long addr, unsigned long end,
 	return add_to_pagemap(addr, &pme, pm);
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int pagemap_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     struct mm_walk *walk)
 {
@@ -1055,6 +1064,7 @@ static int pagemap_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 	}
 	return err;
 }
+#endif
 
 #ifdef CONFIG_HUGETLB_PAGE
 static void huge_pte_to_pagemap_entry(pagemap_entry_t *pme, struct pagemapread *pm,
@@ -1160,7 +1170,9 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
 		goto out_free;
 
 	pagemap_walk.pte_entry = pagemap_pte;
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	pagemap_walk.pmd_entry = pagemap_pmd;
+#endif
 	pagemap_walk.pte_hole = pagemap_pte_hole;
 #ifdef CONFIG_HUGETLB_PAGE
 	pagemap_walk.hugetlb_entry = pagemap_hugetlb;
@@ -1316,6 +1328,7 @@ static int gather_pte_stats(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int gather_pmd_stats(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -1330,6 +1343,8 @@ static int gather_pmd_stats(pmd_t *pmd, unsigned long addr,
 			     HPAGE_PMD_SIZE/PAGE_SIZE);
 	return 0;
 }
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE
 static int gather_hugetlb_stats(pte_t *pte, unsigned long addr,
 				unsigned long end, struct mm_walk *walk)
@@ -1381,7 +1396,9 @@ static int show_numa_map(struct seq_file *m, void *v, int is_pid)
 	memset(md, 0, sizeof(*md));
 
 	walk.hugetlb_entry = gather_hugetlb_stats;
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	walk.pmd_entry = gather_pmd_stats;
+#endif
 	walk.pte_entry = gather_pte_stats;
 	walk.private = md;
 	walk.mm = mm;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index cb11c74f2a5a..2a18af6d9cf4 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6729,6 +6729,7 @@ static int mem_cgroup_count_precharge_pte(pte_t *pte,
 	return 0;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int mem_cgroup_count_precharge_pmd(pmd_t *pmd,
 					unsigned long addr, unsigned long end,
 					struct mm_walk *walk)
@@ -6739,6 +6740,7 @@ static int mem_cgroup_count_precharge_pmd(pmd_t *pmd,
 		mc.precharge += HPAGE_PMD_NR;
 	return 0;
 }
+#endif
 
 static unsigned long mem_cgroup_count_precharge(struct mm_struct *mm)
 {
@@ -6746,7 +6748,9 @@ static unsigned long mem_cgroup_count_precharge(struct mm_struct *mm)
 	struct vm_area_struct *vma;
 
 	struct mm_walk mem_cgroup_count_precharge_walk = {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		.pmd_entry = mem_cgroup_count_precharge_pmd,
+#endif
 		.pte_entry = mem_cgroup_count_precharge_pte,
 		.mm = mm,
 	};
@@ -6948,6 +6952,7 @@ put:		/* get_mctgt_type() gets the page */
 	return 0;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int mem_cgroup_move_charge_pmd(pmd_t *pmd,
 				unsigned long addr, unsigned long end,
 				struct mm_walk *walk)
@@ -6976,12 +6981,15 @@ static int mem_cgroup_move_charge_pmd(pmd_t *pmd,
 	}
 	return 0;
 }
+#endif
 
 static void mem_cgroup_move_charge(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
 	struct mm_walk mem_cgroup_move_charge_walk = {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		.pmd_entry = mem_cgroup_move_charge_pmd,
+#endif
 		.pte_entry = mem_cgroup_move_charge_pte,
 		.mm = mm,
 	};
diff --git a/mm/mincore.c b/mm/mincore.c
index 9f89c34303ec..d8a5e9f62268 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -138,6 +138,7 @@ static int mincore_pte(pte_t *pte, unsigned long addr, unsigned long end,
 	return 0;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int mincore_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 			struct mm_walk *walk)
 {
@@ -145,6 +146,7 @@ static int mincore_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 	walk->private += (end - addr) >> PAGE_SHIFT;
 	return 0;
 }
+#endif
 
 /*
  * Do a chunk of "sys_mincore()". We've already checked
@@ -157,7 +159,9 @@ static long do_mincore(unsigned long addr, unsigned long pages,
 	struct vm_area_struct *vma;
 	int err;
 	struct mm_walk mincore_walk = {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		.pmd_entry = mincore_pmd,
+#endif
 		.pte_entry = mincore_pte,
 		.pte_hole = mincore_hole,
 		.hugetlb_entry = mincore_hugetlb,
-- 
1.9.3

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
