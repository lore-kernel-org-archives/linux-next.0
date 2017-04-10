From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 10 Apr 2017 17:51:03 +1000
Message-ID: <20170410175103.1a534c7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/migrate.c: In function 'migrate_vma_insert_page':
mm/migrate.c:2491:23: error: passing argument 2 of 'pud_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
  pudp = pud_alloc(mm, pgdp, addr);
                       ^
In file included from include/linux/migrate.h:4:0,
                 from mm/migrate.c:15:
include/linux/mm.h:1677:22: note: expected 'p4d_t * {aka struct <anonymous> *}' but argument is of type 'pgd_t * {aka struct <anonymous> *}'
 static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
                      ^

Caused by patch

  "mm/migrate: allow migrate_vma() to alloc new page on empty entry"

interacting with commit

  c2febafc6773 ("mm: convert generic code to 5-level paging")

from Linus' tree (v4.11-rc2).

I applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Apr 2017 17:09:15 +1000
Subject: [PATCH] mm/migrate: allow migrate_vma() to alloc new page on empty
 entry fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/migrate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index e4b555f9a689..7958dfa01b16 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2478,6 +2478,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	struct mem_cgroup *memcg;
 	spinlock_t *ptl;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -2488,7 +2489,10 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		goto abort;
 
 	pgdp = pgd_offset(mm, addr);
-	pudp = pud_alloc(mm, pgdp, addr);
+	p4dp = p4d_alloc(mm, pgdp, addr);
+	if (!p4dp)
+		goto abort;
+	pudp = pud_alloc(mm, p4dp, addr);
 	if (!pudp)
 		goto abort;
 	pmdp = pmd_alloc(mm, pudp, addr);
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
