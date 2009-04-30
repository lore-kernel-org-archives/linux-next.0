From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dwmw2-iommu tree with the x86 tree
Date: Thu, 30 Apr 2009 13:12:32 +1000
Message-ID: <20090430131232.fb51742a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58381 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751704AbZD3DM5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 23:12:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Weidong Han <weidong.han@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi David,

Today's linux-next merge of the dwmw2-iommu tree got a conflict in
drivers/pci/intel-iommu.c between commit
937582382c71b75b29fbb92615629494e1a05ac0 ("x86, intr-remap: enable
interrupt remapping early") from the x86 tree and commit
4ed0d3e6c64cfd9ba4ceb2099b10d1cf8ece4320 ("Intel IOMMU Pass Through
Support") from the dwmw2-iommu tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/pci/intel-iommu.c
index 9ce8f07,1312182..0000000
--- a/drivers/pci/intel-iommu.c
+++ b/drivers/pci/intel-iommu.c
@@@ -1968,30 -2025,23 +2025,15 @@@ static int __init init_dmars(void
  		}
  	}
  
 -#ifdef CONFIG_INTR_REMAP
 -	if (!intr_remapping_enabled) {
 -		ret = enable_intr_remapping(0);
 -		if (ret)
 -			printk(KERN_ERR
 -			       "IOMMU: enable interrupt remapping failed\n");
 -	}
 -#endif
  	/*
- 	 * For each rmrr
- 	 *   for each dev attached to rmrr
- 	 *   do
- 	 *     locate drhd for dev, alloc domain for dev
- 	 *     allocate free domain
- 	 *     allocate page table entries for rmrr
- 	 *     if context not allocated for bus
- 	 *           allocate and init context
- 	 *           set present in root table for this bus
- 	 *     init context with domain, translation etc
- 	 *    endfor
- 	 * endfor
+ 	 * If pass through is set and enabled, context entries of all pci
+ 	 * devices are intialized by pass through translation type.
  	 */
- 	for_each_rmrr_units(rmrr) {
- 		for (i = 0; i < rmrr->devices_cnt; i++) {
- 			pdev = rmrr->devices[i];
- 			/* some BIOS lists non-exist devices in DMAR table */
- 			if (!pdev)
- 				continue;
- 			ret = iommu_prepare_rmrr_dev(rmrr, pdev);
- 			if (ret)
- 				printk(KERN_ERR
- 				 "IOMMU: mapping reserved region failed\n");
+ 	if (iommu_pass_through) {
+ 		ret = init_context_pass_through();
+ 		if (ret) {
+ 			printk(KERN_ERR "IOMMU: Pass through init failed.\n");
+ 			iommu_pass_through = 0;
  		}
  	}
  
