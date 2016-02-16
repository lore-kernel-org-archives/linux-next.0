From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2] arm64/efi: Make strnlen() available to the EFI
 namespace
Date: Tue, 16 Feb 2016 10:32:54 +0000
Message-ID: <20160216103254.GD14509@arm.com>
References: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
 <1455617791-4791-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:51772 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754764AbcBPKct (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Feb 2016 05:32:49 -0500
Content-Disposition: inline
In-Reply-To: <1455617791-4791-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh@kernel.org>

On Tue, Feb 16, 2016 at 11:16:31AM +0100, Thierry Reding wrote:
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
> Changes in v2:
> - mark strnlen() position independent and refer to __pi_strnlen

Thanks, I'll queue this on the arm64 fixes branch.

Will
