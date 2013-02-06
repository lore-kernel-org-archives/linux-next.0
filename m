From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the iommu
 tree
Date: Tue, 5 Feb 2013 22:03:27 -0800
Message-ID: <20130206060327.GA3352@kroah.com>
References: <20130206162523.c338c51f0d5fc31b20245184@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47967 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750761Ab3BFGBN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Feb 2013 01:01:13 -0500
Content-Disposition: inline
In-Reply-To: <20130206162523.c338c51f0d5fc31b20245184@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Hiroshi Doyu <hdoyu@nvidia.com>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>

On Wed, Feb 06, 2013 at 04:25:23PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/iommu/tegra-smmu.c between commit a6870e928d1b ("iommu/tegra:
> smmu: Support variable MMIO ranges/blocks") from the iommu tree and
> commit bc5e6dea81b0 ("iommu: Convert to devm_ioremap_resource()") from
> the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
