From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: linux-next: manual merge of the dt-rh tree with the iommu tree
Date: Wed, 11 May 2016 12:31:13 +0100
Message-ID: <57331801.90903@arm.com>
References: <20160511122037.43cd3db8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:51099 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751308AbcEKLbQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 May 2016 07:31:16 -0400
In-Reply-To: <20160511122037.43cd3db8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robherring2@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Will Deacon <will.deacon@arm.com>

Hi Stephen, Rob,

On 11/05/16 03:20, Stephen Rothwell wrote:
> Hi Rob,
>
> Today's linux-next merge of the dt-rh tree got a conflict in:
>
>    drivers/iommu/arm-smmu.c
>
> between commit:
>
>    d54663573131 ("iommu/arm-smmu: Use per-domain page sizes.")
>
> from the iommu tree and commit:
>
>    cb6c27bb0912 ("iommu/arm-smmu: Make use of phandle iterators in device-tree parsing")
>
> from the dt-rh tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry, I'll take partial responsibility for that, as I'd forgotten about 
the SMMU patch Rob was carrying when Joerg picked up my conflicting 
patches. The resolution looks fine to me.

Robin.
