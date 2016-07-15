From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: manual merge of the akpm tree with the arm tree
Date: Fri, 15 Jul 2016 09:33:51 +0100
Message-ID: <20160715083351.GD14726@flint.armlinux.org.uk>
References: <20160715182947.2ce9825a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:57551 "EHLO
	pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753009AbcGOIeF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2016 04:34:05 -0400
Content-Disposition: inline
In-Reply-To: <20160715182947.2ce9825a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Fri, Jul 15, 2016 at 06:29:47PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/arm/mm/dma-mapping.c
> 
> between commits:
> 
>   f12708965069 ("ARM: 8561/3: dma-mapping: Don't use outer_flush_range when the L2C is coherent")
>   565068221b90 ("ARM: 8561/4: dma-mapping: Fix the coherent case when iommu is used")
> 
> from the arm tree and patch:
> 
>    "ARM: dma-mapping: use unsigned long for dma_attrs"
> 
> from the akpm-current tree.

Thanks Stephen, resolution looks good to me.

-- 
Russell King
ARM architecture Linux Kernel maintainer
