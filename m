From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree
Date: Mon, 29 Dec 2008 23:04:51 +1100
Message-ID: <20081229230451.4e322cde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37346 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752347AbYL2ME4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 07:04:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, Jeremy Fitzhardinge <jeremy@goop.org>

Hi Ingo,

Today's linux-next merge of the iommu tree got a conflict in
arch/x86/kernel/Makefile between commit
b43d196c4d3fe46d6dda7c987c47792612b80b1b ("x86: corruption-check: some
post-move cleanups") from Linus' tree and commit
cfb80c9eae8c7ed8f2ee81090062d15ead51cbe8 ("x86: unify pci iommu setup and
allow swiotlb to compile for 32 bit") from the iommu tree.

Simply overlapping additions.  I fixed it up (see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/Makefile
index 3d82c15,a9c656f..0000000
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@@ -108,7 -105,7 +108,8 @@@ microcode-$(CONFIG_MICROCODE_INTEL)	+= 
  microcode-$(CONFIG_MICROCODE_AMD)	+= microcode_amd.o
  obj-$(CONFIG_MICROCODE)			+= microcode.o
  
 +obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
+ obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb_64.o # NB rename without _64
  
  ###
  # 64 bit specific files
