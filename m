From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 15 Jan 2018 08:32:14 +1100
Message-ID: <20180115083214.27e99257@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751172AbeANVcR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 16:32:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shanker Donthineni <shankerd@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/cputype.h

between commit:

  c622cc013cec ("arm64: Define cputype macros for Falkor CPU")

from Linus' tree and commit:

  bb48711800e6 ("arm64: cpu_errata: Add Kryo to Falkor 1003 errata")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cputype.h
index cbf08d7cbf30,2f8d39ed9c2e..000000000000
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@@ -91,7 -94,7 +94,8 @@@
  #define BRCM_CPU_PART_VULCAN		0x516
  
  #define QCOM_CPU_PART_FALKOR_V1		0x800
+ #define QCOM_CPU_PART_KRYO		0x200
 +#define QCOM_CPU_PART_FALKOR		0xC00
  
  #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A53)
  #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A57)
@@@ -99,8 -104,10 +105,11 @@@
  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
  #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
+ #define MIDR_CAVIUM_THUNDERX2 MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX2)
+ #define MIDR_BRCM_VULCAN MIDR_CPU_MODEL(ARM_CPU_IMP_BRCM, BRCM_CPU_PART_VULCAN)
  #define MIDR_QCOM_FALKOR_V1 MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR_V1)
+ #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
 +#define MIDR_QCOM_FALKOR MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR)
  
  #ifndef __ASSEMBLY__
  
