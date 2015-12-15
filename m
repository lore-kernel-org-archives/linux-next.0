From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 15 Dec 2015 20:55:42 +1100
Message-ID: <20151215205542.66475b63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56288 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933146AbbLOJzo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Dec 2015 04:55:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

mm/huge_memory.c: In function 'madvise_free_huge_pmd':
mm/huge_memory.c:1592:14: error: implicit declaration of function 'pmd_mkclean' [-Werror=implicit-function-declaration]
   orig_pmd = pmd_mkclean(orig_pmd);
              ^

Caused by me screwing up the merge resolution :-(

So I readded the definition of pmd_mkclean to
arch/powerpc/include/asm/book3s/64/pgtable.h

BTW, patch "arch/powerpc/include/asm/pgtable-ppc64.h: add
pmd_[dirty|mkclean] for THP" adds a second identical definition of
pmd_dirty() ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
