From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arc tree
Date: Mon, 2 Nov 2015 02:30:03 +1100
Message-ID: <20151102023003.4495b39a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49282 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751123AbbKAPaH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 10:30:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arc/mm/cache.c

between commit:

  336e2136e135 ("ARC: mm: preps ahead of HIGHMEM support")

from the arc tree and commit:

  c386768017da ("mm: differentiate page_mapped() from page_mapcount() for compound pages")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arc/mm/cache.c
index ff7ff6cbb811,875ac2e918c5..000000000000
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@@ -617,10 -582,10 +617,10 @@@ void flush_dcache_page(struct page *pag
  	 */
  	if (!mapping_mapped(mapping)) {
  		clear_bit(PG_dc_clean, &page->flags);
- 	} else if (page_mapped(page)) {
+ 	} else if (page_mapcount(page)) {
  
  		/* kernel reading from page with U-mapping */
 -		unsigned long paddr = (unsigned long)page_address(page);
 +		phys_addr_t paddr = (unsigned long)page_address(page);
  		unsigned long vaddr = page->index << PAGE_CACHE_SHIFT;
  
  		if (addr_not_cache_congruent(paddr, vaddr))
@@@ -853,12 -818,9 +853,12 @@@ void copy_user_highpage(struct page *to
  	 *
  	 * Note that while @u_vaddr refers to DST page's userspace vaddr, it is
  	 * equally valid for SRC page as well
 +	 *
 +	 * For !VIPT cache, all of this gets compiled out as
 +	 * addr_not_cache_congruent() is 0
  	 */
- 	if (page_mapped(from) && addr_not_cache_congruent(kfrom, u_vaddr)) {
+ 	if (page_mapcount(from) && addr_not_cache_congruent(kfrom, u_vaddr)) {
 -		__flush_dcache_page(kfrom, u_vaddr);
 +		__flush_dcache_page((unsigned long)kfrom, u_vaddr);
  		clean_src_k_mappings = 1;
  	}
  
