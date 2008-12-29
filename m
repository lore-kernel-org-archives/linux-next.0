From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree
Date: Mon, 29 Dec 2008 23:10:38 +1100
Message-ID: <20081229231038.5c120a50.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33900 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752779AbYL2MKk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 07:10:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, Arjan van de Ven <arjan@infradead.org>

Hi Ingo,

Today's linux-next merge of the iommu tree got a conflict in
arch/x86/mm/init_32.c between commit
304e629bf4a3150a0bf6556fc45c52c5c082340f ("x86: corruption check: run the
corruption checks from a work queue") from Linus' tree and commit
cfb80c9eae8c7ed8f2ee81090062d15ead51cbe8 ("x86: unify pci iommu setup and
allow swiotlb to compile for 32 bit") from the iommu tree.

Just overlapping removal/addition.  I fixed it up (see below) and can
carry the fix as necessay.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/mm/init_32.c
index bdcbe2c,2b4b14f..0000000
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@@ -969,6 -970,10 +970,8 @@@ void __init mem_init(void
  	int codesize, reservedpages, datasize, initsize;
  	int tmp;
  
 -	start_periodic_check_for_corruption();
 -
+ 	pci_iommu_alloc();
+ 
  #ifdef CONFIG_FLATMEM
  	BUG_ON(!mem_map);
  #endif
