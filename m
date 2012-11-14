From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Wed, 14 Nov 2012 14:18:47 -0800
Message-ID: <20121114141847.fab752c2.akpm@linux-foundation.org>
References: <20121109150957.4f274fa7b3a75c9baaa1b7ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38210 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933155Ab2KNWSt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Nov 2012 17:18:49 -0500
In-Reply-To: <20121109150957.4f274fa7b3a75c9baaa1b7ff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michel Lespinasse <walken@google.com>, Rik van Riel <riel@redhat.com>, David Miller <davem@davemloft.net>

On Fri, 9 Nov 2012 15:09:57 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> arch/sparc/kernel/sys_sparc_64.c: In function 'arch_get_unmapped_area':
> arch/sparc/kernel/sys_sparc_64.c:92:16: error: unused variable 'start_addr' [-Werror=unused-variable]
> arch/sparc/kernel/sys_sparc_64.c: In function 'arch_get_unmapped_area_topdown':
> arch/sparc/kernel/sys_sparc_64.c:194:20: error: 'do_colour_align' undeclared (first use in this function)

s/colour/color/

> arch/sparc/kernel/sys_sparc_64.c:194:20: note: each undeclared identifier is reported only once for each function it appears in
> arch/sparc/kernel/sys_sparc_64.c:194:51: error: 'shm_align_mask' undeclared (first use in this function)

This one has me puzzled.  I *think* we should be using

info.align_mask = do_colour_align ? (PAGE_MASK & SHMLBA) : 0;
info.align_offset = (pgoff << PAGE_SHIFT) & (SHMLBA-1);

or similar.   It needs more work.
		
> Caused by commit "mm: use vm_unmapped_area() on sparc64 architecture".  I
> have reverted that commit for today (and the following fix patch).
> 
> arch/sparc/mm/hugetlbpage.c: In function 'hugetlb_get_unmapped_area_topdown':
> arch/sparc/mm/hugetlbpage.c:63:25: error: unused variable 'vma' [-Werror=unused-variable]
> 
> Caused by commit "mm: use vm_unmapped_area() in hugetlbfs on sparc64
> architecture".  I have reverted that commit for today.

I'll drop

mm-use-vm_unmapped_area-on-sparc64-architecture.patch
mm-use-vm_unmapped_area-on-sparc64-architecture-fix.patch
mm-use-vm_unmapped_area-in-hugetlbfs-on-sparc64-architecture.patch
