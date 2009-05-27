From: Michal Simek <michal.simek@petalogix.com>
Subject: Microblaze merge
Date: Wed, 27 May 2009 09:22:36 +0200
Message-ID: <4A1CEA3C.1050904@petalogix.com>
Reply-To: michal.simek@petalogix.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f168.google.com ([209.85.220.168]:63209 "EHLO
	mail-fx0-f168.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761902AbZE0HWj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 03:22:39 -0400
Received: by fxm12 with SMTP id 12so2604209fxm.37
        for <linux-next@vger.kernel.org>; Wed, 27 May 2009 00:22:39 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, John Williams <john.williams@petalogix.com>, linux-next@vger.kernel.org

Hi Stephen,

Can you please merge my next branch to linux-next?

Thanks,
Michal

The following changes since commit 5805977e63a36ad56594a623f3bd2bebcb7db233:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../jbarnes/drm-2.6

are available in the git repository at:

  git://git.monstr.eu/linux-2.6-microblaze.git next

Arnd Bergmann (10):
      microblaze: export some symbols
      microblaze: fix __user annotations
      microblaze: kill incorrect __bad_xchg definition
      microblaze: remove cacheable_memcpy
      microblaze: add security initcalls
      microblaze: add a dummy pgprot_noncached
      microblaze: do not include types.h in ptrace.h
      microblaze: remove bad_user_access_length
      microblaze: clean up checksum.c
      microblaze: use generic dma-mapping-broken.h

Edgar E. Iglesias (1):
      microblaze: Add audit and seccomp thread flags.

Michal Simek (38):
      microblaze: Remove POWERPC reference from Microblaze gpio.h
      microblaze: Kconfig: Enable drivers for Microblaze
      microblaze: prepare signal handling for generic unistd.h
      microblaze: Fix early cmdline for CMDLINE_FORCE
      microblaze: Cleanup compiled-in rootfs in BSS section
      Microblaze: Remove unused variable from paging init
      microblaze: Fix cast warning for __va in prom.c
      microblaze: Kbuild update
      microblaze: Fix size of __kernel_mode_t to short
      microblaze_mmu_v2: Add mmu_defconfig
      microblaze_mmu_v2: MMU update for startup code
      microblaze_mmu_v2: Alocate TLB for early console
      microblaze_mmu_v2: TLB low level code
      microblaze_mmu_v2: MMU initialization
      microblaze_mmu_v2: mmu.h update
      microblaze_mmu_v2: Page fault handling high level - fault.c
      microblaze_mmu_v2: Context handling - mmu_context.c/h
      microblaze_mmu_v2: Page table - ioremap - pgtable.c/h, section update
      microblaze_mmu_v2: io.h MMU update
      microblaze_mmu_v2: pgalloc.h and page.h
      microblaze_mmu_v2: Update process creation for MMU
      microblaze_mmu_v2: Update tlb.h and tlbflush.h
      microblaze_mmu_v2: MMU asm offset update
      microblaze_mmu_v2: Add CURRENT_TASK for entry.S
      microblaze_mmu_v2: entry.S, entry.h
      microblaze_mmu_v2: Update exception handling - MMU exception
      microblaze_mmu_v2: uaccess MMU update
      microblaze_mmu_v2: Add MMU related exceptions handling
      microblaze_mmu_v2: Update linker script for MMU
      microblaze_mmu_v2: Enable fork syscall for MMU and add fork as
vfork for noMMU
      microblaze_mmu_v2: Traps MMU update
      microblaze_mmu_v2: Update signal returning address
      microblaze_mmu_v2: Update cacheflush.h
      microblaze_mmu_v2: Update dma.h for MMU
      microblaze_mmu_v2: Elf update
      microblaze_mmu_v2: stat.h MMU update
      microblaze_mmu_v2: Kconfig update
      microblaze_mmu_v2: Makefiles

Steve Magnani (2):
      microblaze: Fix paging init-zone initialization
      microblaze: Guard __HAVE_ARCH macros with __KERNEL__ in string.h

Thomas Chou (1):
      microblaze: clean LDFLAGS to build kernel

 arch/microblaze/Kconfig                       |  121 +++-
 arch/microblaze/Makefile                      |    6 +
 arch/microblaze/boot/Makefile                 |    2 +
 arch/microblaze/configs/mmu_defconfig         |  798 ++++++++++++++++++
 arch/microblaze/include/asm/Kbuild            |   25 +-
 arch/microblaze/include/asm/cacheflush.h      |   20 +-
 arch/microblaze/include/asm/checksum.h        |   14 +-
 arch/microblaze/include/asm/current.h         |    8 +
 arch/microblaze/include/asm/dma-mapping.h     |  130 +---
 arch/microblaze/include/asm/dma.h             |    5 +
 arch/microblaze/include/asm/elf.h             |   93 ++
 arch/microblaze/include/asm/entry.h           |   37 +-
 arch/microblaze/include/asm/exceptions.h      |   24 +-
 arch/microblaze/include/asm/gpio.h            |    6 +-
 arch/microblaze/include/asm/io.h              |   31 +
 arch/microblaze/include/asm/mmu.h             |  104 +++-
 arch/microblaze/include/asm/mmu_context.h     |   26 +-
 arch/microblaze/include/asm/mmu_context_mm.h  |  140 +++
 arch/microblaze/include/asm/mmu_context_no.h  |   23 +
 arch/microblaze/include/asm/page.h            |  166 +++-
 arch/microblaze/include/asm/pgalloc.h         |  191 +++++
 arch/microblaze/include/asm/pgtable.h         |  538 ++++++++++++
 arch/microblaze/include/asm/posix_types.h     |    2 +-
 arch/microblaze/include/asm/processor.h       |   95 ++-
 arch/microblaze/include/asm/ptrace.h          |    1 -
 arch/microblaze/include/asm/registers.h       |   21 +-
 arch/microblaze/include/asm/sections.h        |    3 +
 arch/microblaze/include/asm/segment.h         |   20 +-
 arch/microblaze/include/asm/setup.h           |   10 +-
 arch/microblaze/include/asm/stat.h            |   77 +-
 arch/microblaze/include/asm/string.h          |    2 +-
 arch/microblaze/include/asm/syscalls.h        |    3 +
 arch/microblaze/include/asm/thread_info.h     |   20 +
 arch/microblaze/include/asm/tlb.h             |    8 +
 arch/microblaze/include/asm/tlbflush.h        |   48 ++
 arch/microblaze/include/asm/uaccess.h         |  305 ++++++--
 arch/microblaze/kernel/Makefile               |    1 +
 arch/microblaze/kernel/asm-offsets.c          |   21 +-
 arch/microblaze/kernel/early_printk.c         |    3 +
 arch/microblaze/kernel/entry-nommu.S          |    2 +-
 arch/microblaze/kernel/entry.S                | 1116
+++++++++++++++++++++++++
 arch/microblaze/kernel/exceptions.c           |   45 +-
 arch/microblaze/kernel/head.S                 |  190 +++++
 arch/microblaze/kernel/hw_exception_handler.S |  746 ++++++++++++++++-
 arch/microblaze/kernel/microblaze_ksyms.c     |    2 +
 arch/microblaze/kernel/misc.S                 |  120 +++
 arch/microblaze/kernel/process.c              |   59 ++
 arch/microblaze/kernel/prom.c                 |    7 +-
 arch/microblaze/kernel/setup.c                |   62 +-
 arch/microblaze/kernel/signal.c               |  109 +--
 arch/microblaze/kernel/syscall_table.S        |    6 +-
 arch/microblaze/kernel/traps.c                |   42 +-
 arch/microblaze/kernel/vmlinux.lds.S          |    5 +-
 arch/microblaze/lib/Makefile                  |    3 +-
 arch/microblaze/lib/checksum.c                |   31 +-
 arch/microblaze/lib/memcpy.c                  |    5 -
 arch/microblaze/lib/uaccess_old.S             |  135 +++
 arch/microblaze/mm/Makefile                   |    2 +
 arch/microblaze/mm/fault.c                    |  304 +++++++
 arch/microblaze/mm/init.c                     |  169 ++++-
 arch/microblaze/mm/mmu_context.c              |   70 ++
 arch/microblaze/mm/pgtable.c                  |  286 +++++++
 drivers/block/Kconfig                         |    2 +-
 drivers/char/Kconfig                          |    2 +-
 drivers/gpio/Kconfig                          |    2 +-
 drivers/input/serio/Kconfig                   |    2 +-
 drivers/of/Kconfig                            |    8 +-
 drivers/spi/Kconfig                           |    2 +-
 drivers/usb/Kconfig                           |    1 +
 drivers/video/Kconfig                         |    2 +-
 70 files changed, 6128 insertions(+), 557 deletions(-)
 create mode 100644 arch/microblaze/configs/mmu_defconfig
 create mode 100644 arch/microblaze/include/asm/mmu_context_mm.h
 create mode 100644 arch/microblaze/include/asm/mmu_context_no.h
 create mode 100644 arch/microblaze/kernel/entry.S
 create mode 100644 arch/microblaze/kernel/misc.S
 create mode 100644 arch/microblaze/lib/uaccess_old.S
 create mode 100644 arch/microblaze/mm/fault.c
 create mode 100644 arch/microblaze/mm/mmu_context.c
 create mode 100644 arch/microblaze/mm/pgtable.c

-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
