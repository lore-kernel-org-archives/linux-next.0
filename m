From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 15 Dec 2017 13:48:37 +1100
Message-ID: <20171215134837.671ea215@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754682AbdLOCsk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Dec 2017 21:48:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yang Shi <yang.s@alibaba-inc.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

mm/khugepaged.c: In function 'khugepaged':
mm/khugepaged.c:1757:31: warning: 'vma' may be used uninitialized in this function [-Wmaybe-uninitialized]
  if (khugepaged_test_exit(mm) || !vma) {
                               ^
mm/khugepaged.c:1659:25: note: 'vma' was declared here
  struct vm_area_struct *vma;
                         ^

Introduced by commit

  0951b59acf3a ("mm: thp: use down_read_trylock() in khugepaged to avoid long block")

-- 
Cheers,
Stephen Rothwell
