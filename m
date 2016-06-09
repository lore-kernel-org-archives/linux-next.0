From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: fix build warnings in <linux/compaction.h>
Date: Thu, 9 Jun 2016 15:27:16 -0700
Message-ID: <20160609152716.1093ada2f52bbcc426e6ddb6@linux-foundation.org>
References: <5759A1F9.2070302@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <5759A1F9.2070302@infradead.org>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux MM <linux-mm@kvack.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Minchan Kim <minchan@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 9 Jun 2016 10:06:01 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build warnings when struct node is not defined:
> 
> In file included from ../include/linux/balloon_compaction.h:48:0,
>                  from ../mm/balloon_compaction.c:11:
> ../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list [enabled by default]
>  static inline int compaction_register_node(struct node *node)
> ../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> ../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list [enabled by default]
>  static inline void compaction_unregister_node(struct node *node)
> 
> ...
>
> --- linux-next-20160609.orig/include/linux/compaction.h
> +++ linux-next-20160609/include/linux/compaction.h
> @@ -233,6 +233,7 @@ extern int compaction_register_node(stru
>  extern void compaction_unregister_node(struct node *node);
>  
>  #else
> +struct node;
>  
>  static inline int compaction_register_node(struct node *node)
>  {

Well compaction.h has no #includes at all and obviously depends on its
including file(s) to bring in the definitions which it needs.

So if we want to keep that (odd) model then we should fix
mm-balloon-use-general-non-lru-movable-page-feature.patch thusly:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-balloon-use-general-non-lru-movable-page-feature-fix

compaction.h requires that the includer first include node.h

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Gioh Kim <gi-oh.kim@profitbricks.com>
Cc: Konstantin Khlebnikov <koct9i@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Rafael Aquini <aquini@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

--- a/include/linux/balloon_compaction.h~mm-balloon-use-general-non-lru-movable-page-feature-fix
+++ a/include/linux/balloon_compaction.h
@@ -45,6 +45,7 @@
 #define _LINUX_BALLOON_COMPACTION_H
 #include <linux/pagemap.h>
 #include <linux/page-flags.h>
+#include <linux/node.h>
 #include <linux/compaction.h>
 #include <linux/gfp.h>
 #include <linux/err.h>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
