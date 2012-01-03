From: Catalin Marinas <catalin.marinas@arm.com>
Subject: ARM context switch changes for -next
Date: Tue, 3 Jan 2012 18:14:18 +0000
Message-ID: <20120103181418.GH22876@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:41166 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754457Ab2ACSPI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 13:15:08 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org

Hi Stephen,

Could you please pull the branch below into -next? I'd like to give it a
few weeks of exposure before sending an official pull request to
Russell. One of the patches introduces a scheduler hook and Peter Z
agreed with it. You may get a conflict in -next since some scheduler
files have been renamed.

Thanks.


The following changes since commit 384703b8e6cd4c8ef08512e596024e028c91c339:

  Linux 3.2-rc6 (2011-12-16 18:36:26 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/linux.git intr-ctxsw

Catalin Marinas (4):
      sched: Introduce the finish_arch_post_lock_switch() scheduler hook
      ARM: Remove __ARCH_WANT_INTERRUPTS_ON_CTXSW on ASID-capable CPUs
      ARM: Remove current_mm per-cpu variable
      ARM: Remove __ARCH_WANT_INTERRUPTS_ON_CTXSW on pre-ARMv6 CPUs

Will Deacon (2):
      ARM: Use TTBR1 instead of reserved context ID
      ARM: Allow ASID 0 to be allocated to tasks

 arch/arm/include/asm/mmu_context.h |  104 +++++++++++++++++++++++++++---------
 arch/arm/include/asm/system.h      |    7 ---
 arch/arm/include/asm/thread_info.h |    1 +
 arch/arm/mm/context.c              |   40 ++++++--------
 arch/arm/mm/proc-v7.S              |    9 +---
 kernel/sched.c                     |    4 ++
 6 files changed, 104 insertions(+), 61 deletions(-)

-- 
Catalin
