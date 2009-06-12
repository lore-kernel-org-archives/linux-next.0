From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr-latest-cpumask tree with the arm
 tree
Date: Fri, 12 Jun 2009 18:14:56 +1000
Message-ID: <20090612181456.f9e61dc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59731 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932860AbZFLIO4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 04:14:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Russell King <rmk@arm.linux.org.uk>

Hi Rusty,

Today's linux-next merge of the rr-latest-cpumask tree got a conflict in
arch/arm/kernel/smp.c between commit
faa7bc51c11d5bbe440ac04710fd7a3208782000 ("Check whether the TLB
operations need broadcasting on SMP systems") from the arm tree and
commit a29a30f4777dc23679cd588912e0a93f5ab777b0
("cpumask:use-mm_cpumask-arm") from the rr-latest-cpumask tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/kernel/smp.c
index de885fd,9a36ed2..0000000
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@@ -642,21 -592,17 +642,21 @@@ void flush_tlb_all(void
  
  void flush_tlb_mm(struct mm_struct *mm)
  {
 -	on_each_cpu_mask(ipi_flush_tlb_mm, mm, 1, mm_cpumask(mm));
 +	if (tlb_ops_need_broadcast())
- 		on_each_cpu_mask(ipi_flush_tlb_mm, mm, 1, &mm->cpu_vm_mask);
++		on_each_cpu_mask(ipi_flush_tlb_mm, mm, 1, mm_cpumask(mm));
 +	else
 +		local_flush_tlb_mm(mm);
  }
  
  void flush_tlb_page(struct vm_area_struct *vma, unsigned long uaddr)
  {
 -	struct tlb_args ta;
 -
 -	ta.ta_vma = vma;
 -	ta.ta_start = uaddr;
 -
 -	on_each_cpu_mask(ipi_flush_tlb_page, &ta, 1, mm_cpumask(vma->vm_mm));
 +	if (tlb_ops_need_broadcast()) {
 +		struct tlb_args ta;
 +		ta.ta_vma = vma;
 +		ta.ta_start = uaddr;
- 		on_each_cpu_mask(ipi_flush_tlb_page, &ta, 1, &vma->vm_mm->cpu_vm_mask);
++		on_each_cpu_mask(ipi_flush_tlb_page, &ta, 1, mm_cpumask(vma->vm_mm));
 +	} else
 +		local_flush_tlb_page(vma, uaddr);
  }
  
  void flush_tlb_kernel_page(unsigned long kaddr)
@@@ -672,14 -617,13 +672,14 @@@
  void flush_tlb_range(struct vm_area_struct *vma,
                       unsigned long start, unsigned long end)
  {
 -	struct tlb_args ta;
 -
 -	ta.ta_vma = vma;
 -	ta.ta_start = start;
 -	ta.ta_end = end;
 -
 -	on_each_cpu_mask(ipi_flush_tlb_range, &ta, 1, mm_cpumask(vma->vm_mm));
 +	if (tlb_ops_need_broadcast()) {
 +		struct tlb_args ta;
 +		ta.ta_vma = vma;
 +		ta.ta_start = start;
 +		ta.ta_end = end;
- 		on_each_cpu_mask(ipi_flush_tlb_range, &ta, 1, &vma->vm_mm->cpu_vm_mask);
++		on_each_cpu_mask(ipi_flush_tlb_range, &ta, 1, mm_cpumask(vma->vm_mm));
 +	} else
 +		local_flush_tlb_range(vma, start, end);
  }
  
  void flush_tlb_kernel_range(unsigned long start, unsigned long end)
