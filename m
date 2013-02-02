From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the cortex tree with the arm tree
Date: Sat, 2 Feb 2013 12:21:22 +0000
Message-ID: <20130202122122.GA26330@flint.arm.linux.org.uk>
References: <20130202222036.0db6c1d208843975be1f8dba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33696 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756811Ab3BBMVj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 2 Feb 2013 07:21:39 -0500
Content-Disposition: inline
In-Reply-To: <20130202222036.0db6c1d208843975be1f8dba@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?iso-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoffer Dall <c.dall@virtualopensystems.com>, Will Deacon <will.deacon@arm.com>

On Sat, Feb 02, 2013 at 10:20:36PM +1100, Stephen Rothwell wrote:
> Hi Uwe,
> 
> Today's linux-next merge of the cortex tree got a conflict in
> arch/arm/include/asm/cputype.h between commit 59530adc3f1b ("ARM: Define
> CPU part numbers and implementors") from the arm tree and commit
> 6ebd4d038dbb ("ARM: stub out read_cpuid and read_cpuid_ext for
> CPU_CP15=n") from the cortex tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

It doesn't look right to me.

> diff --cc arch/arm/include/asm/cputype.h
> index ad41ec2,574269e..0000000
> --- a/arch/arm/include/asm/cputype.h
> +++ b/arch/arm/include/asm/cputype.h
> @@@ -59,30 -60,25 +60,43 @@@ extern unsigned int processor_id
>   		    : "cc");						\
>   		__val;							\
>   	})
> - #else
> - #define read_cpuid(reg) (processor_id)
> - #define read_cpuid_ext(reg) 0
> - #endif
> + 
> + #else /* ifdef CONFIG_CPU_CP15 */
>   
>  +#define ARM_CPU_IMP_ARM			0x41
>  +#define ARM_CPU_IMP_INTEL		0x69
>  +
>  +#define ARM_CPU_PART_ARM1136		0xB360
>  +#define ARM_CPU_PART_ARM1156		0xB560
>  +#define ARM_CPU_PART_ARM1176		0xB760
>  +#define ARM_CPU_PART_ARM11MPCORE	0xB020
>  +#define ARM_CPU_PART_CORTEX_A8		0xC080
>  +#define ARM_CPU_PART_CORTEX_A9		0xC090
>  +#define ARM_CPU_PART_CORTEX_A5		0xC050
>  +#define ARM_CPU_PART_CORTEX_A15		0xC0F0
>  +#define ARM_CPU_PART_CORTEX_A7		0xC070
>  +
>  +#define ARM_CPU_XSCALE_ARCH_MASK	0xe000
>  +#define ARM_CPU_XSCALE_ARCH_V1		0x2000
>  +#define ARM_CPU_XSCALE_ARCH_V2		0x4000
>  +#define ARM_CPU_XSCALE_ARCH_V3		0x6000
>  +

This stuff shouldn't be in the #else section - it's needed when
CONFIG_CPU_CP15 is enabled and this resolution hides it in that case.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
