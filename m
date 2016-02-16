From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v2] arm64/efi: Make strnlen() available to the EFI namespace
Date: Tue, 16 Feb 2016 11:20:13 +0100
Message-ID: <CAKv+Gu-Ms8S-oBvGbbxvh4Xr67UcKXpbuPh8TLO_KdhYgL0eTg@mail.gmail.com>
References: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
	<1455617791-4791-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:34051 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754551AbcBPKUN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2016 05:20:13 -0500
Received: by mail-ig0-f176.google.com with SMTP id g6so27708381igt.1
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2016 02:20:13 -0800 (PST)
In-Reply-To: <1455617791-4791-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org, Rob Herring <robh@kernel.org>

On 16 February 2016 at 11:16, Thierry Reding <thierry.reding@gmail.com> wrote:
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

Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
> Changes in v2:
> - mark strnlen() position independent and refer to __pi_strnlen
>
>  arch/arm64/kernel/image.h | 1 +
>  arch/arm64/lib/strnlen.S  | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
> index 999633bd7294..352f7abd91c9 100644
> --- a/arch/arm64/kernel/image.h
> +++ b/arch/arm64/kernel/image.h
> @@ -89,6 +89,7 @@ __efistub_memcpy              = KALLSYMS_HIDE(__pi_memcpy);
>  __efistub_memmove              = KALLSYMS_HIDE(__pi_memmove);
>  __efistub_memset               = KALLSYMS_HIDE(__pi_memset);
>  __efistub_strlen               = KALLSYMS_HIDE(__pi_strlen);
> +__efistub_strnlen              = KALLSYMS_HIDE(__pi_strnlen);
>  __efistub_strcmp               = KALLSYMS_HIDE(__pi_strcmp);
>  __efistub_strncmp              = KALLSYMS_HIDE(__pi_strncmp);
>  __efistub___flush_dcache_area  = KALLSYMS_HIDE(__pi___flush_dcache_area);
> diff --git a/arch/arm64/lib/strnlen.S b/arch/arm64/lib/strnlen.S
> index 2ca665711bf2..eae38da6e0bb 100644
> --- a/arch/arm64/lib/strnlen.S
> +++ b/arch/arm64/lib/strnlen.S
> @@ -168,4 +168,4 @@ CPU_LE( lsr tmp2, tmp2, tmp4 )      /* Shift (tmp1 & 63).  */
>  .Lhit_limit:
>         mov     len, limit
>         ret
> -ENDPROC(strnlen)
> +ENDPIPROC(strnlen)
> --
> 2.7.1
>
