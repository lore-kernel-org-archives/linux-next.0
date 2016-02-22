From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Mon, 22 Feb 2016 13:28:29 +1100
Message-ID: <20160222132829.2b4cf53e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54127 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752466AbcBVC2b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Feb 2016 21:28:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/cpufeature.h
  arch/arm64/kernel/cpufeature.c

between commit:

  d5370f754875 ("arm64: prefetch: add alternative pattern for CPUs without a prefetcher")
  57f4959bad0a ("arm64: kernel: Add support for User Access Override")
  705441960033 ("arm64: kernel: Don't toggle PAN on systems with UAO")

from the arm64 tree and commit:

  d0be74f771d5 ("arm64: Add ARM64_HAS_VIRT_HOST_EXTN feature")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cpufeature.h
index 37a53fc6b384,a5c769b1c65b..000000000000
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@@ -30,11 -30,12 +30,12 @@@
  #define ARM64_HAS_LSE_ATOMICS			5
  #define ARM64_WORKAROUND_CAVIUM_23154		6
  #define ARM64_WORKAROUND_834220			7
 -/* #define ARM64_HAS_NO_HW_PREFETCH		8 */
 -/* #define ARM64_HAS_UAO			9 */
 -/* #define ARM64_ALT_PAN_NOT_UAO		10 */
 +#define ARM64_HAS_NO_HW_PREFETCH		8
 +#define ARM64_HAS_UAO				9
 +#define ARM64_ALT_PAN_NOT_UAO			10
+ #define ARM64_HAS_VIRT_HOST_EXTN		11
  
- #define ARM64_NCAPS				11
+ #define ARM64_NCAPS				12
  
  #ifndef __ASSEMBLY__
  
diff --cc arch/arm64/kernel/cpufeature.c
index 7566cad9fa1d,ba745199297e..000000000000
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@@ -634,18 -622,11 +635,23 @@@ static bool has_useable_gicv3_cpuif(con
  	return has_sre;
  }
  
 +static bool has_no_hw_prefetch(const struct arm64_cpu_capabilities *entry)
 +{
 +	u32 midr = read_cpuid_id();
 +	u32 rv_min, rv_max;
 +
 +	/* Cavium ThunderX pass 1.x and 2.x */
 +	rv_min = 0;
 +	rv_max = (1 << MIDR_VARIANT_SHIFT) | MIDR_REVISION_MASK;
 +
 +	return MIDR_IS_CPU_MODEL_RANGE(midr, MIDR_THUNDERX, rv_min, rv_max);
 +}
 +
+ static bool runs_at_el2(const struct arm64_cpu_capabilities *entry)
+ {
+ 	return is_kernel_in_hyp_mode();
+ }
+ 
  static const struct arm64_cpu_capabilities arm64_features[] = {
  	{
  		.desc = "GIC system register CPU interface",
@@@ -677,27 -658,10 +683,32 @@@
  	},
  #endif /* CONFIG_AS_LSE && CONFIG_ARM64_LSE_ATOMICS */
  	{
 +		.desc = "Software prefetching using PRFM",
 +		.capability = ARM64_HAS_NO_HW_PREFETCH,
 +		.matches = has_no_hw_prefetch,
 +	},
 +#ifdef CONFIG_ARM64_UAO
 +	{
 +		.desc = "User Access Override",
 +		.capability = ARM64_HAS_UAO,
 +		.matches = has_cpuid_feature,
 +		.sys_reg = SYS_ID_AA64MMFR2_EL1,
 +		.field_pos = ID_AA64MMFR2_UAO_SHIFT,
 +		.min_field_value = 1,
 +		.enable = cpu_enable_uao,
 +	},
 +#endif /* CONFIG_ARM64_UAO */
 +#ifdef CONFIG_ARM64_PAN
 +	{
 +		.capability = ARM64_ALT_PAN_NOT_UAO,
 +		.matches = cpufeature_pan_not_uao,
 +	},
 +#endif /* CONFIG_ARM64_PAN */
++	{
+ 		.desc = "Virtualization Host Extensions",
+ 		.capability = ARM64_HAS_VIRT_HOST_EXTN,
+ 		.matches = runs_at_el2,
+ 	},
  	{},
  };
  
