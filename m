From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] slob: fix build problem
Date: Tue, 17 Mar 2009 11:25:49 +0300
Message-ID: <20090317082549.GA5127@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
Sender: owner-linux-mm@kvack.org
To: Nick Piggin <npiggin@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

mm/slob.c: In function '__kmalloc_node':
mm/slob.c:480: error: 'flags' undeclared (first use in this function)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 mm/slob.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mm/slob.c b/mm/slob.c
index 081cf1e..e49b258 100644
--- a/mm/slob.c
+++ b/mm/slob.c
@@ -477,7 +477,7 @@ void *__kmalloc_node(size_t size, gfp_t gfp, int node)
 	int align = max(ARCH_KMALLOC_MINALIGN, ARCH_SLAB_MINALIGN);
 	void *ret;
 
-	lockdep_trace_alloc(flags);
+	lockdep_trace_alloc(gfp);
 
 	if (size < PAGE_SIZE - align) {
 		if (!size)

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
