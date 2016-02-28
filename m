From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with the arm-soc tree
Date: Mon, 29 Feb 2016 10:51:57 +1100
Message-ID: <20160229105157.003bda53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45683 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751528AbcB1Xv7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Feb 2016 18:51:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jayachandran C <jchandra@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Will Deacon <will.deacon@arm.com>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/cputype.h

between commit:

  9eb8a2cdf65c ("arm64: cputype info for Broadcom Vulcan")

from the arm-soc tree and commit:

  d5370f754875 ("arm64: prefetch: add alternative pattern for CPUs without a prefetcher")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cputype.h
index 3dcecdf3d6ee,b3a83da152a7..000000000000
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@@ -76,10 -80,20 +81,22 @@@
  
  #define CAVIUM_CPU_PART_THUNDERX	0x0A1
  
 +#define BRCM_CPU_PART_VULCAN		0x516
 +
+ #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A53)
+ #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A57)
+ #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
+ 
  #ifndef __ASSEMBLY__
  
+ #include <asm/sysreg.h>
+ 
+ #define read_cpuid(reg) ({						\
+ 	u64 __val;							\
+ 	asm("mrs_s	%0, " __stringify(reg) : "=r" (__val));		\
+ 	__val;								\
+ })
+ 
  /*
   * The CPU ID never changes at run time, so we might as well tell the
   * compiler that it's constant.  Use this function to read the CPU ID
