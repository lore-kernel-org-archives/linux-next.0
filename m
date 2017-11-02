From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Date: Thu, 2 Nov 2017 18:13:18 +1100
Message-ID: <20171102181318.2d017239@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752632AbdKBHNV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 03:13:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Victor Chibotaru <tchibo@google.com>, Alexander Potapenko <glider@google.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Makefile

between commit:

  2e026cb9ffbb ("kbuild: do not call cc-option before KBUILD_CFLAGS initialization")

from the kbuild tree and commit:

  56db01c150f1 ("Makefile: support flag -fsanitizer-coverage=trace-cmp")

from the akpm-current tree.

I fixed it up (mostly - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Makefile
index 94e70d8693f3,4ee187f133bb..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -603,12 -619,6 +603,11 @@@ endi
  # Defaults to vmlinux, but the arch makefile usually adds further targets
  all: vmlinux
  
 +KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
 +KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
 +CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
- CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 +export CFLAGS_GCOV CFLAGS_KCOV
 +
  # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
  # values of the respective KBUILD_* variables
  ARCH_CPPFLAGS :=
