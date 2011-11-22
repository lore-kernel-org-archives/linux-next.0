From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Tue, 22 Nov 2011 08:13:17 +0000
Message-ID: <20111122081317.GB22232@flint.arm.linux.org.uk>
References: <20111122120358.aa2cefdcdace9a98acafd4b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55635 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755548Ab1KVIN7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2011 03:13:59 -0500
Content-Disposition: inline
In-Reply-To: <20111122120358.aa2cefdcdace9a98acafd4b9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>

On Tue, Nov 22, 2011 at 12:03:58PM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm/mm/ioremap.c
> index 12c7ad2,d1f78ba..0000000
> --- a/arch/arm/mm/ioremap.c
> +++ b/arch/arm/mm/ioremap.c
> @@@ -194,7 -208,14 +202,8 @@@ void __iomem * __arm_ioremap_pfn_caller
>   	 */
>   	if (pfn >= 0x100000 && (__pfn_to_phys(pfn) & ~SUPERSECTION_MASK))
>   		return NULL;
> + #endif
>   
>  -	/*
>  -	 * Don't allow RAM to be mapped - this causes problems with ARMv6+
>  -	 */
>  -	if (WARN_ON(pfn_valid(pfn)))
>  -		return NULL;
>  -

This certainly is not correct - if Catalin's lpae tree is removing this
then that needs to be fixed.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
