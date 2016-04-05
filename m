From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Date: Tue, 5 Apr 2016 13:49:27 +1000
Message-ID: <20160405134927.75b47655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55301 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752175AbcDEDta (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Apr 2016 23:49:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/lustre/lnet/selftest/brw_test.c
  drivers/staging/lustre/lustre/include/lu_object.h
  drivers/staging/lustre/lustre/lclient/lcommon_cl.c
  drivers/staging/lustre/lustre/llite/llite_internal.h
  drivers/staging/lustre/lustre/llite/llite_lib.c
  drivers/staging/lustre/lustre/llite/llite_mmap.c
  drivers/staging/lustre/lustre/llite/rw.c
  drivers/staging/lustre/lustre/llite/rw26.c
  drivers/staging/lustre/lustre/llite/vvp_io.c
  drivers/staging/lustre/lustre/llite/vvp_page.c
  drivers/staging/lustre/lustre/obdclass/class_obd.c
  drivers/staging/lustre/lustre/obdecho/echo_client.c
  drivers/staging/lustre/lustre/osc/lproc_osc.c
  drivers/staging/lustre/lustre/osc/osc_cache.c
  drivers/staging/lustre/lustre/osc/osc_page.c
  drivers/staging/lustre/lustre/osc/osc_request.c

between commits:

  09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")
  ea1754a08476 ("mm, fs: remove remaining PAGE_CACHE_* and page_cache_{get,release} usage")

from Linus' tree and lots of commits from the staging tree.

I fixed it up (see below the signature) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

I also added this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 5 Apr 2016 13:38:19 +1000
Subject: [PATCH] lustre: fix ups for PAGE_CACHE_... removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/lustre/include/linux/libcfs/libcfs_prim.h | 2 +-
 drivers/staging/lustre/lustre/llite/vvp_dev.c             | 4 ++--
 drivers/staging/lustre/lustre/lov/lov_offset.c            | 4 ++--
 drivers/staging/lustre/lustre/lov/lov_page.c              | 2 +-
 drivers/staging/lustre/lustre/osc/osc_io.c                | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/lustre/include/linux/libcfs/libcfs_prim.h b/drivers/staging/lustre/include/linux/libcfs/libcfs_prim.h
index 6f7a276b87b7..ac4e8cfe6c8c 100644
--- a/drivers/staging/lustre/include/linux/libcfs/libcfs_prim.h
+++ b/drivers/staging/lustre/include/linux/libcfs/libcfs_prim.h
@@ -46,7 +46,7 @@
 #if BITS_PER_LONG == 32
 /* limit to lowmem on 32-bit systems */
 #define NUM_CACHEPAGES \
-	min(totalram_pages, 1UL << (30 - PAGE_CACHE_SHIFT) * 3 / 4)
+	min(totalram_pages, 1UL << (30 - PAGE_SHIFT) * 3 / 4)
 #else
 #define NUM_CACHEPAGES totalram_pages
 #endif
diff --git a/drivers/staging/lustre/lustre/llite/vvp_dev.c b/drivers/staging/lustre/lustre/llite/vvp_dev.c
index e35c1a1f272e..ea29cef8e559 100644
--- a/drivers/staging/lustre/lustre/llite/vvp_dev.c
+++ b/drivers/staging/lustre/lustre/llite/vvp_dev.c
@@ -498,7 +498,7 @@ static loff_t vvp_pgcache_find(const struct lu_env *env,
 				id.vpi_index = vmpage->index;
 				/* Cant support over 16T file */
 				nr = !(vmpage->index > 0xffffffff);
-				page_cache_release(vmpage);
+				put_page(vmpage);
 			}
 
 			lu_object_ref_del(&clob->co_lu, "dump", current);
@@ -581,7 +581,7 @@ static int vvp_pgcache_show(struct seq_file *f, void *v)
 				page = cl_vmpage_page(vmpage, clob);
 				unlock_page(vmpage);
 
-				page_cache_release(vmpage);
+				put_page(vmpage);
 			}
 
 			seq_printf(f, "%8x@" DFID ": ", id.vpi_index,
diff --git a/drivers/staging/lustre/lustre/lov/lov_offset.c b/drivers/staging/lustre/lustre/lov/lov_offset.c
index cb7b51617498..59dbdac37016 100644
--- a/drivers/staging/lustre/lustre/lov/lov_offset.c
+++ b/drivers/staging/lustre/lustre/lov/lov_offset.c
@@ -74,9 +74,9 @@ pgoff_t lov_stripe_pgoff(struct lov_stripe_md *lsm, pgoff_t stripe_index,
 {
 	loff_t offset;
 
-	offset = lov_stripe_size(lsm, stripe_index << PAGE_CACHE_SHIFT,
+	offset = lov_stripe_size(lsm, stripe_index << PAGE_SHIFT,
 				 stripe);
-	return offset >> PAGE_CACHE_SHIFT;
+	return offset >> PAGE_SHIFT;
 }
 
 /* we have an offset in file backed by an lov and want to find out where
diff --git a/drivers/staging/lustre/lustre/lov/lov_page.c b/drivers/staging/lustre/lustre/lov/lov_page.c
index 9634c13a574d..0306f00c3f33 100644
--- a/drivers/staging/lustre/lustre/lov/lov_page.c
+++ b/drivers/staging/lustre/lustre/lov/lov_page.c
@@ -83,7 +83,7 @@ static int lov_raid0_page_is_under_lock(const struct lu_env *env,
 	}
 
 	/* calculate the end of current stripe */
-	pps = loo->lo_lsm->lsm_stripe_size >> PAGE_CACHE_SHIFT;
+	pps = loo->lo_lsm->lsm_stripe_size >> PAGE_SHIFT;
 	index = ((slice->cpl_index + pps) & ~(pps - 1)) - 1;
 
 	/* never exceed the end of the stripe */
diff --git a/drivers/staging/lustre/lustre/osc/osc_io.c b/drivers/staging/lustre/lustre/osc/osc_io.c
index cf7743d2f148..894007854ce7 100644
--- a/drivers/staging/lustre/lustre/osc/osc_io.c
+++ b/drivers/staging/lustre/lustre/osc/osc_io.c
@@ -321,7 +321,7 @@ static int osc_io_rw_iter_init(const struct lu_env *env,
 	if (cl_io_is_append(io))
 		return 0;
 
-	npages = io->u.ci_rw.crw_count >> PAGE_CACHE_SHIFT;
+	npages = io->u.ci_rw.crw_count >> PAGE_SHIFT;
 	if (io->u.ci_rw.crw_pos & ~PAGE_MASK)
 		++npages;
 
-- 
2.7.0


-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/lustre/lnet/selftest/brw_test.c
index dcb6e506f592,1988cee36751..000000000000
--- a/drivers/staging/lustre/lnet/selftest/brw_test.c
+++ b/drivers/staging/lustre/lnet/selftest/brw_test.c
@@@ -90,8 -90,7 +90,7 @@@ brw_client_init(sfw_test_instance_t *ts
  		 * NB: this is not going to work for variable page size,
  		 * but we have to keep it for compatibility
  		 */
 -		len = npg * PAGE_CACHE_SIZE;
 +		len = npg * PAGE_SIZE;
- 
  	} else {
  		test_bulk_req_v1_t *breq = &tsi->tsi_u.bulk_v1;
  
@@@ -278,8 -277,7 +277,7 @@@ brw_client_prep_rpc(sfw_test_unit_t *ts
  		opc = breq->blk_opc;
  		flags = breq->blk_flags;
  		npg = breq->blk_npg;
 -		len = npg * PAGE_CACHE_SIZE;
 +		len = npg * PAGE_SIZE;
- 
  	} else {
  		test_bulk_req_v1_t *breq = &tsi->tsi_u.bulk_v1;
  
diff --cc drivers/staging/lustre/lustre/include/lu_object.h
index 242bb1ef6245,fcb9db6e1f1a..000000000000
--- a/drivers/staging/lustre/lustre/include/lu_object.h
+++ b/drivers/staging/lustre/lustre/include/lu_object.h
@@@ -1118,7 -1118,7 +1118,7 @@@ struct lu_context_key 
  	{							 \
  		type *value;				      \
  								  \
- 		CLASSERT(PAGE_SIZE >= sizeof (*value));       \
 -		CLASSERT(PAGE_CACHE_SIZE >= sizeof(*value));       \
++		CLASSERT(PAGE_SIZE >= sizeof(*value));       \
  								  \
  		value = kzalloc(sizeof(*value), GFP_NOFS);	\
  		if (!value)				\
diff --cc drivers/staging/lustre/lustre/llite/llite_internal.h
index e3c0f1dd4d31,ba24f09ba1f9..000000000000
--- a/drivers/staging/lustre/lustre/llite/llite_internal.h
+++ b/drivers/staging/lustre/lustre/llite/llite_internal.h
@@@ -981,7 -907,11 +907,11 @@@ static inline void ll_invalidate_page(s
  	if (!mapping)
  		return;
  
+ 	/*
+ 	 * truncate_complete_page() calls
+ 	 * a_ops->invalidatepage()->cl_page_delete()->vvp_page_delete().
+ 	 */
 -	ll_teardown_mmaps(mapping, offset, offset + PAGE_CACHE_SIZE);
 +	ll_teardown_mmaps(mapping, offset, offset + PAGE_SIZE);
  	truncate_complete_page(mapping, vmpage);
  }
  
diff --cc drivers/staging/lustre/lustre/llite/llite_mmap.c
index 5b484e62ffd0,5b4382cca0d7..000000000000
--- a/drivers/staging/lustre/lustre/llite/llite_mmap.c
+++ b/drivers/staging/lustre/lustre/llite/llite_mmap.c
@@@ -57,10 -57,10 +57,10 @@@ void policy_from_vma(ldlm_policy_data_
  		     struct vm_area_struct *vma, unsigned long addr,
  		     size_t count)
  {
- 	policy->l_extent.start = ((addr - vma->vm_start) & CFS_PAGE_MASK) +
+ 	policy->l_extent.start = ((addr - vma->vm_start) & PAGE_MASK) +
 -				 (vma->vm_pgoff << PAGE_CACHE_SHIFT);
 +				 (vma->vm_pgoff << PAGE_SHIFT);
  	policy->l_extent.end = (policy->l_extent.start + count - 1) |
- 			       ~CFS_PAGE_MASK;
+ 			       ~PAGE_MASK;
  }
  
  struct vm_area_struct *our_vma(struct mm_struct *mm, unsigned long addr,
diff --cc drivers/staging/lustre/lustre/llite/rw.c
index edab6c5b7e50,7d5dd3848552..000000000000
--- a/drivers/staging/lustre/lustre/llite/rw.c
+++ b/drivers/staging/lustre/lustre/llite/rw.c
@@@ -776,8 -643,8 +643,8 @@@ int ll_readahead(const struct lu_env *e
  	if (reserved != 0)
  		ll_ra_count_put(ll_i2sbi(inode), reserved);
  
 -	if (ra_end == end + 1 && ra_end == (kms >> PAGE_CACHE_SHIFT))
 +	if (ra_end == end + 1 && ra_end == (kms >> PAGE_SHIFT))
- 		ll_ra_stats_inc(mapping, RA_STAT_EOF);
+ 		ll_ra_stats_inc(inode, RA_STAT_EOF);
  
  	/* if we didn't get to the end of the region we reserved from
  	 * the ras we need to go back and update the ras so that the
diff --cc drivers/staging/lustre/lustre/llite/rw26.c
index 69aa15e8e3ef,65baeebead72..000000000000
--- a/drivers/staging/lustre/lustre/llite/rw26.c
+++ b/drivers/staging/lustre/lustre/llite/rw26.c
@@@ -382,11 -367,11 +367,11 @@@ static ssize_t ll_direct_IO_26(struct k
  	CDEBUG(D_VFSTRACE,
  	       "VFS Op:inode=%lu/%u(%p), size=%zd (max %lu), offset=%lld=%llx, pages %zd (max %lu)\n",
  	       inode->i_ino, inode->i_generation, inode, count, MAX_DIO_SIZE,
 -	       file_offset, file_offset, count >> PAGE_CACHE_SHIFT,
 -	       MAX_DIO_SIZE >> PAGE_CACHE_SHIFT);
 +	       file_offset, file_offset, count >> PAGE_SHIFT,
 +	       MAX_DIO_SIZE >> PAGE_SHIFT);
  
  	/* Check that all user buffers are aligned as well */
- 	if (iov_iter_alignment(iter) & ~CFS_PAGE_MASK)
+ 	if (iov_iter_alignment(iter) & ~PAGE_MASK)
  		return -EINVAL;
  
  	env = cl_env_get(&refcheck);
@@@ -432,11 -417,11 +417,11 @@@
  			 * page worth of page pointers = 4MB on i386.
  			 */
  			if (result == -ENOMEM &&
 -			    size > (PAGE_CACHE_SIZE / sizeof(*pages)) *
 -				   PAGE_CACHE_SIZE) {
 +			    size > (PAGE_SIZE / sizeof(*pages)) *
 +			    PAGE_SIZE) {
  				size = ((((size / 2) - 1) |
- 					 ~CFS_PAGE_MASK) + 1) &
- 					CFS_PAGE_MASK;
+ 					 ~PAGE_MASK) + 1) &
+ 					PAGE_MASK;
  				CDEBUG(D_VFSTRACE, "DIO size now %lu\n",
  				       size);
  				continue;
@@@ -474,37 -488,159 +488,159 @@@ static int ll_write_begin(struct file *
  			  loff_t pos, unsigned len, unsigned flags,
  			  struct page **pagep, void **fsdata)
  {
+ 	struct ll_cl_context *lcc;
+ 	struct lu_env  *env;
+ 	struct cl_io   *io;
+ 	struct cl_page *page;
+ 	struct cl_object *clob = ll_i2info(mapping->host)->lli_clob;
 -	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
 +	pgoff_t index = pos >> PAGE_SHIFT;
- 	struct page *page;
- 	int rc;
- 	unsigned from = pos & (PAGE_SIZE - 1);
+ 	struct page *vmpage = NULL;
 -	unsigned int from = pos & (PAGE_CACHE_SIZE - 1);
++	unsigned int from = pos & (PAGE_SIZE - 1);
+ 	unsigned int to = from + len;
+ 	int result = 0;
  
- 	page = grab_cache_page_write_begin(mapping, index, flags);
- 	if (!page)
- 		return -ENOMEM;
+ 	CDEBUG(D_VFSTRACE, "Writing %lu of %d to %d bytes\n", index, from, len);
+ 
+ 	lcc = ll_cl_init(file, NULL);
+ 	if (IS_ERR(lcc)) {
+ 		result = PTR_ERR(lcc);
+ 		goto out;
+ 	}
+ 
+ 	env = lcc->lcc_env;
+ 	io  = lcc->lcc_io;
+ 
+ 	/* To avoid deadlock, try to lock page first. */
+ 	vmpage = grab_cache_page_nowait(mapping, index);
+ 	if (unlikely(!vmpage || PageDirty(vmpage) || PageWriteback(vmpage))) {
+ 		struct vvp_io *vio = vvp_env_io(env);
+ 		struct cl_page_list *plist = &vio->u.write.vui_queue;
  
- 	*pagep = page;
+ 		/* if the page is already in dirty cache, we have to commit
+ 		 * the pages right now; otherwise, it may cause deadlock
+ 		 * because it holds page lock of a dirty page and request for
+ 		 * more grants. It's okay for the dirty page to be the first
+ 		 * one in commit page list, though.
+ 		 */
+ 		if (vmpage && plist->pl_nr > 0) {
+ 			unlock_page(vmpage);
 -			page_cache_release(vmpage);
++			put_page(vmpage);
+ 			vmpage = NULL;
+ 		}
  
- 	rc = ll_prepare_write(file, page, from, from + len);
- 	if (rc) {
- 		unlock_page(page);
- 		put_page(page);
+ 		/* commit pages and then wait for page lock */
+ 		result = vvp_io_write_commit(env, io);
+ 		if (result < 0)
+ 			goto out;
+ 
+ 		if (!vmpage) {
+ 			vmpage = grab_cache_page_write_begin(mapping, index,
+ 							     flags);
+ 			if (!vmpage) {
+ 				result = -ENOMEM;
+ 				goto out;
+ 			}
+ 		}
  	}
- 	return rc;
+ 
+ 	page = cl_page_find(env, clob, vmpage->index, vmpage, CPT_CACHEABLE);
+ 	if (IS_ERR(page)) {
+ 		result = PTR_ERR(page);
+ 		goto out;
+ 	}
+ 
+ 	lcc->lcc_page = page;
+ 	lu_ref_add(&page->cp_reference, "cl_io", io);
+ 
+ 	cl_page_assume(env, io, page);
+ 	if (!PageUptodate(vmpage)) {
+ 		/*
+ 		 * We're completely overwriting an existing page,
+ 		 * so _don't_ set it up to date until commit_write
+ 		 */
+ 		if (from == 0 && to == PAGE_SIZE) {
+ 			CL_PAGE_HEADER(D_PAGE, env, page, "full page write\n");
+ 			POISON_PAGE(vmpage, 0x11);
+ 		} else {
+ 			/* TODO: can be optimized at OSC layer to check if it
+ 			 * is a lockless IO. In that case, it's not necessary
+ 			 * to read the data.
+ 			 */
+ 			result = ll_prepare_partial_page(env, io, page);
+ 			if (result == 0)
+ 				SetPageUptodate(vmpage);
+ 		}
+ 	}
+ 	if (result < 0)
+ 		cl_page_unassume(env, io, page);
+ out:
+ 	if (result < 0) {
+ 		if (vmpage) {
+ 			unlock_page(vmpage);
 -			page_cache_release(vmpage);
++			put_page(vmpage);
+ 		}
+ 		if (!IS_ERR(lcc))
+ 			ll_cl_fini(lcc);
+ 	} else {
+ 		*pagep = vmpage;
+ 		*fsdata = lcc;
+ 	}
+ 	return result;
  }
  
  static int ll_write_end(struct file *file, struct address_space *mapping,
  			loff_t pos, unsigned len, unsigned copied,
- 			struct page *page, void *fsdata)
+ 			struct page *vmpage, void *fsdata)
  {
+ 	struct ll_cl_context *lcc = fsdata;
+ 	struct lu_env *env;
+ 	struct cl_io *io;
+ 	struct vvp_io *vio;
+ 	struct cl_page *page;
 -	unsigned from = pos & (PAGE_CACHE_SIZE - 1);
 +	unsigned from = pos & (PAGE_SIZE - 1);
- 	int rc;
+ 	bool unplug = false;
+ 	int result = 0;
+ 
 -	page_cache_release(vmpage);
++	put_page(vmpage);
+ 
+ 	env  = lcc->lcc_env;
+ 	page = lcc->lcc_page;
+ 	io   = lcc->lcc_io;
+ 	vio  = vvp_env_io(env);
+ 
+ 	LASSERT(cl_page_is_owned(page, io));
+ 	if (copied > 0) {
+ 		struct cl_page_list *plist = &vio->u.write.vui_queue;
+ 
+ 		lcc->lcc_page = NULL; /* page will be queued */
+ 
+ 		/* Add it into write queue */
+ 		cl_page_list_add(plist, page);
+ 		if (plist->pl_nr == 1) /* first page */
+ 			vio->u.write.vui_from = from;
+ 		else
+ 			LASSERT(from == 0);
+ 		vio->u.write.vui_to = from + copied;
+ 
+ 		/* We may have one full RPC, commit it soon */
+ 		if (plist->pl_nr >= PTLRPC_MAX_BRW_PAGES)
+ 			unplug = true;
+ 
+ 		CL_PAGE_DEBUG(D_VFSTRACE, env, page,
+ 			      "queued page: %d.\n", plist->pl_nr);
+ 	} else {
+ 		cl_page_disown(env, io, page);
+ 
+ 		/* page list is not contiguous now, commit it now */
+ 		unplug = true;
+ 	}
  
- 	rc = ll_commit_write(file, page, from, from + copied);
- 	unlock_page(page);
- 	put_page(page);
+ 	if (unplug ||
+ 	    file->f_flags & O_SYNC || IS_SYNC(file_inode(file)))
+ 		result = vvp_io_write_commit(env, io);
  
- 	return rc ?: copied;
+ 	ll_cl_fini(lcc);
+ 	return result >= 0 ? copied : result;
  }
  
  #ifdef CONFIG_MIGRATION
diff --cc drivers/staging/lustre/lustre/llite/vvp_io.c
index 85a835976174,aed7b8e41a51..000000000000
--- a/drivers/staging/lustre/lustre/llite/vvp_io.c
+++ b/drivers/staging/lustre/lustre/llite/vvp_io.c
@@@ -95,6 -104,115 +104,115 @@@ static bool can_populate_pages(const st
  	return rc;
  }
  
+ static void vvp_object_size_lock(struct cl_object *obj)
+ {
+ 	struct inode *inode = vvp_object_inode(obj);
+ 
+ 	ll_inode_size_lock(inode);
+ 	cl_object_attr_lock(obj);
+ }
+ 
+ static void vvp_object_size_unlock(struct cl_object *obj)
+ {
+ 	struct inode *inode = vvp_object_inode(obj);
+ 
+ 	cl_object_attr_unlock(obj);
+ 	ll_inode_size_unlock(inode);
+ }
+ 
+ /**
+  * Helper function that if necessary adjusts file size (inode->i_size), when
+  * position at the offset \a pos is accessed. File size can be arbitrary stale
+  * on a Lustre client, but client at least knows KMS. If accessed area is
+  * inside [0, KMS], set file size to KMS, otherwise glimpse file size.
+  *
+  * Locking: cl_isize_lock is used to serialize changes to inode size and to
+  * protect consistency between inode size and cl_object
+  * attributes. cl_object_size_lock() protects consistency between cl_attr's of
+  * top-object and sub-objects.
+  */
+ static int vvp_prep_size(const struct lu_env *env, struct cl_object *obj,
+ 			 struct cl_io *io, loff_t start, size_t count,
+ 			 int *exceed)
+ {
+ 	struct cl_attr *attr  = vvp_env_thread_attr(env);
+ 	struct inode   *inode = vvp_object_inode(obj);
+ 	loff_t	  pos   = start + count - 1;
+ 	loff_t kms;
+ 	int result;
+ 
+ 	/*
+ 	 * Consistency guarantees: following possibilities exist for the
+ 	 * relation between region being accessed and real file size at this
+ 	 * moment:
+ 	 *
+ 	 *  (A): the region is completely inside of the file;
+ 	 *
+ 	 *  (B-x): x bytes of region are inside of the file, the rest is
+ 	 *  outside;
+ 	 *
+ 	 *  (C): the region is completely outside of the file.
+ 	 *
+ 	 * This classification is stable under DLM lock already acquired by
+ 	 * the caller, because to change the class, other client has to take
+ 	 * DLM lock conflicting with our lock. Also, any updates to ->i_size
+ 	 * by other threads on this client are serialized by
+ 	 * ll_inode_size_lock(). This guarantees that short reads are handled
+ 	 * correctly in the face of concurrent writes and truncates.
+ 	 */
+ 	vvp_object_size_lock(obj);
+ 	result = cl_object_attr_get(env, obj, attr);
+ 	if (result == 0) {
+ 		kms = attr->cat_kms;
+ 		if (pos > kms) {
+ 			/*
+ 			 * A glimpse is necessary to determine whether we
+ 			 * return a short read (B) or some zeroes at the end
+ 			 * of the buffer (C)
+ 			 */
+ 			vvp_object_size_unlock(obj);
+ 			result = cl_glimpse_lock(env, io, inode, obj, 0);
+ 			if (result == 0 && exceed) {
+ 				/* If objective page index exceed end-of-file
+ 				 * page index, return directly. Do not expect
+ 				 * kernel will check such case correctly.
+ 				 * linux-2.6.18-128.1.1 miss to do that.
+ 				 * --bug 17336
+ 				 */
+ 				loff_t size = i_size_read(inode);
 -				loff_t cur_index = start >> PAGE_CACHE_SHIFT;
++				loff_t cur_index = start >> PAGE_SHIFT;
+ 				loff_t size_index = (size - 1) >>
 -						    PAGE_CACHE_SHIFT;
++						    PAGE_SHIFT;
+ 
+ 				if ((size == 0 && cur_index != 0) ||
+ 				    size_index < cur_index)
+ 					*exceed = 1;
+ 			}
+ 			return result;
+ 		}
+ 		/*
+ 		 * region is within kms and, hence, within real file
+ 		 * size (A). We need to increase i_size to cover the
+ 		 * read region so that generic_file_read() will do its
+ 		 * job, but that doesn't mean the kms size is
+ 		 * _correct_, it is only the _minimum_ size. If
+ 		 * someone does a stat they will get the correct size
+ 		 * which will always be >= the kms value here.
+ 		 * b=11081
+ 		 */
+ 		if (i_size_read(inode) < kms) {
+ 			i_size_write(inode, kms);
+ 			CDEBUG(D_VFSTRACE, DFID " updating i_size %llu\n",
+ 			       PFID(lu_object_fid(&obj->co_lu)),
+ 			       (__u64)i_size_read(inode));
+ 		}
+ 	}
+ 
+ 	vvp_object_size_unlock(obj);
+ 
+ 	return result;
+ }
+ 
  /*****************************************************************************
   *
   * io operations.
@@@ -505,17 -708,14 +708,14 @@@ static int vvp_io_read_start(const stru
  			 inode->i_ino, cnt, pos, i_size_read(inode));
  
  	/* turn off the kernel's read-ahead */
- 	cio->cui_fd->fd_file->f_ra.ra_pages = 0;
+ 	vio->vui_fd->fd_file->f_ra.ra_pages = 0;
  
  	/* initialize read-ahead window once per syscall */
- 	if (!vio->cui_ra_window_set) {
- 		vio->cui_ra_window_set = 1;
- 		bead->lrr_start = cl_index(obj, pos);
- 		/*
- 		 * XXX: explicit PAGE_SIZE
- 		 */
- 		bead->lrr_count = cl_index(obj, tot + PAGE_SIZE - 1);
- 		ll_ra_read_in(file, bead);
+ 	if (!vio->vui_ra_valid) {
+ 		vio->vui_ra_valid = true;
+ 		vio->vui_ra_start = cl_index(obj, pos);
 -		vio->vui_ra_count = cl_index(obj, tot + PAGE_CACHE_SIZE - 1);
++		vio->vui_ra_count = cl_index(obj, tot + PAGE_SIZE - 1);
+ 		ll_ras_enter(file);
  	}
  
  	/* BUG: 5972 */
diff --cc drivers/staging/lustre/lustre/llite/vvp_page.c
index 33ca3eb34965,0c92293dbf2e..000000000000
--- a/drivers/staging/lustre/lustre/llite/vvp_page.c
+++ b/drivers/staging/lustre/lustre/llite/vvp_page.c
@@@ -52,12 -59,12 +59,12 @@@
   *
   */
  
- static void vvp_page_fini_common(struct ccc_page *cp)
+ static void vvp_page_fini_common(struct vvp_page *vpg)
  {
- 	struct page *vmpage = cp->cpg_page;
+ 	struct page *vmpage = vpg->vpg_page;
  
  	LASSERT(vmpage);
 -	page_cache_release(vmpage);
 +	put_page(vmpage);
  }
  
  static void vvp_page_fini(const struct lu_env *env,
@@@ -530,27 -553,31 +553,31 @@@ static const struct cl_page_operations 
  };
  
  int vvp_page_init(const struct lu_env *env, struct cl_object *obj,
- 		  struct cl_page *page, struct page *vmpage)
+ 		struct cl_page *page, pgoff_t index)
  {
- 	struct ccc_page *cpg = cl_object_page_slice(obj, page);
+ 	struct vvp_page *vpg = cl_object_page_slice(obj, page);
+ 	struct page     *vmpage = page->cp_vmpage;
  
- 	CLOBINVRNT(env, obj, ccc_object_invariant(obj));
+ 	CLOBINVRNT(env, obj, vvp_object_invariant(obj));
  
- 	cpg->cpg_page = vmpage;
+ 	vpg->vpg_page = vmpage;
 -	page_cache_get(vmpage);
 +	get_page(vmpage);
  
- 	INIT_LIST_HEAD(&cpg->cpg_pending_linkage);
+ 	INIT_LIST_HEAD(&vpg->vpg_pending_linkage);
  	if (page->cp_type == CPT_CACHEABLE) {
+ 		/* in cache, decref in vvp_page_delete */
+ 		atomic_inc(&page->cp_ref);
  		SetPagePrivate(vmpage);
  		vmpage->private = (unsigned long)page;
- 		cl_page_slice_add(page, &cpg->cpg_cl, obj, &vvp_page_ops);
+ 		cl_page_slice_add(page, &vpg->vpg_cl, obj, index,
+ 				  &vvp_page_ops);
  	} else {
- 		struct ccc_object *clobj = cl2ccc(obj);
+ 		struct vvp_object *clobj = cl2vvp(obj);
  
- 		LASSERT(!inode_trylock(clobj->cob_inode));
- 		cl_page_slice_add(page, &cpg->cpg_cl, obj,
+ 		LASSERT(!inode_trylock(clobj->vob_inode));
+ 		cl_page_slice_add(page, &vpg->vpg_cl, obj, index,
  				  &vvp_transient_page_ops);
- 		clobj->cob_transient_pages++;
+ 		clobj->vob_transient_pages++;
  	}
  	return 0;
  }
diff --cc drivers/staging/lustre/lustre/obdclass/class_obd.c
index c2cf015962dd,d9844ba8b9be..000000000000
--- a/drivers/staging/lustre/lustre/obdclass/class_obd.c
+++ b/drivers/staging/lustre/lustre/obdclass/class_obd.c
@@@ -461,9 -461,9 +461,9 @@@ static int obd_init_checks(void
  		CWARN("LPD64 wrong length! strlen(%s)=%d != 2\n", buf, len);
  		ret = -EINVAL;
  	}
- 	if ((u64val & ~CFS_PAGE_MASK) >= PAGE_SIZE) {
 -	if ((u64val & ~PAGE_MASK) >= PAGE_CACHE_SIZE) {
++	if ((u64val & ~PAGE_MASK) >= PAGE_SIZE) {
  		CWARN("mask failed: u64val %llu >= %llu\n", u64val,
 -		      (__u64)PAGE_CACHE_SIZE);
 +		      (__u64)PAGE_SIZE);
  		ret = -EINVAL;
  	}
  
diff --cc drivers/staging/lustre/lustre/obdecho/echo_client.c
index 1e83669c204d,a752bb4e946b..000000000000
--- a/drivers/staging/lustre/lustre/obdecho/echo_client.c
+++ b/drivers/staging/lustre/lustre/obdecho/echo_client.c
@@@ -273,12 -266,10 +266,10 @@@ static void echo_page_completion(const 
  static void echo_page_fini(const struct lu_env *env,
  			   struct cl_page_slice *slice)
  {
- 	struct echo_page *ep    = cl2echo_page(slice);
  	struct echo_object *eco = cl2echo_obj(slice->cpl_obj);
- 	struct page *vmpage      = ep->ep_vmpage;
  
  	atomic_dec(&eco->eo_npages);
- 	put_page(vmpage);
 -	page_cache_release(slice->cpl_page->cp_vmpage);
++	put_page(slice->cpl_page->cp_vmpage);
  }
  
  static int echo_page_prep(const struct lu_env *env,
@@@ -372,10 -345,9 +345,9 @@@ static int echo_page_init(const struct 
  	struct echo_page *ep = cl_object_page_slice(obj, page);
  	struct echo_object *eco = cl2echo_obj(obj);
  
- 	ep->ep_vmpage = vmpage;
- 	get_page(vmpage);
 -	page_cache_get(page->cp_vmpage);
++	get_page(page->cp_vmpage);
  	mutex_init(&ep->ep_lock);
- 	cl_page_slice_add(page, &ep->ep_cl, obj, &echo_page_ops);
+ 	cl_page_slice_add(page, &ep->ep_cl, obj, index, &echo_page_ops);
  	atomic_inc(&eco->eo_npages);
  	return 0;
  }
@@@ -1470,11 -1429,11 +1429,11 @@@ static int echo_client_prep_commit(cons
  	u64 npages, tot_pages;
  	int i, ret = 0, brw_flags = 0;
  
- 	if (count <= 0 || (count & (~CFS_PAGE_MASK)) != 0)
+ 	if (count <= 0 || (count & (~PAGE_MASK)) != 0)
  		return -EINVAL;
  
 -	npages = batch >> PAGE_CACHE_SHIFT;
 -	tot_pages = count >> PAGE_CACHE_SHIFT;
 +	npages = batch >> PAGE_SHIFT;
 +	tot_pages = count >> PAGE_SHIFT;
  
  	lnb = kcalloc(npages, sizeof(struct niobuf_local), GFP_NOFS);
  	rnb = kcalloc(npages, sizeof(struct niobuf_remote), GFP_NOFS);
diff --cc drivers/staging/lustre/lustre/osc/lproc_osc.c
index a3358c39b2f1,911e5054a9c4..000000000000
--- a/drivers/staging/lustre/lustre/osc/lproc_osc.c
+++ b/drivers/staging/lustre/lustre/osc/lproc_osc.c
@@@ -169,10 -169,10 +169,10 @@@ static ssize_t max_dirty_mb_store(struc
  	    pages_number > totalram_pages / 4) /* 1/4 of RAM */
  		return -ERANGE;
  
- 	client_obd_list_lock(&cli->cl_loi_list_lock);
+ 	spin_lock(&cli->cl_loi_list_lock);
 -	cli->cl_dirty_max = (u32)(pages_number << PAGE_CACHE_SHIFT);
 +	cli->cl_dirty_max = (u32)(pages_number << PAGE_SHIFT);
  	osc_wake_cache_waiters(cli);
- 	client_obd_list_unlock(&cli->cl_loi_list_lock);
+ 	spin_unlock(&cli->cl_loi_list_lock);
  
  	return count;
  }
@@@ -569,17 -577,17 +577,17 @@@ static ssize_t max_pages_per_rpc_store(
  
  	/* if the max_pages is specified in bytes, convert to pages */
  	if (val >= ONE_MB_BRW_SIZE)
 -		val >>= PAGE_CACHE_SHIFT;
 +		val >>= PAGE_SHIFT;
  
 -	chunk_mask = ~((1 << (cli->cl_chunkbits - PAGE_CACHE_SHIFT)) - 1);
 +	chunk_mask = ~((1 << (cli->cl_chunkbits - PAGE_SHIFT)) - 1);
  	/* max_pages_per_rpc must be chunk aligned */
  	val = (val + ~chunk_mask) & chunk_mask;
 -	if (val == 0 || val > ocd->ocd_brw_size >> PAGE_CACHE_SHIFT) {
 +	if (val == 0 || val > ocd->ocd_brw_size >> PAGE_SHIFT) {
  		return -ERANGE;
  	}
- 	client_obd_list_lock(&cli->cl_loi_list_lock);
+ 	spin_lock(&cli->cl_loi_list_lock);
  	cli->cl_max_pages_per_rpc = val;
- 	client_obd_list_unlock(&cli->cl_loi_list_lock);
+ 	spin_unlock(&cli->cl_loi_list_lock);
  
  	return count;
  }
diff --cc drivers/staging/lustre/lustre/osc/osc_cache.c
index 5f25bf83dcfc,d01f2a207a91..000000000000
--- a/drivers/staging/lustre/lustre/osc/osc_cache.c
+++ b/drivers/staging/lustre/lustre/osc/osc_cache.c
@@@ -543,8 -556,8 +556,8 @@@ static int osc_extent_merge(const struc
  	if (cur->oe_max_end != victim->oe_max_end)
  		return -ERANGE;
  
- 	LASSERT(cur->oe_osclock == victim->oe_osclock);
+ 	LASSERT(cur->oe_dlmlock == victim->oe_dlmlock);
 -	ppc_bits = osc_cli(obj)->cl_chunkbits - PAGE_CACHE_SHIFT;
 +	ppc_bits = osc_cli(obj)->cl_chunkbits - PAGE_SHIFT;
  	chunk_start = cur->oe_start >> ppc_bits;
  	chunk_end = cur->oe_end >> ppc_bits;
  	if (chunk_start != (victim->oe_end >> ppc_bits) + 1 &&
@@@ -644,11 -657,15 +657,15 @@@ static struct osc_extent *osc_extent_fi
  	if (!cur)
  		return ERR_PTR(-ENOMEM);
  
- 	lock = cl_lock_at_pgoff(env, osc2cl(obj), index, NULL, 1, 0);
- 	LASSERT(lock->cll_descr.cld_mode >= CLM_WRITE);
+ 	olck = osc_env_io(env)->oi_write_osclock;
+ 	LASSERTF(olck, "page %lu is not covered by lock\n", index);
+ 	LASSERT(olck->ols_state == OLS_GRANTED);
+ 
+ 	descr = &olck->ols_cl.cls_lock->cll_descr;
+ 	LASSERT(descr->cld_mode >= CLM_WRITE);
  
 -	LASSERT(cli->cl_chunkbits >= PAGE_CACHE_SHIFT);
 -	ppc_bits = cli->cl_chunkbits - PAGE_CACHE_SHIFT;
 +	LASSERT(cli->cl_chunkbits >= PAGE_SHIFT);
 +	ppc_bits = cli->cl_chunkbits - PAGE_SHIFT;
  	chunk_mask = ~((1 << ppc_bits) - 1);
  	chunksize = 1 << cli->cl_chunkbits;
  	chunk = index >> ppc_bits;
@@@ -1288,14 -1309,14 +1309,14 @@@ static int osc_refresh_count(const stru
  	if (result < 0)
  		return result;
  	kms = attr->cat_kms;
- 	if (cl_offset(obj, page->cp_index) >= kms)
+ 	if (cl_offset(obj, index) >= kms)
  		/* catch race with truncate */
  		return 0;
- 	else if (cl_offset(obj, page->cp_index + 1) > kms)
+ 	else if (cl_offset(obj, index + 1) > kms)
  		/* catch sub-page write at end of file */
 -		return kms % PAGE_CACHE_SIZE;
 +		return kms % PAGE_SIZE;
  	else
 -		return PAGE_CACHE_SIZE;
 +		return PAGE_SIZE;
  }
  
  static int osc_completion(const struct lu_env *env, struct osc_async_page *oap,
@@@ -1373,13 -1394,13 +1394,13 @@@
  static void osc_consume_write_grant(struct client_obd *cli,
  				    struct brw_page *pga)
  {
- 	assert_spin_locked(&cli->cl_loi_list_lock.lock);
+ 	assert_spin_locked(&cli->cl_loi_list_lock);
  	LASSERT(!(pga->flag & OBD_BRW_FROM_GRANT));
  	atomic_inc(&obd_dirty_pages);
 -	cli->cl_dirty += PAGE_CACHE_SIZE;
 +	cli->cl_dirty += PAGE_SIZE;
  	pga->flag |= OBD_BRW_FROM_GRANT;
  	CDEBUG(D_CACHE, "using %lu grant credits for brw %p page %p\n",
 -	       PAGE_CACHE_SIZE, pga, pga->pg);
 +	       PAGE_SIZE, pga, pga->pg);
  	osc_update_next_shrink(cli);
  }
  
@@@ -1467,9 -1488,9 +1488,9 @@@ static void osc_free_grant(struct clien
  {
  	int grant = (1 << cli->cl_chunkbits) + cli->cl_extent_tax;
  
- 	client_obd_list_lock(&cli->cl_loi_list_lock);
+ 	spin_lock(&cli->cl_loi_list_lock);
  	atomic_sub(nr_pages, &obd_dirty_pages);
 -	cli->cl_dirty -= nr_pages << PAGE_CACHE_SHIFT;
 +	cli->cl_dirty -= nr_pages << PAGE_SHIFT;
  	cli->cl_lost_grant += lost_grant;
  	if (cli->cl_avail_grant < grant && cli->cl_lost_grant >= grant) {
  		/* borrow some grant from truncate to avoid the case that
diff --cc drivers/staging/lustre/lustre/osc/osc_page.c
index ce9ddd515f64,82979f4039c1..000000000000
--- a/drivers/staging/lustre/lustre/osc/osc_page.c
+++ b/drivers/staging/lustre/lustre/osc/osc_page.c
@@@ -410,10 -309,10 +309,10 @@@ int osc_page_init(const struct lu_env *
  	int result;
  
  	opg->ops_from = 0;
 -	opg->ops_to = PAGE_CACHE_SIZE;
 +	opg->ops_to = PAGE_SIZE;
  
- 	result = osc_prep_async_page(osc, opg, vmpage,
- 				     cl_offset(obj, page->cp_index));
+ 	result = osc_prep_async_page(osc, opg, page->cp_vmpage,
+ 				     cl_offset(obj, index));
  	if (result == 0) {
  		struct osc_io *oio = osc_env_io(env);
  
@@@ -486,10 -395,9 +395,9 @@@ static DECLARE_WAIT_QUEUE_HEAD(osc_lru_
  /* LRU pages are freed in batch mode. OSC should at least free this
   * number of pages to avoid running out of LRU budget, and..
   */
 -static const int lru_shrink_min = 2 << (20 - PAGE_CACHE_SHIFT);  /* 2M */
 +static const int lru_shrink_min = 2 << (20 - PAGE_SHIFT);  /* 2M */
  /* free this number at most otherwise it will take too long time to finish. */
- static const int lru_shrink_max = 32 << (20 - PAGE_SHIFT); /* 32M */
 -static const int lru_shrink_max = 8 << (20 - PAGE_CACHE_SHIFT); /* 8M */
++static const int lru_shrink_max = 8 << (20 - PAGE_SHIFT); /* 8M */
  
  /* Check if we can free LRU slots from this OSC. If there exists LRU waiters,
   * we should free slots aggressively. In this way, slots are freed in a steady
diff --cc drivers/staging/lustre/lustre/osc/osc_request.c
index 30526ebcad04,547539c74a7b..000000000000
--- a/drivers/staging/lustre/lustre/osc/osc_request.c
+++ b/drivers/staging/lustre/lustre/osc/osc_request.c
@@@ -909,12 -910,12 +910,12 @@@ static void osc_shrink_grant_local(stru
  static int osc_shrink_grant(struct client_obd *cli)
  {
  	__u64 target_bytes = (cli->cl_max_rpcs_in_flight + 1) *
 -			     (cli->cl_max_pages_per_rpc << PAGE_CACHE_SHIFT);
 +			     (cli->cl_max_pages_per_rpc << PAGE_SHIFT);
  
- 	client_obd_list_lock(&cli->cl_loi_list_lock);
+ 	spin_lock(&cli->cl_loi_list_lock);
  	if (cli->cl_avail_grant <= target_bytes)
 -		target_bytes = cli->cl_max_pages_per_rpc << PAGE_CACHE_SHIFT;
 +		target_bytes = cli->cl_max_pages_per_rpc << PAGE_SHIFT;
- 	client_obd_list_unlock(&cli->cl_loi_list_lock);
+ 	spin_unlock(&cli->cl_loi_list_lock);
  
  	return osc_shrink_grant_to_target(cli, target_bytes);
  }
@@@ -929,14 -930,14 +930,14 @@@ int osc_shrink_grant_to_target(struct c
  	 * We don't want to shrink below a single RPC, as that will negatively
  	 * impact block allocation and long-term performance.
  	 */
 -	if (target_bytes < cli->cl_max_pages_per_rpc << PAGE_CACHE_SHIFT)
 -		target_bytes = cli->cl_max_pages_per_rpc << PAGE_CACHE_SHIFT;
 +	if (target_bytes < cli->cl_max_pages_per_rpc << PAGE_SHIFT)
 +		target_bytes = cli->cl_max_pages_per_rpc << PAGE_SHIFT;
  
  	if (target_bytes >= cli->cl_avail_grant) {
- 		client_obd_list_unlock(&cli->cl_loi_list_lock);
+ 		spin_unlock(&cli->cl_loi_list_lock);
  		return 0;
  	}
- 	client_obd_list_unlock(&cli->cl_loi_list_lock);
+ 	spin_unlock(&cli->cl_loi_list_lock);
  
  	body = kzalloc(sizeof(*body), GFP_NOFS);
  	if (!body)
@@@ -1052,8 -1053,8 +1053,8 @@@ static void osc_init_grant(struct clien
  	}
  
  	/* determine the appropriate chunk size used by osc_extent. */
 -	cli->cl_chunkbits = max_t(int, PAGE_CACHE_SHIFT, ocd->ocd_blocksize);
 +	cli->cl_chunkbits = max_t(int, PAGE_SHIFT, ocd->ocd_blocksize);
- 	client_obd_list_unlock(&cli->cl_loi_list_lock);
+ 	spin_unlock(&cli->cl_loi_list_lock);
  
  	CDEBUG(D_CACHE, "%s, setting cl_avail_grant: %ld cl_lost_grant: %ld chunk bits: %d\n",
  	       cli->cl_import->imp_obd->obd_name,
@@@ -1992,8 -2006,8 +2006,8 @@@ int osc_build_rpc(const struct lu_env *
  	if (tmp)
  		tmp->oap_request = ptlrpc_request_addref(req);
  
- 	client_obd_list_lock(&cli->cl_loi_list_lock);
+ 	spin_lock(&cli->cl_loi_list_lock);
 -	starting_offset >>= PAGE_CACHE_SHIFT;
 +	starting_offset >>= PAGE_SHIFT;
  	if (cmd == OBD_BRW_READ) {
  		cli->cl_r_in_flight++;
  		lprocfs_oh_tally_log2(&cli->cl_read_page_hist, page_count);
@@@ -2787,15 -2779,15 +2779,15 @@@ out
  			goto skip_locking;
  
  		policy.l_extent.start = fm_key->fiemap.fm_start &
- 						CFS_PAGE_MASK;
+ 						PAGE_MASK;
  
  		if (OBD_OBJECT_EOF - fm_key->fiemap.fm_length <=
 -		    fm_key->fiemap.fm_start + PAGE_CACHE_SIZE - 1)
 +		    fm_key->fiemap.fm_start + PAGE_SIZE - 1)
  			policy.l_extent.end = OBD_OBJECT_EOF;
  		else
  			policy.l_extent.end = (fm_key->fiemap.fm_start +
  				fm_key->fiemap.fm_length +
- 				PAGE_SIZE - 1) & CFS_PAGE_MASK;
 -				PAGE_CACHE_SIZE - 1) & PAGE_MASK;
++				PAGE_SIZE - 1) & PAGE_MASK;
  
  		ostid_build_res_name(&fm_key->oa.o_oi, &res_id);
  		mode = ldlm_lock_match(exp->exp_obd->obd_namespace,
