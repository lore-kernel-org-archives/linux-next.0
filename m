From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the vfs tree
Date: Mon, 3 Jul 2017 16:41:43 +1000
Message-ID: <20170703164143.6376f166@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58577 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752285AbdGCGlr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Jul 2017 02:41:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Dan,

Today's linux-next merge of the nvdimm tree got conflicts in:

  include/linux/uio.h
  lib/iov_iter.c

between commit:

  aa28de275a24 ("iov_iter/hardening: move object size checks to inlined part")

from the vfs tree and commit:

  0aed55af8834 ("x86, uaccess: introduce copy_from_iter_flushcache for pmem / cache-bypass operations")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/uio.h
index 243e2362fe1a,55cd54a0e941..000000000000
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@@ -92,58 -91,26 +92,74 @@@ size_t copy_page_to_iter(struct page *p
  			 struct iov_iter *i);
  size_t copy_page_from_iter(struct page *page, size_t offset, size_t bytes,
  			 struct iov_iter *i);
 -size_t copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i);
 -size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i);
 -bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i);
 -size_t copy_from_iter_nocache(void *addr, size_t bytes, struct iov_iter *i);
 +
 +size_t _copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i);
 +size_t _copy_from_iter(void *addr, size_t bytes, struct iov_iter *i);
 +bool _copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i);
 +size_t _copy_from_iter_nocache(void *addr, size_t bytes, struct iov_iter *i);
 +bool _copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i);
 +
 +static __always_inline __must_check
 +size_t copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
 +{
 +	if (unlikely(!check_copy_size(addr, bytes, true)))
 +		return bytes;
 +	else
 +		return _copy_to_iter(addr, bytes, i);
 +}
 +
 +static __always_inline __must_check
 +size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
 +{
 +	if (unlikely(!check_copy_size(addr, bytes, false)))
 +		return bytes;
 +	else
 +		return _copy_from_iter(addr, bytes, i);
 +}
 +
 +static __always_inline __must_check
 +bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
 +{
 +	if (unlikely(!check_copy_size(addr, bytes, false)))
 +		return false;
 +	else
 +		return _copy_from_iter_full(addr, bytes, i);
 +}
 +
 +static __always_inline __must_check
 +size_t copy_from_iter_nocache(void *addr, size_t bytes, struct iov_iter *i)
 +{
 +	if (unlikely(!check_copy_size(addr, bytes, false)))
 +		return bytes;
 +	else
 +		return _copy_from_iter_nocache(addr, bytes, i);
 +}
 +
 +static __always_inline __must_check
 +bool copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
 +{
 +	if (unlikely(!check_copy_size(addr, bytes, false)))
 +		return false;
 +	else
 +		return _copy_from_iter_full_nocache(addr, bytes, i);
 +}
 +
+ #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
+ /*
+  * Note, users like pmem that depend on the stricter semantics of
+  * copy_from_iter_flushcache() than copy_from_iter_nocache() must check for
+  * IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) before assuming that the
+  * destination is flushed from the cache on return.
+  */
+ size_t copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i);
+ #else
+ static inline size_t copy_from_iter_flushcache(void *addr, size_t bytes,
+ 				       struct iov_iter *i)
+ {
+ 	return copy_from_iter_nocache(addr, bytes, i);
+ }
+ #endif
 -bool copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i);
++
  size_t iov_iter_zero(size_t bytes, struct iov_iter *);
  unsigned long iov_iter_alignment(const struct iov_iter *i);
  unsigned long iov_iter_gap_alignment(const struct iov_iter *i);
diff --cc lib/iov_iter.c
index d48f0976b8b4,c9a69064462f..000000000000
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@@ -639,9 -613,31 +639,31 @@@ size_t _copy_from_iter_nocache(void *ad
  
  	return bytes;
  }
 -EXPORT_SYMBOL(copy_from_iter_nocache);
 +EXPORT_SYMBOL(_copy_from_iter_nocache);
  
+ #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
+ size_t copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i)
+ {
+ 	char *to = addr;
+ 	if (unlikely(i->type & ITER_PIPE)) {
+ 		WARN_ON(1);
+ 		return 0;
+ 	}
+ 	iterate_and_advance(i, bytes, v,
+ 		__copy_from_user_flushcache((to += v.iov_len) - v.iov_len,
+ 					 v.iov_base, v.iov_len),
+ 		memcpy_page_flushcache((to += v.bv_len) - v.bv_len, v.bv_page,
+ 				 v.bv_offset, v.bv_len),
+ 		memcpy_flushcache((to += v.iov_len) - v.iov_len, v.iov_base,
+ 			v.iov_len)
+ 	)
+ 
+ 	return bytes;
+ }
+ EXPORT_SYMBOL_GPL(copy_from_iter_flushcache);
+ #endif
+ 
 -bool copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
 +bool _copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
  {
  	char *to = addr;
  	if (unlikely(i->type & ITER_PIPE)) {
