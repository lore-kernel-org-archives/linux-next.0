From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Mon, 29 Feb 2016 16:18:09 +1100
Message-ID: <20160229161809.1b8f36f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37646 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750822AbcB2FSM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 00:18:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Pinski <apinski@cavium.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/cpufeature.h

between commit:

  104a0c02e8b1 ("arm64: Add workaround for Cavium erratum 27456")

from the arm64 tree and commit:

  d0be74f771d5 ("arm64: Add ARM64_HAS_VIRT_HOST_EXTN feature")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cpufeature.h
index 1497163213ed,a5c769b1c65b..000000000000
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@@ -30,12 -30,12 +30,13 @@@
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
 +#define ARM64_WORKAROUND_CAVIUM_27456		12
  
 -#define ARM64_NCAPS				12
 +#define ARM64_NCAPS				13
  
  #ifndef __ASSEMBLY__
  
