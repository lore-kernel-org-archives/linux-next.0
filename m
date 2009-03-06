From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the x86 tree
Date: Fri, 6 Mar 2009 17:04:35 +1100
Message-ID: <20090306170435.8cddac69.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43731 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750846AbZCFGEj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 01:04:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/Kconfig between commit 2e9f3bddcbc711bb14d86c6f068a779bf3710247
("bzip2/lzma: make config machinery an arch configurable") from the x86
tree and commit 7df4b20d10108f0c1aa08ed3a7c0bfd9b9014562 ("kmemcheck:
make kconfig accessible for other architectures") from the kmemcheck tree.

Just simple overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
diff --cc arch/x86/Kconfig
index 5f50c50,467bacc..0000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -41,9 -40,7 +41,10 @@@ config X8
  	select HAVE_GENERIC_DMA_COHERENT if X86_32
  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
  	select USER_STACKTRACE_SUPPORT
 +	select HAVE_KERNEL_GZIP
 +	select HAVE_KERNEL_BZIP2
 +	select HAVE_KERNEL_LZMA
+ 	select HAVE_ARCH_KMEMCHECK
  
  config ARCH_DEFCONFIG
  	string
