From: Steve Capper <steve.capper@linaro.org>
Subject: ARM64 HugePages for linux-next
Date: Fri, 14 Jun 2013 12:29:09 +0100
Message-ID: <20130614112908.GA4660@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:54688 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752290Ab3FNL3c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Jun 2013 07:29:32 -0400
Received: by mail-wg0-f51.google.com with SMTP id e11so386475wgh.6
        for <linux-next@vger.kernel.org>; Fri, 14 Jun 2013 04:29:30 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org

Hello,
I've been working on a patch set to add huge page support to ARM64, this
includes some changes to mm and x86. I've been advised by Andrew Morton to get
these into linux-next asap:
http://marc.info/?l=linux-mm&m=137115843813005&w=2

Would it please be possible to have the patches from the git repo below pulled
directly into linux-next?

(I've just merged them against linux-next/master and they build and run fine
for me in an ARM64 Fast Model).

Thanks,
-- 
Steve

--->8

The following changes since commit d683b96b072dc4680fc74964eca77e6a23d1fa6e:

  Linux 3.10-rc4 (2013-06-02 17:11:17 +0900)

are available in the git repository at:

  git://git.linaro.org/people/stevecapper/linux.git for-next/hugepages

for you to fetch changes up to af07484863e0c20796081e57093886c22dc16705:

  ARM64: mm: THP support. (2013-06-14 09:52:41 +0100)

----------------------------------------------------------------
Steve Capper (11):
      mm: hugetlb: Copy huge_pmd_share from x86 to mm.
      x86: mm: Remove x86 version of huge_pmd_share.
      mm: hugetlb: Copy general hugetlb code from x86 to mm.
      x86: mm: Remove general hugetlb code from x86.
      mm: thp: Correct the HPAGE_PMD_ORDER check.
      ARM64: mm: Restore memblock limit when map_mem finished.
      ARM64: mm: Make PAGE_NONE pages read only and no-execute.
      ARM64: mm: Move PTE_PROT_NONE bit.
      ARM64: mm: HugeTLB support.
      ARM64: mm: Raise MAX_ORDER for 64KB pages and THP.
      ARM64: mm: THP support.

 arch/arm64/Kconfig                     |  17 +++
 arch/arm64/include/asm/hugetlb.h       | 117 ++++++++++++++++++
 arch/arm64/include/asm/pgtable-hwdef.h |  12 ++
 arch/arm64/include/asm/pgtable.h       |  96 ++++++++++++---
 arch/arm64/include/asm/tlb.h           |   6 +
 arch/arm64/include/asm/tlbflush.h      |   2 +
 arch/arm64/mm/Makefile                 |   1 +
 arch/arm64/mm/fault.c                  |  19 +--
 arch/arm64/mm/hugetlbpage.c            |  70 +++++++++++
 arch/arm64/mm/mmu.c                    |  19 ++-
 arch/x86/Kconfig                       |   6 +
 arch/x86/mm/hugetlbpage.c              | 187 ----------------------------
 include/linux/huge_mm.h                |   2 +-
 include/linux/hugetlb.h                |   4 +
 mm/hugetlb.c                           | 219 +++++++++++++++++++++++++++++++--
 15 files changed, 543 insertions(+), 234 deletions(-)
 create mode 100644 arch/arm64/include/asm/hugetlb.h
 create mode 100644 arch/arm64/mm/hugetlbpage.c
