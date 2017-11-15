From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rseq tree with the powerpc tree
Date: Wed, 15 Nov 2017 15:35:42 +1100
Message-ID: <20171115153542.26623a3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756924AbdKOEfp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 23:35:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>

Hi Mathieu,

Today's linux-next merge of the rseq tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  32ce3862af3c ("powerpc/lib: Implement PMEM API")

from the powerpc tree and commit:

  ba4b152f3f2f ("membarrier: powerpc: Skip memory barrier in switch_mm() (v7)")

from the rseq tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Kconfig
index c51e6ce42e7a,e54a822e5fb9..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -139,7 -139,7 +139,8 @@@ config PP
  	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_FORTIFY_SOURCE
  	select ARCH_HAS_GCOV_PROFILE_ALL
+ 	select ARCH_HAS_MEMBARRIER_HOOKS
 +	select ARCH_HAS_PMEM_API                if PPC64
  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE
  	select ARCH_HAS_SG_CHAIN
  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
