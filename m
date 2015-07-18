From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Jul 17
Date: Sat, 18 Jul 2015 15:41:51 -0400
Message-ID: <20150718194148.GA5888@windriver.com>
References: <20150717152606.08ba1c82@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:35829 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbbGRTn5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jul 2015 15:43:57 -0400
Content-Disposition: inline
In-Reply-To: <20150717152606.08ba1c82@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

I noticed there are a bunch of new (appeared in the last day or two)
fails spread around, so I did a triage/bisect of them so we have a
better idea of what is going on as we start the week.

Unfortunately I was unable to reproduce the sparc fail, so I don't know
what is going on there....

Biggest culprits are some clk.h reorg fallout, more mlock syscall
fallout, and a sound driver breaking on arch w/o any gpio.

Paul.

-------------------------8<------------------------------------


arm-allnoconfig, efm32_defconfig:
=================================
 http://kisskb.ellerman.id.au/kisskb/buildresult/12465252/
 http://kisskb.ellerman.id.au/kisskb/buildresult/12465411/

io.c:(.text+0x166c): undefined reference to `arch_virt_to_idmap'

failure introduced:
  23641095c3a48d166d21f061424dafaa1640a11f is the first bad commit
  commit 23641095c3a48d166d21f061424dafaa1640a11f
  Author: Vitaly Andrianov <vitalya@ti.com>
  Date:   Mon Jul 6 16:43:18 2015 +0100

    ARM: 8400/1: mm: Introduce virt_to_idmap() with an arch hook" for details

fix: http://www.gossamer-threads.com/lists/linux/kernel/2218247
     hopefully merged soon?


linux-next/s3c2410_defconfig/arm
================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465308/

drivers/clk/samsung/clk-s3c2410-dclk.c:99:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/clk/samsung/clk-s3c2410-dclk.c:192:15: error: 'POST_RATE_CHANGE' undeclared (first use in this function)

failure introduced:
41608067f4b3912d03eeb2ad4f9db8cbe4d969ca is the first bad commit
commit 41608067f4b3912d03eeb2ad4f9db8cbe4d969ca
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Fri Jun 19 15:00:46 2015 -0700

    clk: samsung: Properly include clk.h and clkdev.h

bisected, reported to author, cc'd linux-next


linux-next/s3c6400_defconfig/arm
================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465388/

drivers/clk/samsung/clk-s3c64xx.c:141:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]

--assuming also caused by that problem in s3c2410 above.


linux-next/spear3xx_defconfig/arm
=================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465390/

drivers/clk/spear/spear3xx_clock.c:346:2: error: implicit declaration of function 'clk_set_parent' [-Werror=implicit-function-declaration]

failure introduced:
3a2c322b68f8137be2f1f5788b13bfb9e0b937c3 is the first bad commit
commit 3a2c322b68f8137be2f1f5788b13bfb9e0b937c3
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Mon Jun 22 17:13:49 2015 -0700

    clk: Remove clk.h from clk-provider.h

bisected, reported to author, cc'd linux-next


linux-next/ia64-defconfig/ia64
==============================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465244/

arch/ia64/kernel/entry.S:1775: Error: attempt to move .org backwards

Mindless bisect leads to:
d221fc1f0f25e14f3f4a2d180df4463d504d90da is the first bad commit
commit d221fc1f0f25e14f3f4a2d180df4463d504d90da
Author: Eric B Munson <emunson@akamai.com>
Date:   Thu Jul 16 10:09:21 2015 +1000

    mm: mlock: add new mlock, munlock, and munlockall system calls
    
bisected, reported to author, cc'd linux-next


linux-next/ip27_defconfig/mips
=============================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465322/

arch/mips/kernel/time.c:64:10: error: 'MIPS_CPU_IRQ_BASE' undeclared (first use in this function)

-reported to Ralf via irc; he was already aware of it.


linux-next/mips-allmodconfig/mips
=================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465322/

sound/soc/codecs/cs4349.c:300:2: error: implicit declaration of function 'devm_gpiod_get_optional' [-Werror=implicit-function-declaration]
sound/soc/codecs/cs4349.c:301:12: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
sound/soc/codecs/cs4349.c:306:3: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]

bisect leads to:
e40da86a37f64c73b810bc7a63d77c44dc61accb is the first bad commit
commit e40da86a37f64c73b810bc7a63d77c44dc61accb
Author: Tim Howe <tim.howe@cirrus.com>
Date:   Thu Jul 16 14:51:40 2015 -0500

    ASoC: cs4349: Add support for Cirrus Logic CS4349

    Signed-off-by: Tim Howe <tim.howe@cirrus.com>
    Signed-off-by: Mark Brown <broonie@kernel.org>

bisected, reported to author, cc'd linux-next


linux-next/parisc-allmodconfig/parisc
=====================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465445/

-same as cs4349 problem in mips allmodconfig


linux-next/s390-allyesconfig/s390x (+allmodconfig)
=================================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465246/

-same as cs4349 problem in mips allmodconfig


linux-next/sparc-allmodconfig/sparc64
=====================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465320/

arch/sparc/include/asm/highmem.h:58:2: error: implicit declaration of function 'PageHighMem' [-Werror=implicit-function-declaration]

-could not reproduce this with my toolchain.   :-/


linux-next/tilegx_defconfig/tilegx
==================================

http://kisskb.ellerman.id.au/kisskb/buildresult/12465365/

include/linux/mman.h:90:9: error: 'MAP_LOCKONFAULT' undeclared (first use in this function)

first fails with:
commit 5a5656f2c9b61c74c15f9ef3fa2e6513b6c237bb
Author: Eric B Munson <emunson@akamai.com>
Date:   Thu Jul 16 10:09:22 2015 +1000

    mm: mmap: add mmap flag to request VM_LOCKONFAULT

bisected, cc'd author and linux-next.
