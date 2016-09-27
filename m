From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Tue, 27 Sep 2016 16:03:26 +1000
Message-ID: <20160927160326.61ca28a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751499AbcI0GD3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 02:03:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Will Deacon <will.deacon@arm.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm/Kconfig

between commit:

  1d8f51d41fc7 ("arm/arm64: arch_timer: Use archdata to indicate vdso suitability")

from the arm64 tree and commit:

  7b4d24d8c01d ("atomic64: no need for CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/Kconfig
index 125657b602a4,2a50957c7bfb..000000000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -1,8 -1,6 +1,7 @@@
  config ARM
  	bool
  	default y
 +	select ARCH_CLOCKSOURCE_DATA
- 	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
  	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
