From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Sun, 14 Jan 2018 21:40:52 +0000
Message-ID: <20180114214051.2o2dxbtuhsn7eqbw@armageddon.cambridge.arm.com>
References: <20180115083214.27e99257@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180115083214.27e99257@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shanker Donthineni <shankerd@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 15, 2018 at 08:32:14AM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/include/asm/cputype.h
> index cbf08d7cbf30,2f8d39ed9c2e..000000000000
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@@ -91,7 -94,7 +94,8 @@@
>   #define BRCM_CPU_PART_VULCAN		0x516
>   
>   #define QCOM_CPU_PART_FALKOR_V1		0x800
> + #define QCOM_CPU_PART_KRYO		0x200
>  +#define QCOM_CPU_PART_FALKOR		0xC00
>   
>   #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A53)
>   #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A57)
> @@@ -99,8 -104,10 +105,11 @@@
>   #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>   #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
>   #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
> + #define MIDR_CAVIUM_THUNDERX2 MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX2)
> + #define MIDR_BRCM_VULCAN MIDR_CPU_MODEL(ARM_CPU_IMP_BRCM, BRCM_CPU_PART_VULCAN)
>   #define MIDR_QCOM_FALKOR_V1 MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR_V1)
> + #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
>  +#define MIDR_QCOM_FALKOR MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR)

It looks fine. Thanks.

-- 
Catalin
