From: Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH] mm: fix build warnings in <linux/compaction.h>
Date: Fri, 10 Jun 2016 09:33:04 +0900
Message-ID: <20160610003304.GE29779@bbox>
References: <5759A1F9.2070302@infradead.org>
 <20160609152716.1093ada2f52bbcc426e6ddb6@linux-foundation.org>
 <20160609233143.GC29779@bbox>
 <20160609163719.5af286badfa9b5314700fece@linux-foundation.org>
 <20160609235141.GD29779@bbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from LGEAMRELO11.lge.com ([156.147.23.51]:59676 "EHLO
	lgeamrelo11.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbcFJAby (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2016 20:31:54 -0400
Content-Disposition: inline
In-Reply-To: <20160609235141.GD29779@bbox>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux MM <linux-mm@kvack.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Gioh Kim <gi-oh.kim@profitbricks.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Rafael Aquini <aquini@redhat.com>, Vlastimil Babka <vbabka@suse.cz>

On Fri, Jun 10, 2016 at 08:51:41AM +0900, Minchan Kim wrote:
> On Thu, Jun 09, 2016 at 04:37:19PM -0700, Andrew Morton wrote:
> > On Fri, 10 Jun 2016 08:31:43 +0900 Minchan Kim <minchan@kernel.org> wrote:
> > 
> > > Hi Andrew,
> > > 
> > > On Thu, Jun 09, 2016 at 03:27:16PM -0700, Andrew Morton wrote:
> > > > On Thu, 9 Jun 2016 10:06:01 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> > > > 
> > > > > From: Randy Dunlap <rdunlap@infradead.org>
> > > > > 
> > > > > Fix build warnings when struct node is not defined:
> > > > > 
> > > > > In file included from ../include/linux/balloon_compaction.h:48:0,
> > > > >                  from ../mm/balloon_compaction.c:11:
> > > > > ../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list [enabled by default]
> > > > >  static inline int compaction_register_node(struct node *node)
> > > > > ../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> > > > > ../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list [enabled by default]
> > > > >  static inline void compaction_unregister_node(struct node *node)
> > > > > 
> > > > > ...
> > > > >
> > > > > --- linux-next-20160609.orig/include/linux/compaction.h
> > > > > +++ linux-next-20160609/include/linux/compaction.h
> > > > > @@ -233,6 +233,7 @@ extern int compaction_register_node(stru
> > > > >  extern void compaction_unregister_node(struct node *node);
> > > > >  
> > > > >  #else
> > > > > +struct node;
> > > > >  
> > > > >  static inline int compaction_register_node(struct node *node)
> > > > >  {
> > > > 
> > > > Well compaction.h has no #includes at all and obviously depends on its
> > > > including file(s) to bring in the definitions which it needs.
> > > > 
> > > > So if we want to keep that (odd) model then we should fix
> > > > mm-balloon-use-general-non-lru-movable-page-feature.patch thusly:
> > > 
> > > How about fixing such odd model in this chance?
> > > Otherwise, every non-lru page migration driver should include
> > > both compaction.h and node.h which is weired to me. :(
> > > 
> > > I think there are two ways.
> > > 
> > > 1. compaction.h include node.h directly so user of compaction.h don't
> > > need to take care about node.h
> > > 
> > > 2. Randy's fix
> > > 
> > > I looked up who use compaction_[un]register_node and found it's used
> > > only drivers/base/node.c which already include node.h so no problem.
> > > 
> > > 1) I believe it's rare those functions to be needed by other files.
> > > 2) Those functions works if CONFIG_NUMA as well as CONFIG_COMPACTION
> > > which is rare configuration for many not-server system.
> > 
> > If we're going to convert compaction.h to be standalone then it will
> > need to include a whole bunch of things - what's special about node.h?
> 
> Fair enough.
> I realize it would be better to relocate non-lru page migration functions to
> new separate header but I don't have an good idea to name that file. :(
> Anyway, I will work for it.
> 

Andrew, it's quick fix. How about this?


>From ef5fb1b2ecfd2143700977c8cf089ee6ca6cdd17 Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Fri, 10 Jun 2016 09:12:08 +0900
Subject: [PATCH] mm: fix build warnings in <linux/compaction.h>

Randy reported below build error.

> In file included from ../include/linux/balloon_compaction.h:48:0,
>                  from ../mm/balloon_compaction.c:11:
> ../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list [enabled by default]
>  static inline int compaction_register_node(struct node *node)
> ../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> ../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list [enabled by default]
>  static inline void compaction_unregister_node(struct node *node)
>

It was caused by non-lru page migration which needs compaction.h but
compaction.h doesn't include any header to be standalone.

I think proper header for non-lru page migration is migrate.h rather
than compaction.h because migrate.h has already headers needed to work
non-lru page migration indirectly like isolate_mode_t, migrate_mode
MIGRATEPAGE_SUCCESS.

Cc: Konstantin Khlebnikov <koct9i@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Gioh Kim <gi-oh.kim@profitbricks.com>
Cc: Rafael Aquini <aquini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 Documentation/vm/page_migration    | 11 ++++++-----
 drivers/virtio/virtio_balloon.c    |  2 +-
 include/linux/balloon_compaction.h |  2 +-
 include/linux/compaction.h         | 16 ----------------
 include/linux/migrate.h            | 15 +++++++++++++++
 mm/zsmalloc.c                      |  4 ++--
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/vm/page_migration b/Documentation/vm/page_migration
index 18d37c7ac50b..94bd9c11c4e0 100644
--- a/Documentation/vm/page_migration
+++ b/Documentation/vm/page_migration
@@ -181,11 +181,12 @@ After isolation, VM calls migratepage of driver with isolated page.
 The function of migratepage is to move content of the old page to new page
 and set up fields of struct page newpage. Keep in mind that you should
 indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
-under page_lock if you migrated the oldpage successfully and returns 0.
-If driver cannot migrate the page at the moment, driver can return -EAGAIN.
-On -EAGAIN, VM will retry page migration in a short time because VM interprets
--EAGAIN as "temporal migration failure". On returning any error except -EAGAIN,
-VM will give up the page migration without retrying in this time.
+under page_lock if you migrated the oldpage successfully and returns
+MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
+can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
+because VM interprets -EAGAIN as "temporal migration failure". On returning
+any error except -EAGAIN, VM will give up the page migration without retrying
+in this time.
 
 Driver shouldn't touch page.lru field VM using in the functions.
 
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 88d5609375de..888d5f8322ce 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -493,7 +493,7 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 
 	put_page(page); /* balloon reference */
 
-	return 0;
+	return MIGRATEPAGE_SUCCESS;
 }
 
 static struct dentry *balloon_mount(struct file_system_type *fs_type,
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index c0c430d06a9b..79542b2698ec 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -45,7 +45,7 @@
 #define _LINUX_BALLOON_COMPACTION_H
 #include <linux/pagemap.h>
 #include <linux/page-flags.h>
-#include <linux/compaction.h>
+#include <linux/migrate.h>
 #include <linux/gfp.h>
 #include <linux/err.h>
 #include <linux/fs.h>
diff --git a/include/linux/compaction.h b/include/linux/compaction.h
index c6b47c861cea..1a02dab16646 100644
--- a/include/linux/compaction.h
+++ b/include/linux/compaction.h
@@ -54,9 +54,6 @@ enum compact_result {
 struct alloc_context; /* in mm/internal.h */
 
 #ifdef CONFIG_COMPACTION
-extern int PageMovable(struct page *page);
-extern void __SetPageMovable(struct page *page, struct address_space *mapping);
-extern void __ClearPageMovable(struct page *page);
 extern int sysctl_compact_memory;
 extern int sysctl_compaction_handler(struct ctl_table *table, int write,
 			void __user *buffer, size_t *length, loff_t *ppos);
@@ -154,19 +151,6 @@ extern void kcompactd_stop(int nid);
 extern void wakeup_kcompactd(pg_data_t *pgdat, int order, int classzone_idx);
 
 #else
-static inline int PageMovable(struct page *page)
-{
-	return 0;
-}
-static inline void __SetPageMovable(struct page *page,
-			struct address_space *mapping)
-{
-}
-
-static inline void __ClearPageMovable(struct page *page)
-{
-}
-
 static inline enum compact_result try_to_compact_pages(gfp_t gfp_mask,
 			unsigned int order, int alloc_flags,
 			const struct alloc_context *ac,
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 404fbfefeb33..ae8d475a9385 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -71,6 +71,21 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 
 #endif /* CONFIG_MIGRATION */
 
+#ifdef CONFIG_COMPACTION
+extern int PageMovable(struct page *page);
+extern void __SetPageMovable(struct page *page, struct address_space *mapping);
+extern void __ClearPageMovable(struct page *page);
+#else
+static inline int PageMovable(struct page *page) { return 0; };
+static inline void __SetPageMovable(struct page *page,
+				struct address_space *mapping)
+{
+}
+static inline void __ClearPageMovable(struct page *page)
+{
+}
+#endif
+
 #ifdef CONFIG_NUMA_BALANCING
 extern bool pmd_trans_migrating(pmd_t pmd);
 extern int migrate_misplaced_page(struct page *page,
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 213d0e12fe82..502db584237b 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -50,7 +50,7 @@
 #include <linux/zsmalloc.h>
 #include <linux/zpool.h>
 #include <linux/mount.h>
-#include <linux/compaction.h>
+#include <linux/migrate.h>
 #include <linux/pagemap.h>
 
 #define ZSPAGE_MAGIC	0x58
@@ -2119,7 +2119,7 @@ int zs_page_migrate(struct address_space *mapping, struct page *newpage,
 	put_page(page);
 	page = newpage;
 
-	ret = 0;
+	ret = MIGRATEPAGE_SUCCESS;
 unpin_objects:
 	for (addr = s_addr + offset; addr < s_addr + pos;
 						addr += class->size) {
-- 
1.9.1
