From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Tue, 2 Aug 2016 13:07:09 -0700
Message-ID: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55204 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932624AbcHBUHd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Aug 2016 16:07:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Are linux-next builds being tested for powerpc with allyesconfig and
allmodconfig ? I have some changes I'm making and while debugging my
build issues I decided to give a clean build a shot and see linux-next
next-20160729 up to next-20160729 all have build failures without my
changes. I get:

/opt/gcc-4.9.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
drivers/built-in.o: .opd is not a regular array of opd entries
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
/opt/gcc-4.9.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
drivers/built-in.o: .opd is not a regular array of opd entries
drivers/built-in.o: In function `.ipw2100_up':
ipw2100.c:(.text+0x1ff9c90): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.round_jiffies_relative' defined
in .text section in kernel/built-in.o
drivers/built-in.o: In function `.ipw2100_reset_adapter':
ipw2100.c:(.text+0x1ffa500): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `._raw_spin_lock_irqsave' defined
in .spinlock.text section in kernel/built-in.o
drivers/built-in.o: In function `.ipw2100_irq_tasklet':
ipw2100.c:(.text+0x1ffa7cc): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `._raw_spin_lock_irqsave' defined
in .spinlock.text section in kernel/built-in.o
ipw2100.c:(.text+0x1ffb6c8): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.printk' defined in
.text.unlikely section in kernel/built-in.o
ipw2100.c:(.text+0x1ffb6d8): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.printk' defined in
.text.unlikely section in kernel/built-in.o
ipw2100.c:(.text+0x1ffb740): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.printk' defined in
.text.unlikely section in kernel/built-in.o
ipw2100.c:(.text+0x1ffb750): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.printk' defined in
.text.unlikely section in kernel/built-in.o
ipw2100.c:(.text+0x1ffb7ec): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.debug_dma_unmap_page' defined in
.text section in lib/built-in.o
ipw2100.c:(.text+0x1ffb88c): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.__dev_kfree_skb_any' defined in
.text section in net/built-in.o
ipw2100.c:(.text+0x1ffb8b8): relocation truncated to fit:
R_PPC64_REL24 (stub) against symbol `.printk' defined in
.text.unlikely section in kernel/built-in.o
ipw2100.c:(.text+0x1ffb8f4): additional relocation overflows omitted
from the output
scripts/link-vmlinux.sh: line 52: 14580 Segmentation fault      (core
dumped) ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2} -T ${lds}
${KBUILD_VMLINUX_INIT} --start-group ${KBUILD_VMLINUX_MAIN}
--end-group ${1}
make: *** [Makefile:952: vmlinux] Error 139

  Luis
