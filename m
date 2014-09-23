From: Michal Hocko <mhocko@suse.cz>
Subject: [PATCH] mm, debug: mm-introduce-vm_bug_on_mm-fix-fix.patch
Date: Tue, 23 Sep 2014 13:28:48 +0200
Message-ID: <20140923112848.GA10046@dhcp22.suse.cz>
References: <5420b8b0.9HdYLyyuTikszzH8%akpm@linux-foundation.org>
 <1411464279-20158-1-git-send-email-mhocko@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <1411464279-20158-1-git-send-email-mhocko@suse.cz>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Sasha Levin <sasha.levin@oracle.com>
List-Id: linux-next.vger.kernel.org

And there is another one hitting during randconfig. The patch makes my
eyes bleed but I don't know about other way without breaking out the
thing into separate parts sounds worse because we can mix with other
messages then.
---
>From 9df0782835e7bde769f8721cfe2b13b9f1dafa9a Mon Sep 17 00:00:00 2001
From: Michal Hocko <mhocko@suse.cz>
Date: Tue, 23 Sep 2014 12:55:18 +0200
Subject: [PATCH] mm, debug: introduce-vm_bug_on_mm-fix-fix.patch
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

dump_mm will fail to compile if the last config options are not defined.
I have hit the following (trimmed down) while doing randconfig:
mm/debug.c: In function =E2=80=98dump_mm=E2=80=99:
mm/debug.c:197:3: error: expected =E2=80=98)=E2=80=99 before =E2=80=98mm=E2=
=80=99
   mm, mm->mmap, mm->vmacache_seqnum, mm->task_size,
   ^
include/linux/printk.h:221:21: note: in definition of macro =E2=80=98pr_f=
mt=E2=80=99
 #define pr_fmt(fmt) fmt
                     ^
mm/debug.c:169:2: note: in expansion of macro =E2=80=98pr_emerg=E2=80=99
  pr_emerg("mm %p mmap %p seqnum %d task_size %lu\n"

with neither CONFIG_COMPACTION nor CONFIG_NUMA_BALANCING set because
the last format string portion will not have a comma separating other
parameters. There is also a trailing comma at the end of parameters
list.

Fix this by being careful to place commas before mm as the first known
unconditional paramter after formatting patch and also before the last
conditional parameters rather at their end.

Signed-off-by: Michal Hocko <mhocko@suse.cz>
---
 mm/debug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 63aba9dcfb4e..d21b7e6b4bbc 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -192,9 +192,9 @@ void dump_mm(const struct mm_struct *mm)
 		"numa_next_scan %lu numa_scan_offset %lu numa_scan_seq %d\n"
 #endif
 #if defined(CONFIG_NUMA_BALANCING) || defined(CONFIG_COMPACTION)
-		"tlb_flush_pending %d\n",
+		"tlb_flush_pending %d\n"
 #endif
-		mm, mm->mmap, mm->vmacache_seqnum, mm->task_size,
+		, mm, mm->mmap, mm->vmacache_seqnum, mm->task_size,
 #ifdef CONFIG_MMU
 		mm->get_unmapped_area,
 #endif
@@ -215,15 +215,15 @@ void dump_mm(const struct mm_struct *mm)
 #ifdef CONFIG_MEMCG
 		mm->owner,
 #endif
-		mm->exe_file,
+		mm->exe_file
 #ifdef CONFIG_MMU_NOTIFIER
-		mm->mmu_notifier_mm,
+		, mm->mmu_notifier_mm
 #endif
 #ifdef CONFIG_NUMA_BALANCING
-		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
+		, mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq
 #endif
 #if defined(CONFIG_NUMA_BALANCING) || defined(CONFIG_COMPACTION)
-		mm->tlb_flush_pending
+		, mm->tlb_flush_pending
 #endif
 		);
=20
--=20
2.1.0

--=20
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
