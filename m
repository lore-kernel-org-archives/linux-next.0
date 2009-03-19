From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the kmemcheck/x86
 trees
Date: Thu, 19 Mar 2009 19:06:53 +1100
Message-ID: <20090319190653.540eab18.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49051 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751067AbZCSIG5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 04:06:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Vegard Nossum <vegard.nossum@gmail.com>

Hi Ingo,

Today's linux-next merge of the iommu tree got conflicts in
arch/x86/Kconfig between commits 2e9f3bddcbc711bb14d86c6f068a779bf3710247
("bzip2/lzma: make config machinery an arch configurable") from the x86
tree and 7df4b20d10108f0c1aa08ed3a7c0bfd9b9014562 ("kmemcheck: make
kconfig accessible for other architectures") from the kmemcheck tree and
commit 2118d0c548e8a2205e1a29eb5b89e5f2e9ae2c8b ("dma-debug: x86
architecture bindings") from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/Kconfig
index ca6bc8b,f2cb677..0000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -42,10 -40,7 +42,11 @@@ config X8
  	select HAVE_GENERIC_DMA_COHERENT if X86_32
  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
  	select USER_STACKTRACE_SUPPORT
 +	select HAVE_KERNEL_GZIP
 +	select HAVE_KERNEL_BZIP2
 +	select HAVE_KERNEL_LZMA
 +	select HAVE_ARCH_KMEMCHECK
+ 	select HAVE_DMA_API_DEBUG
  
  config ARCH_DEFCONFIG
  	string
