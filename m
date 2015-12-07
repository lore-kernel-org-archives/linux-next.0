From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm tree
Date: Mon, 7 Dec 2015 19:00:28 +1100
Message-ID: <20151207190028.390223f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56663 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752383AbbLGIAb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 03:00:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Daniel Cashman <dcashman@google.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm/Kconfig

between commit:

  437682eeab45 ("ARM: 8456/1: code patching only works on MMU")

from the arm tree and commits:

  47fb802e4fcd ("arm: mm: support ARCH_MMAP_RND_BITS")
  8100fa068b27 ("ARM: avoid ARCH_MMAP_RND_BITS for NOMMU")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Kconfig
index 752775aab3ae,536a8e477a96..000000000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -33,8 -33,9 +33,9 @@@ config AR
  	select HARDIRQS_SW_RESEND
  	select HAVE_ARCH_AUDITSYSCALL if (AEABI && !OABI_COMPAT)
  	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
 -	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32
 -	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32
 +	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
 +	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
+ 	select HAVE_ARCH_MMAP_RND_BITS if MMU
  	select HAVE_ARCH_SECCOMP_FILTER if (AEABI && !OABI_COMPAT)
  	select HAVE_ARCH_TRACEHOOK
  	select HAVE_BPF_JIT
