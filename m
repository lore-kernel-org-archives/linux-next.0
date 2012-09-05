From: Catalin Marinas <catalin.marinas@arm.com>
Subject: arm64 branch for linux-next
Date: Wed, 5 Sep 2012 18:17:43 +0100
Message-ID: <20120905171743.GD19435@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:48488 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753837Ab2IERSV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Sep 2012 13:18:21 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

Could you please pull the arm64 kernel into linux-next? The details are
below (I removed the diffstat).

Thanks,

Catalin


The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:

  Linux 3.6-rc4 (2012-09-01 10:39:58 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/linux-aarch64.git upstream

for you to fetch changes up to 5cc3bb3a288d66e92d885295b7058908f3429ce9:

  fs: Build sys_stat64() and friends if __ARCH_WANT_COMPAT_STAT64 (2012-09-05 16:39:08 +0100)

----------------------------------------------------------------
Catalin Marinas (24):
      arm64: Assembly macros and definitions
      arm64: Kernel booting and initialisation
      arm64: Exception handling
      arm64: MMU definitions
      arm64: MMU initialisation
      arm64: MMU fault handling and page table management
      arm64: Process management
      arm64: CPU support
      arm64: Cache maintenance routines
      arm64: TLB maintenance functionality
      arm64: Atomic operations
      arm64: Device specific operations
      arm64: DMA mapping API
      arm64: SMP support
      arm64: ELF definitions
      arm64: System calls handling
      arm64: Signal handling support
      arm64: User access library functions
      arm64: Floating point and SIMD
      arm64: Add support for /proc/sys/debug/exception-trace
      arm64: Miscellaneous header files
      arm64: Build infrastructure
      arm64: MAINTAINERS update
      fs: Build sys_stat64() and friends if __ARCH_WANT_COMPAT_STAT64

Marc Zyngier (3):
      arm64: IRQ handling
      arm64: Miscellaneous library functions
      arm64: Generic timers support

Will Deacon (5):
      arm64: VDSO support
      arm64: 32-bit (compat) applications support
      arm64: Debugging support
      arm64: Performance counters support
      arm64: Loadable modules
