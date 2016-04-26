From: Joerg Roedel <jroedel@suse.de>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Tue, 26 Apr 2016 12:05:48 +0200
Message-ID: <20160426100548.GM3886@suse.de>
References: <20160426111346.5d47dc12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36117 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751101AbcDZKGN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 06:06:13 -0400
Content-Disposition: inline
In-Reply-To: <20160426111346.5d47dc12@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jacek Lawrynowicz <jacek.lawrynowicz@intel.com>

On Tue, Apr 26, 2016 at 11:13:46AM +1000, Stephen Rothwell wrote:
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 5efadad4615b..3839fd2865a6 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -263,8 +263,7 @@ static u16 get_alias(struct device *dev)
>  	 */
>  	if (pci_alias == devid &&
>  	    PCI_BUS_NUM(ivrs_alias) == pdev->bus->number) {
> -		pdev->dev_flags |= PCI_DEV_FLAGS_DMA_ALIAS_DEVFN;
> -		pdev->dma_alias_devfn = ivrs_alias & 0xff;
> +		pci_add_dma_alias(pdev, ivrs_alias & 0xff);
>  		pr_info("AMD-Vi: Added PCI DMA alias %02x.%d for %s\n",
>  			PCI_SLOT(ivrs_alias), PCI_FUNC(ivrs_alias),
>  			dev_name(dev));

That is exactly the right fix, thanks Stephen. I'll work out how to fix
this in the iommu tree.


	Joerg
