From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the unicore32 tree with the kbuild tree
Date: Mon, 10 Jul 2017 10:18:17 +1000
Message-ID: <20170710101817.70d13542@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752749AbdGJAST (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Jul 2017 20:18:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xuetao Guan <epip.guan@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Xuetao,

Today's linux-next merge of the unicore32 tree got a conflict in:

  arch/unicore32/include/asm/Kbuild

between commits:

  e8c83e6b045c ("unicore32: move generic-y of exported headers to uapi/asm/Kbuild")

from the kbuild tree and commits:

  bb3d836a8767 ("unicore32-oldabi: add stat.h support for UNICORE32_OLDABI")
  bc27113620ca ("unicore32-oldabi: add oldabi syscall interface")

from the unicore32 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Actually, signal.h and stat.h should be removed from
arch/unicore32/include/uapi/asm/Kbuild as well ...
-- 
Cheers,
Stephen Rothwell

diff --cc arch/unicore32/include/asm/Kbuild
index fda7e2153086,8578702d4998..000000000000
--- a/arch/unicore32/include/asm/Kbuild
+++ b/arch/unicore32/include/asm/Kbuild
@@@ -20,17 -27,35 +20,16 @@@ generic-y += kprobes.
  generic-y += local.h
  generic-y += mcs_spinlock.h
  generic-y += mm-arch-hooks.h
 -generic-y += mman.h
  generic-y += module.h
 -generic-y += msgbuf.h
 -generic-y += param.h
  generic-y += parport.h
  generic-y += percpu.h
 -generic-y += poll.h
 -generic-y += posix_types.h
  generic-y += preempt.h
 -generic-y += resource.h
  generic-y += sections.h
  generic-y += segment.h
 -generic-y += sembuf.h
  generic-y += serial.h
 -generic-y += setup.h
 -generic-y += shmbuf.h
 -generic-y += shmparam.h
 -generic-y += siginfo.h
  generic-y += sizes.h
- generic-y += syscalls.h
 -generic-y += socket.h
 -generic-y += sockios.h
 -generic-y += statfs.h
 -generic-y += swab.h
 -generic-y += termbits.h
 -generic-y += termios.h
  generic-y += topology.h
  generic-y += trace_clock.h
 -generic-y += types.h
 -generic-y += ucontext.h
  generic-y += unaligned.h
  generic-y += user.h
  generic-y += vga.h
