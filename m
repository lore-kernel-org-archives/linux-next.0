From: Michal Hocko <mhocko@suse.cz>
Subject: [PATCH] mm, debug: mm-introduce-vm_bug_on_mm-fix.patch
Date: Tue, 23 Sep 2014 11:24:39 +0200
Message-ID: <1411464279-20158-1-git-send-email-mhocko@suse.cz>
References: <5420b8b0.9HdYLyyuTikszzH8%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <5420b8b0.9HdYLyyuTikszzH8%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Sasha Levin <sasha.levin@oracle.com>
List-Id: linux-next.vger.kernel.org

dump_mm wants to dump mm->owner even when CONFIG_MEMCG is not defined
which leads to a compilation error:
mm/debug.c: In function =E2=80=98dump_mm=E2=80=99:
mm/debug.c:212:5: error: =E2=80=98const struct mm_struct=E2=80=99 has no =
member named =E2=80=98owner=E2=80=99
   mm->owner, mm->exe_file,

Signed-off-by: Michal Hocko <mhocko@suse.cz>
---
 mm/debug.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 281abb2edddd..63aba9dcfb4e 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -181,7 +181,10 @@ void dump_mm(const struct mm_struct *mm)
 #ifdef CONFIG_AIO
 		"ioctx_table %p\n"
 #endif
-		"owner %p exe_file %p\n"
+#ifdef CONFIG_MEMCG
+		"owner %p "
+#endif
+		"exe_file %p\n"
 #ifdef CONFIG_MMU_NOTIFIER
 		"mmu_notifier_mm %p\n"
 #endif
@@ -209,7 +212,10 @@ void dump_mm(const struct mm_struct *mm)
 #ifdef CONFIG_AIO
 		mm->ioctx_table,
 #endif
-		mm->owner, mm->exe_file,
+#ifdef CONFIG_MEMCG
+		mm->owner,
+#endif
+		mm->exe_file,
 #ifdef CONFIG_MMU_NOTIFIER
 		mm->mmu_notifier_mm,
 #endif
--=20
2.1.0

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
