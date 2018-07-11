From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the iommu
 tree
Date: Wed, 11 Jul 2018 12:58:13 +0200
Message-ID: <20180711105813.GA18417@kroah.com>
References: <20180711131445.7e1e211b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180711131445.7e1e211b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <jroedel@suse.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 11, 2018 at 01:14:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/iommu/ipmmu-vmsa.c
> 
> between commits:
> 
>   0b8ac1409641 ("iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code")
>   3701c123e1c1 ("iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code")
>   98dbffd39a65 ("iommu/ipmmu-vmsa: Hook up R8A77965 DT matching code")
> 
> from the iommu tree and commit:
> 
>   ac6bbf0cdf42 ("iommu: Remove IOMMU_OF_DECLARE")
> 
> from the driver-core tree.
> 
> I fixed it up (I removed the new IOMMU_OF_DECLARE() lines) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Resolution seems sane to me, thanks.

greg k-h
