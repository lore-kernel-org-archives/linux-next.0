From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: linux-next: manual merge of the avr32 tree
Date: Fri, 8 Aug 2008 13:28:57 +0200
Message-ID: <20080808132857.0f41c79f@hskinnemo-gx745.norway.atmel.com>
References: <20080808135145.e77b8b4c.sfr@canb.auug.org.au>
	<20080808113125.5fa8ed61@hskinnemo-gx745.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpeu1.atmel.com ([195.65.72.27]:46317 "EHLO bagnes.atmel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754770AbYHHL3M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Aug 2008 07:29:12 -0400
In-Reply-To: <20080808113125.5fa8ed61@hskinnemo-gx745.norway.atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > The include files seem to have moved around quite a bit, so I didn't
> > apply the avr32 tree for today.  Hopefully, the arm-current tree will
> > migrate to Linus' tree soon and then the avr32 tree can be updated to
> > reflect the changes.
> 
> The plan is to merge the conflicting stuff into the avr32 and then
> rebase the few commits I currently have on top of that. I'll fix it.

Ok, everything looks good now. I'll just have to retest a few configs,
then I'll probably push the whole lot to Linus tomorrow. That will be a
huge merge unless Russell beats me to it.

hskinnemoen@hskinnemo-gx745:~/work/linux/next$ git reset --hard next/master
Checking out files: 100% (11167/11167), done.
HEAD is now at b0e2217 Add linux-next specific files for 20080808
hskinnemoen@hskinnemo-gx745:~/work/linux/next$ git pull   git://git.kernel.org/pub/scm/linux/kernel/git/hskinnemoen/avr32-2.6.git avr32-arch
remote: Counting objects: 85, done.
remote: Compressing objects: 100% (18/18), done.
remote: Total 61 (delta 44), reused 56 (delta 40)
Unpacking objects: 100% (61/61), done.
>From git://git.kernel.org/pub/scm/linux/kernel/git/hskinnemoen/avr32-2.6
 * branch            avr32-arch -> FETCH_HEAD
Removed arch/avr32/mach-at32ap/hmatrix.h
Removed include/asm-avr32/arch-at32ap/at32ap700x.h
Removed include/asm-avr32/arch-at32ap/board.h
Removed include/asm-avr32/arch-at32ap/cpu.h
Removed include/asm-avr32/arch-at32ap/gpio.h
Removed include/asm-avr32/arch-at32ap/init.h
Removed include/asm-avr32/arch-at32ap/io.h
Removed include/asm-avr32/arch-at32ap/irq.h
Removed include/asm-avr32/arch-at32ap/pm.h
Removed include/asm-avr32/arch-at32ap/portmux.h
Removed include/asm-avr32/arch-at32ap/smc.h
Removed include/asm-avr32/arch-at32ap/sram.h
Merge made by recursive.
 arch/avr32/Makefile                              |   14 -
 arch/avr32/boards/atngw100/setup.c               |    2 +-
 arch/avr32/boards/atstk1000/atstk1002.c          |    2 +-
 arch/avr32/configs/atngw100_defconfig            |  106 ++-
 arch/avr32/configs/atstk1002_defconfig           |  153 ++-
 arch/avr32/configs/atstk1003_defconfig           |  140 ++-
 arch/avr32/configs/atstk1004_defconfig           |   46 +-
 arch/avr32/configs/atstk1006_defconfig           | 1304 ++++++++++++++++++++++
 arch/avr32/mach-at32ap/Makefile                  |    1 +
 arch/avr32/mach-at32ap/at32ap700x.c              |   26 +-
 arch/avr32/mach-at32ap/clock.c                   |    2 +
 arch/avr32/mach-at32ap/hmatrix.c                 |   88 ++
 arch/avr32/mach-at32ap/hmatrix.h                 |  182 ---
 arch/avr32/mach-at32ap/include/mach/at32ap700x.h |   37 +
 arch/avr32/mach-at32ap/include/mach/chip.h       |   19 +
 arch/avr32/mach-at32ap/include/mach/hmatrix.h    |   55 +
 arch/avr32/mach-at32ap/pm.c                      |    4 +-
 arch/avr32/mach-at32ap/pm.h                      |   12 +-
 include/asm-avr32/arch-at32ap/at32ap700x.h       |   49 -
 include/asm-avr32/arch-at32ap/board.h            |  121 --
 include/asm-avr32/arch-at32ap/cpu.h              |   35 -
 include/asm-avr32/arch-at32ap/gpio.h             |   45 -
 include/asm-avr32/arch-at32ap/init.h             |   18 -
 include/asm-avr32/arch-at32ap/io.h               |   39 -
 include/asm-avr32/arch-at32ap/irq.h              |   14 -
 include/asm-avr32/arch-at32ap/pm.h               |   51 -
 include/asm-avr32/arch-at32ap/portmux.h          |   29 -
 include/asm-avr32/arch-at32ap/smc.h              |  113 --
 include/asm-avr32/arch-at32ap/sram.h             |   30 -
 29 files changed, 1807 insertions(+), 930 deletions(-)
 create mode 100644 arch/avr32/configs/atstk1006_defconfig
 create mode 100644 arch/avr32/mach-at32ap/hmatrix.c
 delete mode 100644 arch/avr32/mach-at32ap/hmatrix.h
 create mode 100644 arch/avr32/mach-at32ap/include/mach/chip.h
 create mode 100644 arch/avr32/mach-at32ap/include/mach/hmatrix.h
 delete mode 100644 include/asm-avr32/arch-at32ap/at32ap700x.h
 delete mode 100644 include/asm-avr32/arch-at32ap/board.h
 delete mode 100644 include/asm-avr32/arch-at32ap/cpu.h
 delete mode 100644 include/asm-avr32/arch-at32ap/gpio.h
 delete mode 100644 include/asm-avr32/arch-at32ap/init.h
 delete mode 100644 include/asm-avr32/arch-at32ap/io.h
 delete mode 100644 include/asm-avr32/arch-at32ap/irq.h
 delete mode 100644 include/asm-avr32/arch-at32ap/pm.h
 delete mode 100644 include/asm-avr32/arch-at32ap/portmux.h
 delete mode 100644 include/asm-avr32/arch-at32ap/smc.h
 delete mode 100644 include/asm-avr32/arch-at32ap/sram.h

Haavard
