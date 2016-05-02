From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 2 May 2016 10:38:19 +1000
Message-ID: <20160502103819.70781fa2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56151 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752151AbcEBAiX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 May 2016 20:38:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/cifs/file.c

between commit:

  09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")

from Linus' tree and commits:

  71335664c38f ("cifs: don't bother with kmap on read_pages side")
  7d2dbb9faf05 ("fixups for PAGE_CACHE_SIZE/page_cache_release-induced conflicts")

from the vfs tree.

I fixed it up (the vfs tree patches repeated the relevant parts of
the patch in Linus' tree, so I just used the vfs tree version) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/cifs/file.c
index 489ddc797105,e013d64998d4..000000000000
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@@ -3311,16 -3302,12 +3302,12 @@@ cifs_readpages_read_into_pages(struct T
  	cifs_dbg(FYI, "eof=%llu eof_index=%lu\n", eof, eof_index);
  
  	rdata->got_bytes = 0;
 -	rdata->tailsz = PAGE_CACHE_SIZE;
 +	rdata->tailsz = PAGE_SIZE;
  	for (i = 0; i < nr_pages; i++) {
  		struct page *page = rdata->pages[i];
+ 		size_t n = PAGE_SIZE;
  
  		if (len >= PAGE_SIZE) {
- 			/* enough data to fill the page */
- 			iov.iov_base = kmap(page);
- 			iov.iov_len = PAGE_SIZE;
- 			cifs_dbg(FYI, "%u: idx=%lu iov_base=%p iov_len=%zu\n",
- 				 i, page->index, iov.iov_base, iov.iov_len);
  			len -= PAGE_SIZE;
  		} else if (len > 0) {
  			/* enough for partial page, fill and zero the rest */
