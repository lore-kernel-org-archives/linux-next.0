From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with the powerpc-fixes
 tree
Date: Fri, 3 Feb 2017 09:04:18 +1100
Message-ID: <20170203090418.64ecc73b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751473AbdBBWEY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Feb 2017 17:04:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Blanchard <anton@samba.org>

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  f2574030b0e3 ("powerpc: Revert the initial stack protector support")

from the powerpc-fixes tree and commit:

  d6c569b99558 ("powerpc/64: Move HAVE_CONTEXT_TRACKING from pseries to common Kconfig")

from the powerpc tree.

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
index a46d1c0d14d3,33f5b8380a7d..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -164,9 -164,11 +164,10 @@@ config PP
  	select ARCH_HAS_SCALED_CPUTIME if VIRT_CPU_ACCOUNTING_NATIVE
  	select HAVE_ARCH_HARDENED_USERCOPY
  	select HAVE_KERNEL_GZIP
 -	select HAVE_CC_STACKPROTECTOR
+ 	select HAVE_CONTEXT_TRACKING if PPC64
  
  config GENERIC_CSUM
- 	def_bool CPU_LITTLE_ENDIAN
+ 	def_bool n
  
  config EARLY_PRINTK
  	bool
