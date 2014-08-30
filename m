From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -mmotm] mm: fix kmemcheck.c build errors
Date: Fri, 29 Aug 2014 18:48:36 -0700
Message-ID: <54012D74.7010302@infradead.org>
References: <5400fba1.732YclygYZprDXeI%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <5400fba1.732YclygYZprDXeI%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, Pekka Enberg <penberg@kernel.org>, Vegard Nossum <vegardno@ifi.uio.no>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Add header file to fix kmemcheck.c build errors:

../mm/kmemcheck.c:70:7: error: dereferencing pointer to incomplete type
../mm/kmemcheck.c:83:15: error: dereferencing pointer to incomplete type
../mm/kmemcheck.c:95:8: error: dereferencing pointer to incomplete type
../mm/kmemcheck.c:95:21: error: dereferencing pointer to incomplete type

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 mm/kmemcheck.c |    1 +
 1 file changed, 1 insertion(+)

Index: mmotm-2014-0829-1515/mm/kmemcheck.c
===================================================================
--- mmotm-2014-0829-1515.orig/mm/kmemcheck.c
+++ mmotm-2014-0829-1515/mm/kmemcheck.c
@@ -2,6 +2,7 @@
 #include <linux/mm_types.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/slab_def.h>
 #include <linux/kmemcheck.h>
 
 void kmemcheck_alloc_shadow(struct page *page, int order, gfp_t flags, int node)

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
