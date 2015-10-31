From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Sun, 1 Nov 2015 10:53:27 +1100
Message-ID: <20151101105327.49bffef4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35487 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750964AbbJaXxc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 31 Oct 2015 19:53:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will.deacon@arm.com>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kernel/suspend.c

between commit:

  e13d918a19a7 ("arm64: kernel: fix tcr_el1.t0sz restore on systems with extended idmap")

from Linus' tree and commit:

  8e63d3887669 ("arm64: flush: use local TLB and I-cache invalidation")

from the arm64 tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/kernel/suspend.c
index 44ca4143b013,3c5e4e6dcf68..000000000000
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@@ -80,21 -80,17 +80,21 @@@ int cpu_suspend(unsigned long arg, int 
  	if (ret == 0) {
  		/*
  		 * We are resuming from reset with TTBR0_EL1 set to the
 -		 * idmap to enable the MMU; restore the active_mm mappings in
 -		 * TTBR0_EL1 unless the active_mm == &init_mm, in which case
 -		 * the thread entered cpu_suspend with TTBR0_EL1 set to
 -		 * reserved TTBR0 page tables and should be restored as such.
 +		 * idmap to enable the MMU; set the TTBR0 to the reserved
 +		 * page tables to prevent speculative TLB allocations, flush
 +		 * the local tlb and set the default tcr_el1.t0sz so that
 +		 * the TTBR0 address space set-up is properly restored.
 +		 * If the current active_mm != &init_mm we entered cpu_suspend
 +		 * with mappings in TTBR0 that must be restored, so we switch
 +		 * them back to complete the address space configuration
 +		 * restoration before returning.
  		 */
 -		if (mm == &init_mm)
 -			cpu_set_reserved_ttbr0();
 -		else
 -			cpu_switch_mm(mm->pgd, mm);
 -
 +		cpu_set_reserved_ttbr0();
- 		flush_tlb_all();
+ 		local_flush_tlb_all();
 +		cpu_set_default_tcr_t0sz();
 +
 +		if (mm != &init_mm)
 +			cpu_switch_mm(mm->pgd, mm);
  
  		/*
  		 * Restore per-cpu offset before any kernel
