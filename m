From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Thu, 15 Dec 2011 11:09:15 +0100
Message-ID: <20111215100915.GD4475@8bytes.org>
References: <20111215154051.e8bb4a174259e910a3045f0e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([88.198.83.132]:47514 "EHLO 8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932453Ab1LOKJR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Dec 2011 05:09:17 -0500
Content-Disposition: inline
In-Reply-To: <20111215154051.e8bb4a174259e910a3045f0e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Jesse Barnes <jbarnes@virtuousgeek.org>

Hi Stephen,

On Thu, Dec 15, 2011 at 03:40:51PM +1100, Stephen Rothwell wrote:
> After merging the iommu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/iommu/amd_iommu.c: In function 'pci_iommuv2_capable':
> drivers/iommu/amd_iommu.c:179:3: error: 'PCI_PRI_CAP' undeclared (first use in this function)
> drivers/iommu/amd_iommu.c:180:3: error: 'PCI_PASID_CAP' undeclared (first use in this function)
> drivers/iommu/amd_iommu.c: In function 'pri_reset_while_enabled':
> drivers/iommu/amd_iommu.c:1981:38: error: 'PCI_PRI_CAP' undeclared (first use in this function)
> drivers/iommu/amd_iommu.c:1981:2: warning: passing argument 2 of 'pci_find_ext_capability' makes integer from pointer without a cast [enabled by default]
> include/linux/pci.h:712:5: note: expected 'int' but argument is of type 'const int *'
> drivers/iommu/amd_iommu.c: In function 'pci_pri_tlp_required':
> drivers/iommu/amd_iommu.c:2045:38: error: 'PCI_PRI_CAP' undeclared (first use in this function)
> drivers/iommu/amd_iommu.c:2045:2: warning: passing argument 2 of 'pci_find_ext_capability' makes integer from pointer without a cast [enabled by default]
> include/linux/pci.h:712:5: note: expected 'int' but argument is of type 'const int *'
> 
> Caused by commit 56288ab6e949 ("PCI: Fix PRI and PASID consistency") from
> the pci tree interacting with various commits from the iommu tree.
> 
> I have added the following merge fix patch (and can carry it as
> necessary).

Thanks for resolving this too. I already have a patch for this, it was
just not queued yet. I will queue it in my tree and update my next
branch.
Jesse already provided me a branch which I can pull in, so some of the
patches in his tree will also be in the iommu-tree then.


	Joerg
