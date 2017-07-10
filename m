From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the kbuild tree
Date: Mon, 10 Jul 2017 15:30:18 +1000
Message-ID: <20170710153018.3d4fd9b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51749 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750924AbdGJFaU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jul 2017 01:30:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tobias Klauser <tklauser@distanz.ch>

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/xtensa/include/asm/Kbuild

between commit:

  35ff5ae79f85 ("xtensa: move generic-y of exported headers to uapi/asm/Kbuild")

from the kbuild tree and patch:

  "xtensa: use generic fb.h"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/xtensa/include/asm/Kbuild
index c04efde775a5,bdc12d426b24..000000000000
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@@ -3,9 -4,13 +3,10 @@@ generic-y += clkdev.
  generic-y += div64.h
  generic-y += dma-contiguous.h
  generic-y += emergency-restart.h
 -generic-y += errno.h
  generic-y += exec.h
  generic-y += extable.h
+ generic-y += fb.h
 -generic-y += fcntl.h
  generic-y += hardirq.h
 -generic-y += ioctl.h
  generic-y += irq_regs.h
  generic-y += irq_work.h
  generic-y += kdebug.h
