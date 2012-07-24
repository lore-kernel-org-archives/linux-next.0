From: Mel Gorman <mgorman@suse.de>
Subject: Re: linux-next link failure
Date: Tue, 24 Jul 2012 11:27:51 +0100
Message-ID: <20120724102751.GR9222@suse.de>
References: <1343067410.3672.8.camel@deneb.redhat.com>
 <20120724101841.GQ9222@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58181 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751515Ab2GXK1y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jul 2012 06:27:54 -0400
Content-Disposition: inline
In-Reply-To: <20120724101841.GQ9222@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Jul 24, 2012 at 11:18:41AM +0100, Mel Gorman wrote:
> On Mon, Jul 23, 2012 at 02:16:49PM -0400, Mark Salter wrote:
> > Today's linux-next has a link failure on no-mmu systems:
> > 
> >   fs/built-in.o: In function `nfs_file_direct_read':
> >   (.text+0x80968): undefined reference to `get_kernel_page'
> >   fs/built-in.o: In function `nfs_file_direct_write':
> >   (.text+0x81178): undefined reference to `get_kernel_page'
> > 
> > The problem is that get_kernel_page does not exist if CONFIG_MMU is not
> > defined. This is the patch that added get_kernel_page():
> > 
> >   mm: add get_kernel_page[s] for pinning of kernel addresses for I/O
> > 
> > and the reference to get_kernelpage was added with:
> > 
> >   nfs: enable swap on NFS
> > 
> 
> Thanks, the inline patch should fix it.
> 
> Adding Andrew to cc. Andrew, merging this is tricky but the basic intent is
> to move get_kernel_pages from memory.c to swap.c which affects these patches
> 
> mm: add get_kernel_page[s] for pinning of kernel addresses for I/O
> mm: add support for a filesystem to activate swap files and use direct_IO for writing swap pages
> mm: swap: implement generic handler for swap_activate
> mm: add support for direct_IO to highmem pages
> 
> The build fix is needed for the first patch but the inlined version will
> collide as the later patches affect the same code. I'm attaching an
> alternative version that can be applied directly to the first patch.

The second I pushed send I realised the attached patch to be applied
directly to "mm: add get_kernel_page[s] for pinning of kernel addresses
for I/O" had a mangled changelog. This is how it should look. It will
still collide with "mm: mm: add support for direct_IO to highmem pages".

Sorry for the confusion.

---8<---
buildfix: mm: add get_kernel_page[s] for pinning of kernel addresses for I/O

get_kernel_pages was put in memory.c beside get_user_pages but this only
works for CONFIG_MMU. As there is nothing special to be done for
!CONFIG_MMU, this build fix moves the functions to mm/swap.c which is
the next best fit.

Signed-off-by: Mel Gorman <mgorman@suse.de>

diff --git a/mm/memory.c b/mm/memory.c
index bd41f00..caaef7f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1852,59 +1852,6 @@ next_page:
 EXPORT_SYMBOL(__get_user_pages);
 
 /*
- * get_kernel_pages() - pin kernel pages in memory
- * @kiov:	An array of struct kvec structures
- * @nr_segs:	number of segments to pin
- * @write:	pinning for read/write, currently ignored
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_segs long.
- *
- * Returns number of pages pinned. This may be fewer than the number
- * requested. If nr_pages is 0 or negative, returns 0. If no pages
- * were pinned, returns -errno. Each page returned must be released
- * with a put_page() call when it is finished with.
- */
-int get_kernel_pages(const struct kvec *kiov, int nr_segs, int write,
-		struct page **pages)
-{
-	int seg;
-
-	for (seg = 0; seg < nr_segs; seg++) {
-		if (WARN_ON(kiov[seg].iov_len != PAGE_SIZE))
-			return seg;
-
-		/* virt_to_page sanity checks the PFN */
-		pages[seg] = virt_to_page(kiov[seg].iov_base);
-		page_cache_get(pages[seg]);
-	}
-
-	return seg;
-}
-EXPORT_SYMBOL_GPL(get_kernel_pages);
-
-/*
- * get_kernel_page() - pin a kernel page in memory
- * @start:	starting kernel address
- * @write:	pinning for read/write, currently ignored
- * @pages:	array that receives pointer to the page pinned.
- *		Must be at least nr_segs long.
- *
- * Returns 1 if page is pinned. If the page was not pinned, returns
- * -errno. The page returned must be released with a put_page() call
- * when it is finished with.
- */
-int get_kernel_page(unsigned long start, int write, struct page **pages)
-{
-	const struct kvec kiov = {
-		.iov_base = (void *)start,
-		.iov_len = PAGE_SIZE
-	};
-
-	return get_kernel_pages(&kiov, 1, write, pages);
-}
-EXPORT_SYMBOL_GPL(get_kernel_page);
-
-/*
  * fixup_user_fault() - manually resolve a user page fault
  * @tsk:	the task_struct to use for page fault accounting, or
  *		NULL if faults are not to be recorded.
diff --git a/mm/swap.c b/mm/swap.c
index 4e7e2ec..7d7f80c 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -236,6 +236,59 @@ void put_pages_list(struct list_head *pages)
 }
 EXPORT_SYMBOL(put_pages_list);
 
+/*
+ * get_kernel_pages() - pin kernel pages in memory
+ * @kiov:	An array of struct kvec structures
+ * @nr_segs:	number of segments to pin
+ * @write:	pinning for read/write, currently ignored
+ * @pages:	array that receives pointers to the pages pinned.
+ *		Should be at least nr_segs long.
+ *
+ * Returns number of pages pinned. This may be fewer than the number
+ * requested. If nr_pages is 0 or negative, returns 0. If no pages
+ * were pinned, returns -errno. Each page returned must be released
+ * with a put_page() call when it is finished with.
+ */
+int get_kernel_pages(const struct kvec *kiov, int nr_segs, int write,
+		struct page **pages)
+{
+	int seg;
+
+	for (seg = 0; seg < nr_segs; seg++) {
+		if (WARN_ON(kiov[seg].iov_len != PAGE_SIZE))
+			return seg;
+
+		/* virt_to_page sanity checks the PFN */
+		pages[seg] = virt_to_page(kiov[seg].iov_base);
+		page_cache_get(pages[seg]);
+	}
+
+	return seg;
+}
+EXPORT_SYMBOL_GPL(get_kernel_pages);
+
+/*
+ * get_kernel_page() - pin a kernel page in memory
+ * @start:	starting kernel address
+ * @write:	pinning for read/write, currently ignored
+ * @pages:	array that receives pointer to the page pinned.
+ *		Must be at least nr_segs long.
+ *
+ * Returns 1 if page is pinned. If the page was not pinned, returns
+ * -errno. The page returned must be released with a put_page() call
+ * when it is finished with.
+ */
+int get_kernel_page(unsigned long start, int write, struct page **pages)
+{
+	const struct kvec kiov = {
+		.iov_base = (void *)start,
+		.iov_len = PAGE_SIZE
+	};
+
+	return get_kernel_pages(&kiov, 1, write, pages);
+}
+EXPORT_SYMBOL_GPL(get_kernel_page);
+
 static void pagevec_lru_move_fn(struct pagevec *pvec,
 	void (*move_fn)(struct page *page, struct lruvec *lruvec, void *arg),
 	void *arg)
