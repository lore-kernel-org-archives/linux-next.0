From: Michel Lespinasse <walken@google.com>
Subject: Re: [next:akpm 157/313] arch/tile/mm/hugetlbpage.c:256:20: error:
 'mm' undeclared
Date: Thu, 8 Nov 2012 22:22:49 -0800
Message-ID: <20121109062249.GB7022@google.com>
References: <509c99fa.8Yp/oQzMiknhbdrT%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:58889 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771Ab2KIGWw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Nov 2012 01:22:52 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so2550059pad.19
        for <linux-next@vger.kernel.org>; Thu, 08 Nov 2012 22:22:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <509c99fa.8Yp/oQzMiknhbdrT%fengguang.wu@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 09, 2012 at 01:51:54PM +0800, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   6703d59701f7592c897b975de3952ba6bbb98b83
> commit: 921a29df6a2bab7c1bfbb11eb5648b92bdc250e8 [157/313] mm: use vm_unmapped_area() in hugetlbfs on tile architecture
> config: make ARCH=tile tilegx_defconfig
> 
> All error/warnings:
> 
> arch/tile/mm/hugetlbpage.c: In function 'hugetlb_get_unmapped_area_topdown':
> arch/tile/mm/hugetlbpage.c:256:20: error: 'mm' undeclared (first use in this function)
> arch/tile/mm/hugetlbpage.c:256:20: note: each undeclared identifier is reported only once for each function it appears in

commit 86234092170b43771c3f6257cb320ff6e2c10c52
Author: Michel Lespinasse <walken@google.com>
Date:   Thu Nov 8 22:13:58 2012 -0800

    fix mm: use vm_unmapped_area() in hugetlbfs on tile architecture

diff --git a/arch/tile/mm/hugetlbpage.c b/arch/tile/mm/hugetlbpage.c
index 6f74cce053e1..650ccff8378c 100644
--- a/arch/tile/mm/hugetlbpage.c
+++ b/arch/tile/mm/hugetlbpage.c
@@ -253,7 +253,7 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = mm->mmap_base;
+	info.high_limit = current->mm->mmap_base;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
