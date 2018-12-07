From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Fri, 7 Dec 2018 12:16:10 +0000
Message-ID: <20181207121609.GA26721@arm.com>
References: <20181207091847.1db6a48e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181207091847.1db6a48e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 07, 2018 at 09:18:47AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/kernel/cpu_errata.c
> 
> between commit:
> 
>   ce8c80c536da ("arm64: Add workaround for Cortex-A76 erratum 1286807")
> 
> from Linus' tree and commit:
> 
>   c9460dcb06ee ("arm64: capabilities: Merge entries for ARM64_WORKAROUND_CLEAN_CACHE")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, Stephen, this looks correct to me. Suzuki -- can you please confirm?

Will

> diff --cc arch/arm64/kernel/cpu_errata.c
> index 6ad715d67df8,bb44635026f8..000000000000
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@@ -570,21 -570,43 +570,57 @@@ static const struct midr_range arm64_ha
>   
>   #endif
>   
>  +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>  +
>  +static const struct midr_range arm64_repeat_tlbi_cpus[] = {
>  +#ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
>  +	MIDR_RANGE(MIDR_QCOM_FALKOR_V1, 0, 0, 0, 0),
>  +#endif
>  +#ifdef CONFIG_ARM64_ERRATUM_1286807
>  +	MIDR_RANGE(MIDR_CORTEX_A76, 0, 0, 3, 0),
>  +#endif
>  +	{},
>  +};
>  +
>  +#endif
>  +
> - const struct arm64_cpu_capabilities arm64_errata[] = {
> + #ifdef CONFIG_CAVIUM_ERRATUM_27456
> + static const struct midr_range cavium_erratum_27456_cpus[] = {
> + 	/* Cavium ThunderX, T88 pass 1.x - 2.1 */
> + 	MIDR_RANGE(MIDR_THUNDERX, 0, 0, 1, 1),
> + 	/* Cavium ThunderX, T81 pass 1.0 */
> + 	MIDR_REV(MIDR_THUNDERX_81XX, 0, 0),
> + 	{},
> + };
> + #endif
> + 
> + #ifdef CONFIG_CAVIUM_ERRATUM_30115
> + static const struct midr_range cavium_erratum_30115_cpus[] = {
> + 	/* Cavium ThunderX, T88 pass 1.x - 2.2 */
> + 	MIDR_RANGE(MIDR_THUNDERX, 0, 0, 1, 2),
> + 	/* Cavium ThunderX, T81 pass 1.0 - 1.2 */
> + 	MIDR_REV_RANGE(MIDR_THUNDERX_81XX, 0, 0, 2),
> + 	/* Cavium ThunderX, T83 pass 1.0 */
> + 	MIDR_REV(MIDR_THUNDERX_83XX, 0, 0),
> + 	{},
> + };
> + #endif
> + 
> + #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1003
> + static const struct arm64_cpu_capabilities qcom_erratum_1003_list[] = {
> + 	{
> + 		ERRATA_MIDR_REV(MIDR_QCOM_FALKOR_V1, 0, 0),
> + 	},
> + 	{
> + 		.midr_range.model = MIDR_QCOM_KRYO,
> + 		.matches = is_kryo_midr,
> + 	},
> + 	{},
> + };
> + #endif
> + 
> + #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
> + static const struct midr_range workaround_clean_cache[] = {
>   #if	defined(CONFIG_ARM64_ERRATUM_826319) || \
>   	defined(CONFIG_ARM64_ERRATUM_827319) || \
>   	defined(CONFIG_ARM64_ERRATUM_824069)
> @@@ -697,23 -698,17 +712,17 @@@ const struct arm64_cpu_capabilities arm
>   	},
>   #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1003
>   	{
> - 		.desc = "Qualcomm Technologies Falkor erratum 1003",
> + 		.desc = "Qualcomm Technologies Falkor/Kryo erratum 1003",
>   		.capability = ARM64_WORKAROUND_QCOM_FALKOR_E1003,
> - 		ERRATA_MIDR_REV(MIDR_QCOM_FALKOR_V1, 0, 0),
> - 	},
> - 	{
> - 		.desc = "Qualcomm Technologies Kryo erratum 1003",
> - 		.capability = ARM64_WORKAROUND_QCOM_FALKOR_E1003,
> - 		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
> - 		.midr_range.model = MIDR_QCOM_KRYO,
> - 		.matches = is_kryo_midr,
> + 		.matches = multi_entry_cap_matches,
> + 		.match_list = qcom_erratum_1003_list,
>   	},
>   #endif
>  -#ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
>  +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>   	{
>  -		.desc = "Qualcomm Technologies Falkor erratum 1009",
>  +		.desc = "Qualcomm erratum 1009, ARM erratum 1286807",
>   		.capability = ARM64_WORKAROUND_REPEAT_TLBI,
>  -		ERRATA_MIDR_REV(MIDR_QCOM_FALKOR_V1, 0, 0),
>  +		ERRATA_MIDR_RANGE_LIST(arm64_repeat_tlbi_cpus),
>   	},
>   #endif
>   #ifdef CONFIG_ARM64_ERRATUM_858921
