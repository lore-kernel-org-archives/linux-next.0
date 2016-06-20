From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: manual merge of the iommu tree with the arm tree
Date: Mon, 20 Jun 2016 09:02:59 +0100
Message-ID: <20160620080259.GJ22276@flint.armlinux.org.uk>
References: <20160620132009.4e2c0e32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33378 "EHLO
	pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbcFTIDR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2016 04:03:17 -0400
Content-Disposition: inline
In-Reply-To: <20160620132009.4e2c0e32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 20, 2016 at 01:20:09PM +1000, Stephen Rothwell wrote:
> Hi Joerg,
> 
> Today's linux-next merge of the iommu tree got a conflict in:
> 
>   drivers/iommu/mtk_iommu.c
> 
> between commit:
> 
>   d267804c8457 ("iommu: convert DT component matching to component_match_add_release()")
> 
> from the arm tree and commit:
> 
>   da4d6e6d3b3e ("iommu/mediatek: Convert DT component matching to component_match_add_release()")
> 
> from the iommu tree.

This looks like it's going to end up being broken.  I self-NACK'd my v2
patch series was, and it looks like the v2 patch was picked up instead
of v1.

It's also part of a _three_ patch series, where the _second two_ patches
depend on the _first_ patch.  Such series can't be split up.

-- 
Russell King
ARM architecture Linux Kernel maintainer
