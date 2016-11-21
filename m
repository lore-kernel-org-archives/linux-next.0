From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 22 Nov 2016 10:34:58 +1100
Message-ID: <20161122103458.1f10bcbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/cpufeature.h

between commit:

  272d01bd790f ("arm64: Fix circular include of asm/lse.h through linux/jump_label.h")

from Linus' tree and commits:

  a4023f682739 ("arm64: Add hypervisor safe helper for checking constant capabilities")
  82e0191a1aa1 ("arm64: Support systems without FP/ASIMD")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I also added this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Nov 2016 10:30:40 +1100
Subject: [PATCH] arm64: merge fix for code movement to cpucaps.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/include/asm/cpucaps.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 87b446535185..4174f09678c4 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -34,7 +34,8 @@
 #define ARM64_HAS_32BIT_EL0			13
 #define ARM64_HYP_OFFSET_LOW			14
 #define ARM64_MISMATCHED_CACHE_LINE_SIZE	15
+#define ARM64_HAS_NO_FPSIMD			16
 
-#define ARM64_NCAPS				16
+#define ARM64_NCAPS				17
 
 #endif /* __ASM_CPUCAPS_H */
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cpufeature.h
index 0bc0b1de90c4,0ef718b67c54..000000000000
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@@ -9,9 -9,6 +9,7 @@@
  #ifndef __ASM_CPUFEATURE_H
  #define __ASM_CPUFEATURE_H
  
- #include <linux/jump_label.h>
- 
 +#include <asm/cpucaps.h>
  #include <asm/hwcap.h>
  #include <asm/sysreg.h>
  
@@@ -25,8 -22,34 +23,10 @@@
  #define MAX_CPU_FEATURES	(8 * sizeof(elf_hwcap))
  #define cpu_feature(x)		ilog2(HWCAP_ ## x)
  
 -#define ARM64_WORKAROUND_CLEAN_CACHE		0
 -#define ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE	1
 -#define ARM64_WORKAROUND_845719			2
 -#define ARM64_HAS_SYSREG_GIC_CPUIF		3
 -#define ARM64_HAS_PAN				4
 -#define ARM64_HAS_LSE_ATOMICS			5
 -#define ARM64_WORKAROUND_CAVIUM_23154		6
 -#define ARM64_WORKAROUND_834220			7
 -#define ARM64_HAS_NO_HW_PREFETCH		8
 -#define ARM64_HAS_UAO				9
 -#define ARM64_ALT_PAN_NOT_UAO			10
 -#define ARM64_HAS_VIRT_HOST_EXTN		11
 -#define ARM64_WORKAROUND_CAVIUM_27456		12
 -#define ARM64_HAS_32BIT_EL0			13
 -#define ARM64_HYP_OFFSET_LOW			14
 -#define ARM64_MISMATCHED_CACHE_LINE_SIZE	15
 -/*
 - * The macro below will be moved to asm/cpucaps.h together with the
 - * ARM64_NCAPS update.
 - */
 -#define ARM64_HAS_NO_FPSIMD			16
 -
 -#define ARM64_NCAPS				17
 -
  #ifndef __ASSEMBLY__
  
+ #include <linux/bug.h>
+ #include <linux/jump_label.h>
  #include <linux/kernel.h>
  
  /* CPU feature register tracking */
