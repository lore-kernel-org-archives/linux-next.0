From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 16 Jun 2016 15:45:03 +1000
Message-ID: <20160616154503.65806e12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ebru Akagunduz <ebru.akagunduz@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/mm.h:400:0,
                 from mm/huge_memory.c:10:
include/linux/huge_mm.h:53:22: error: initializer element is not constant
 #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                      ^
mm/huge_memory.c:104:62: note: in expansion of macro 'HPAGE_PMD_NR'
 static unsigned int khugepaged_max_ptes_swap __read_mostly = HPAGE_PMD_NR/8;
                                                              ^

Caused by commit

  5c38823a834f ("mm: make optimistic check for swapin readahead")

We had this error some time ago, so I have added teh same patch as
last time:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 May 2016 18:25:42 +1000
Subject: [PATCH] mm: make optimistic check for swapin readahead fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/huge_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f0cd9dbc1157..6aabfa166b6d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -101,7 +101,7 @@ static DECLARE_WAIT_QUEUE_HEAD(khugepaged_wait);
  * fault.
  */
 static unsigned int khugepaged_max_ptes_none __read_mostly;
-static unsigned int khugepaged_max_ptes_swap __read_mostly = HPAGE_PMD_NR/8;
+static unsigned int khugepaged_max_ptes_swap __read_mostly;
 static unsigned long allocstall;
 
 static int khugepaged(void *none);
@@ -703,6 +703,7 @@ static int __init hugepage_init(void)
 
 	khugepaged_pages_to_scan = HPAGE_PMD_NR * 8;
 	khugepaged_max_ptes_none = HPAGE_PMD_NR - 1;
+	khugepaged_max_ptes_swap = HPAGE_PMD_NR / 8;
 	/*
 	 * hugepages can't be allocated by the buddy allocator
 	 */
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
