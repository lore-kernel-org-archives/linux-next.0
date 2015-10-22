From: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Thu, 22 Oct 2015 13:06:03 +0100
Message-ID: <20151022120602.GB28575@e106634-lin.cambridge.arm.com>
References: <20151022132652.611ec628@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143]:47782 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757140AbbJVMGJ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Oct 2015 08:06:09 -0400
In-Reply-To: <20151022132652.611ec628@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>

On Thu, Oct 22, 2015 at 01:26:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/kernel/cpufeature.c
> 
> between commit:
> 
>   da8d02d19ffd ("arm64/capabilities: Make use of system wide safe value")
> 
> from the arm64 tree and commit:
> 
>   963fcd409587 ("arm64: cpufeatures: Check ICC_EL1_SRE.SRE before enabling ARM64_HAS_SYSREG_GIC_CPUIF")
> 
> from the tip tree.
> 
> I fixed it up (I have no idea here, so I just used the arm64 tree version)
> and can carry the fix as necessary (no action is required).

Stephen,

We need the following patch applied to fix the conflict correctly
on top of the -next tree.

---->8----
    linux-next: arm64/cpufeatures: Resolve merg conflict
    
    This patch fixes the merge conflict in linux-next with arm64 tree
    and the tip.
    
      arch/arm64/kernel/cpufeature.c
    between commit:
      da8d02d19ffd ("arm64/capabilities: Make use of system wide safe value")
    from the arm64 tree and commit:
      963fcd409587 ("arm64: cpufeatures: Check ICC_EL1_SRE.SRE before enabling
    			ARM64_HAS_SYSREG_GIC_CPUIF")
    from the tip tree.
    
    Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d413959..a1aea90 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -597,11 +597,25 @@ has_cpuid_feature(const struct arm64_cpu_capabilities *entry)
 	return feature_matches(val, entry);
 }
 
+static bool has_useable_gicv3_cpuif(const struct arm64_cpu_capabilities *entry)
+{
+	bool has_sre;
+
+	if (!has_cpuid_feature(entry))
+		return false;
+	has_sre = gic_enable_sre();
+	if (!has_sre)
+		pr_warn_once("%s present but disabled by higher exception level\n",
+				entry->desc);
+
+	return has_sre;
+}
+
 static const struct arm64_cpu_capabilities arm64_features[] = {
 	{
 		.desc = "GIC system register CPU interface",
 		.capability = ARM64_HAS_SYSREG_GIC_CPUIF,
-		.matches = has_cpuid_feature,
+		.matches = has_useable_gicv3_cpuif,
 		.sys_reg = SYS_ID_AA64PFR0_EL1,
 		.field_pos = ID_AA64PFR0_GIC_SHIFT,
 		.min_field_value = 1,

----8<-----

Thanks
Suzuki


> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
