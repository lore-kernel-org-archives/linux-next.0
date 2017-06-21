From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the file-locks tree
Date: Wed, 21 Jun 2017 12:48:42 +1000
Message-ID: <20170621124842.48adbc08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753012AbdFUCsp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 22:48:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Goldwyn Rodrigues <rgoldwyn@suse.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  mm/filemap.c

between commit:

  0771875ac195 ("mm: don't TestClearPageError in __filemap_fdatawait_range")

from the file-locks tree and commit:

  7fc9e4722435 ("fs: Introduce filemap_range_has_page()")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc mm/filemap.c
index d10017cc00de,742034e56100..000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -386,7 -376,39 +386,39 @@@ int filemap_flush(struct address_space 
  }
  EXPORT_SYMBOL(filemap_flush);
  
+ /**
+  * filemap_range_has_page - check if a page exists in range.
+  * @mapping:           address space within which to check
+  * @start_byte:        offset in bytes where the range starts
+  * @end_byte:          offset in bytes where the range ends (inclusive)
+  *
+  * Find at least one page in the range supplied, usually used to check if
+  * direct writing in this range will trigger a writeback.
+  */
+ bool filemap_range_has_page(struct address_space *mapping,
+ 			   loff_t start_byte, loff_t end_byte)
+ {
+ 	pgoff_t index = start_byte >> PAGE_SHIFT;
+ 	pgoff_t end = end_byte >> PAGE_SHIFT;
+ 	struct pagevec pvec;
+ 	bool ret;
+ 
+ 	if (end_byte < start_byte)
+ 		return false;
+ 
+ 	if (mapping->nrpages == 0)
+ 		return false;
+ 
+ 	pagevec_init(&pvec, 0);
+ 	if (!pagevec_lookup(&pvec, mapping, index, 1))
+ 		return false;
+ 	ret = (pvec.pages[0]->index <= end);
+ 	pagevec_release(&pvec);
+ 	return ret;
+ }
+ EXPORT_SYMBOL(filemap_range_has_page);
+ 
 -static int __filemap_fdatawait_range(struct address_space *mapping,
 +static void __filemap_fdatawait_range(struct address_space *mapping,
  				     loff_t start_byte, loff_t end_byte)
  {
  	pgoff_t index = start_byte >> PAGE_SHIFT;
