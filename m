From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Sun, 1 Nov 2015 09:17:24 +1100
Message-ID: <20151101091724.35e04b97@canb.auug.org.au>
References: <20151022132652.611ec628@canb.auug.org.au>
	<20151022120602.GB28575@e106634-lin.cambridge.arm.com>
	<20151022153201.GD26603@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151022153201.GD26603@e104818-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Catalin,

On Thu, 22 Oct 2015 16:32:01 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, Oct 22, 2015 at 01:06:03PM +0100, Suzuki K. Poulose wrote:
> > On Thu, Oct 22, 2015 at 01:26:52PM +1100, Stephen Rothwell wrote:  
> > > Today's linux-next merge of the tip tree got a conflict in:
> > > 
> > >   arch/arm64/kernel/cpufeature.c
> > > 
> > > between commit:
> > > 
> > >   da8d02d19ffd ("arm64/capabilities: Make use of system wide safe value")
> > > 
> > > from the arm64 tree and commit:
> > > 
> > >   963fcd409587 ("arm64: cpufeatures: Check ICC_EL1_SRE.SRE before enabling ARM64_HAS_SYSREG_GIC_CPUIF")
> > > 
> > > from the tip tree.
> > > 
> > > I fixed it up (I have no idea here, so I just used the arm64 tree version)
> > > and can carry the fix as necessary (no action is required).  
> > 
> > We need the following patch applied to fix the conflict correctly
> > on top of the -next tree.  
> 
> Or, if it's easier, the combined diff resolution for the conflicting
> code:
> 
> --------8<----------------------------
> diff --cc arch/arm64/kernel/cpufeature.c
> index d0d607452e1d,305f30dc9e63..ec552cf9e12d
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> 
> [...]
> 
>   
> + static bool has_useable_gicv3_cpuif(const struct arm64_cpu_capabilities *entry)
> + {
> + 	bool has_sre;
> + 
>  -	if (!has_id_aa64pfr0_feature(entry))
> ++	if (!has_cpuid_feature(entry))
> + 		return false;
> + 
> + 	has_sre = gic_enable_sre();
> + 	if (!has_sre)
> + 		pr_warn_once("%s present but disabled by higher exception level\n",
> + 			     entry->desc);
> + 
> + 	return has_sre;
> + }
> + 
>   static const struct arm64_cpu_capabilities arm64_features[] = {
>   	{
>   		.desc = "GIC system register CPU interface",
>   		.capability = ARM64_HAS_SYSREG_GIC_CPUIF,
> - 		.matches = has_cpuid_feature,
> + 		.matches = has_useable_gicv3_cpuif,
>  -		.field_pos = 24,
>  +		.sys_reg = SYS_ID_AA64PFR0_EL1,
>  +		.field_pos = ID_AA64PFR0_GIC_SHIFT,
>   		.min_field_value = 1,
>   	},
>   #ifdef CONFIG_ARM64_PAN

OK, I have updated my merge resolution.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
