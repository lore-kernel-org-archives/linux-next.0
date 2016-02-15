From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64/efi: Make strnlen() available to the EFI namespace
Date: Mon, 15 Feb 2016 19:27:46 +0000
Message-ID: <20160215192746.GT6298@arm.com>
References: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47713 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751389AbcBOT1l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 14:27:41 -0500
Content-Disposition: inline
In-Reply-To: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh@kernel.org>

On Mon, Feb 15, 2016 at 08:17:36PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Changes introduced in the upstream version of libfdt pulled in by commit
> 91feabc2e224 ("scripts/dtc: Update to upstream commit b06e55c88b9b") use
> the strnlen() function, which isn't currently available to the EFI name-
> space. Add it to the EFI namespace to avoid a linker error.
> 
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/kernel/image.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
> index c9c62cab25a4..8a1978f4a555 100644
> --- a/arch/arm64/kernel/image.h
> +++ b/arch/arm64/kernel/image.h
> @@ -96,6 +96,8 @@ __efistub_strcmp		= KALLSYMS_HIDE(__pi_strcmp);
>  __efistub_strncmp		= KALLSYMS_HIDE(__pi_strncmp);
>  __efistub___flush_dcache_area	= KALLSYMS_HIDE(__pi___flush_dcache_area);
>  
> +__efistub_strnlen		= KALLSYMS_HIDE(strnlen);

Shouldn't this refer to __pi_strnlen once we've established that our
strnlen implementation is position independent? It looks like it is, so
you just need to s/ENDPROC/ENDPIPROC/ over there to get the symbol
defined.

Will
