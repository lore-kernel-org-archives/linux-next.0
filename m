From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mmc tree
Date: Thu, 2 Nov 2017 12:36:17 +1100
Message-ID: <20171102123617.56364a21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44649 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933083AbdKBBgT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 21:36:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>

Hi Ulf,

After merging the mmc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/irqflags.h:14:0,
                 from arch/arm/include/asm/bitops.h:27,
                 from include/linux/bitops.h:37,
                 from include/linux/kernel.h:10,
                 from include/asm-generic/bug.h:15,
                 from arch/arm/include/asm/bug.h:59,
                 from include/linux/bug.h:4,
                 from include/linux/thread_info.h:11,
                 from include/asm-generic/current.h:4,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:11,
                 from include/linux/blkdev.h:4,
                 from drivers/mmc/host/dw_mmc.c:14:
drivers/mmc/host/dw_mmc.c: In function 'dw_mci_set_drto':
include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast
  (void)(&__dummy == &__dummy2); \
                  ^
include/linux/spinlock.h:221:3: note: in expansion of macro 'typecheck'
   typecheck(unsigned long, flags); \
   ^
include/linux/spinlock.h:346:2: note: in expansion of macro 'raw_spin_lock_irqsave'
  raw_spin_lock_irqsave(spinlock_check(lock), flags); \
  ^
drivers/mmc/host/dw_mmc.c:1953:2: note: in expansion of macro 'spin_lock_irqsave'
  spin_lock_irqsave(&host->irq_lock, irqflags);
  ^

Introduced by commit

  80a2a5a7745b ("mmc: dw_mmc: Cleanup the DTO timer like the CTO one")

-- 
Cheers,
Stephen Rothwell
