From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with the x86 tree
Date: Wed, 25 Mar 2009 11:28:45 +1100
Message-ID: <20090325112845.03661105.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51384 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756599AbZCYA3E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2009 20:29:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
arch/x86/kernel/pci-nommu.c between commit
1894e36754d682cc049b2b1c3825da8e585967d5 ("x86: pci-nommu.c cleanup")
from the x86 tree and commits 33feffd4525fc2e4dd0a322fb5d07d61f85d791e
("x86, pci-nommu: add map_page"),
d7dff84053524186b139342ac66a4160ce6bb517 ("x86: remove map_single and
unmap_single in struct dma_mapping_ops") and
160c1d8e40866edfeae7d68816b7005d70acf391 ("x86, ia64: convert to use
generic dma_map_ops struct") from the tip-core tree.

I fixed it up (see below) (which is the same as in tip/master) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/pci-nommu.c
index 8b02a39,fe50214..0000000
--- a/arch/x86/kernel/pci-nommu.c
+++ b/arch/x86/kernel/pci-nommu.c
@@@ -78,12 -79,12 +79,12 @@@ static void nommu_free_coherent(struct 
  	free_pages((unsigned long)vaddr, get_order(size));
  }
  
- struct dma_mapping_ops nommu_dma_ops = {
+ struct dma_map_ops nommu_dma_ops = {
 -	.alloc_coherent = dma_generic_alloc_coherent,
 -	.free_coherent = nommu_free_coherent,
 -	.map_sg = nommu_map_sg,
 -	.map_page = nommu_map_page,
 -	.is_phys = 1,
 +	.alloc_coherent	= dma_generic_alloc_coherent,
 +	.free_coherent	= nommu_free_coherent,
- 	.map_single	= nommu_map_single,
 +	.map_sg		= nommu_map_sg,
++	.map_page	= nommu_map_page,
 +	.is_phys	= 1,
  };
  
  void __init no_iommu_init(void)
