From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 13:36:57 -0800
Message-ID: <20160203133657.91755d6f5f9897a7c1c9b8c0@linux-foundation.org>
References: <20160203163613.327c6101@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:40779 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755559AbcBCVg6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2016 16:36:58 -0500
In-Reply-To: <20160203163613.327c6101@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joonsoo Kim <js1304@gmail.com>

On Wed, 3 Feb 2016 16:36:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> ep93xx_defconfig) failed like this:
> 
> mm/slab.c: In function 'is_debug_pagealloc_cache':
> mm/slab.c:1608:2: error: implicit declaration of function 'debug_pagealloc_enabled' [-Werror=implicit-function-declaration]
> 
> Caused by commit
> 
>   0a244aea1a61 ("mm/slab: clean up DEBUG_PAGEALLOC processing code")
> 
> CONFIG_DEBUG_PAGEALLOC is not enabled in this build.
> 
> Discovered after the linux-next release.

This works for me.

--- a/include/linux/mm.h~mm-slab-clean-up-debug_pagealloc-processing-code-fix
+++ a/include/linux/mm.h
@@ -2194,14 +2194,18 @@ kernel_map_pages(struct page *page, int
 }
 #ifdef CONFIG_HIBERNATION
 extern bool kernel_page_present(struct page *page);
-#endif /* CONFIG_HIBERNATION */
-#else
+#endif	/* CONFIG_HIBERNATION */
+#else	/* CONFIG_DEBUG_PAGEALLOC */
 static inline void
 kernel_map_pages(struct page *page, int numpages, int enable) {}
 #ifdef CONFIG_HIBERNATION
 static inline bool kernel_page_present(struct page *page) { return true; }
-#endif /* CONFIG_HIBERNATION */
-#endif
+#endif	/* CONFIG_HIBERNATION */
+static inline bool debug_pagealloc_enabled(void)
+{
+	return false;
+}
+#endif	/* CONFIG_DEBUG_PAGEALLOC */
 
 #ifdef __HAVE_ARCH_GATE_AREA
 extern struct vm_area_struct *get_gate_vma(struct mm_struct *mm);
_
