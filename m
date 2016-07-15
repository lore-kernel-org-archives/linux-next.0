From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm tree
Date: Fri, 15 Jul 2016 10:56:01 +0200
Message-ID: <5788A521.8000207@samsung.com>
References: <20160715182947.2ce9825a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160715182947.2ce9825a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: linux-next.vger.kernel.org

On 07/15/2016 10:29 AM, Stephen Rothwell wrote:
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
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks correct, thanks. FWIW:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
