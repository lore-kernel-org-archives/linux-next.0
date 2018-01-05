From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 5 Jan 2018 15:59:28 +1100
Message-ID: <20180105155928.120ec516@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50085 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751205AbeAEE7a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Jan 2018 23:59:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/migrate.c: In function 'migrate_misplaced_page':
mm/migrate.c:1933:46: error: passing argument 2 of 'migrate_pages' from incompatible pointer type [-Werror=incompatible-pointer-types]
  nr_remaining = migrate_pages(&migratepages, alloc_misplaced_dst_page,
                                              ^
mm/migrate.c:1358:5: note: expected 'struct page * (*)(struct page *, long unsigned int)' but argument is of type 'struct page * (*)(struct page *, long unsigned int,  int **)'
 int migrate_pages(struct list_head *from, new_page_t get_new_page,
     ^

Caused by commit

  d6f08a86f78a ("mm, migrate: remove reason argument from new_page_t")

I applied the following fix patch for today (the mm/memory-failure.c
error turned up after fixing the above):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 5 Jan 2018 15:46:02 +1100
Subject: [PATCH] mm, migrate: remove reason argument from new_page_t fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/memory-failure.c | 2 +-
 mm/migrate.c        | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 4acdf393a801..d530ac1db680 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1483,7 +1483,7 @@ int unpoison_memory(unsigned long pfn)
 }
 EXPORT_SYMBOL(unpoison_memory);
 
-static struct page *new_page(struct page *p, unsigned long private, int **x)
+static struct page *new_page(struct page *p, unsigned long private)
 {
 	int nid = page_to_nid(p);
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 3cb0f5955b41..5d0dc7b85f90 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1797,8 +1797,7 @@ static bool migrate_balanced_pgdat(struct pglist_data *pgdat,
 }
 
 static struct page *alloc_misplaced_dst_page(struct page *page,
-					   unsigned long data,
-					   int **result)
+					   unsigned long data)
 {
 	int nid = (int) data;
 	struct page *newpage;
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
