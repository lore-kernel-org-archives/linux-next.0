From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Fri, 12 Jan 2018 12:25:15 +0000
Message-ID: <20180112122515.yrgewjb77epvl6zk@armageddon.cambridge.arm.com>
References: <20180112082359.3d8c4c8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180112082359.3d8c4c8d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 12, 2018 at 08:23:59AM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/kernel/cpufeature.c
> index a73a5928f09b,da6722db50b0..000000000000
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@@ -145,8 -146,9 +146,10 @@@ static const struct arm64_ftr_bits ftr_
>   };
>   
>   static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
> + 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV3_SHIFT, 4, 0),
> + 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_CSV2_SHIFT, 4, 0),
>  -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_SVE_SHIFT, 4, 0),
>  +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>  +				   FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_SVE_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_GIC_SHIFT, 4, 0),
>   	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_ASIMD_SHIFT, 4, ID_AA64PFR0_ASIMD_NI),
>   	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_FP_SHIFT, 4, ID_AA64PFR0_FP_NI),

It looks fine. Thanks.

-- 
Catalin
