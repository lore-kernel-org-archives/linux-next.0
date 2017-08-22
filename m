From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the l2-mtd tree with the kbuild-current
 tree
Date: Tue, 22 Aug 2017 11:56:14 +1000
Message-ID: <20170822115614.1590b368@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: linux-next.vger.kernel.org

Hi Brian,

Today's linux-next merge of the l2-mtd tree got a conflict in:

  include/asm-generic/vmlinux.lds.h

between commit:

  cb87481ee89d ("kbuild: linker script do not match C names unless LD_DEAD_CODE_DATA_ELIMINATION is configured")

from the kbuild-current tree and commit:

  129f6c4820dd ("mtd: only use __xipram annotation when XIP_KERNEL is set")

from the l2-mtd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/asm-generic/vmlinux.lds.h
index 9623d78f8494,ff507c178327..000000000000
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@@ -214,9 -198,13 +214,10 @@@

  /*
   * .data section
 - * LD_DEAD_CODE_DATA_ELIMINATION option enables -fdata-sections generates
 - * .data.identifier which needs to be pulled in with .data, but don't want to
 - * pull in .data..stuff which has its own requirements. Same for bss.
   */
  #define DATA_DATA                                                     \
+       *(.xiptext)                                                     \
 -      *(.data .data.[0-9a-zA-Z_]*)                                    \
 +      *(DATA_MAIN)                                                    \
        *(.ref.data)                                                    \
        *(.data..shared_aligned) /* percpu related */                   \
        MEM_KEEP(init.data)                                             \
