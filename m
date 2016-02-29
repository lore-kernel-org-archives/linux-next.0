From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: manual merge of the iommu tree with the samsung-krzk
 tree
Date: Mon, 29 Feb 2016 08:56:36 +0100
Message-ID: <20160229075636.GI22747@8bytes.org>
References: <20160229152055.3af83d1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:53044 "EHLO theia.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751978AbcB2H4n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 02:56:43 -0500
Content-Disposition: inline
In-Reply-To: <20160229152055.3af83d1a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>

Hi Stephen,

On Mon, Feb 29, 2016 at 03:20:55PM +1100, Stephen Rothwell wrote:
> Hi Joerg,
> 
> Today's linux-next merge of the iommu tree got a conflict in:
> 
>   drivers/memory/Kconfig
> 
> between commit:
> 
>   78fbb9361ca3 ("memory: Add support for Exynos SROM driver")
> 
> from the samsung-krzk tree and commit:
> 
>   cc8bbe1a8312 ("memory: mediatek: Add SMI driver")
> 
> from the iommu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for fixing this (and the other conflict before) up.



	Joerg
