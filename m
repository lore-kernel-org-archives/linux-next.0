From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the livepatching tree with Linus' tree
Date: Mon, 18 Apr 2016 14:23:23 +1000
Message-ID: <20160418142323.26fa9ae1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56960 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbcDREX0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Apr 2016 00:23:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Li Zhang <zhlcindy@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Jiri,

Today's linux-next merge of the livepatching tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  7f2bd0063342 ("powerpc/mm: enable page parallel initialisation")

from Linus' tree and commit:

  85baa095497f ("powerpc/livepatch: Add live patching support on ppc64le")

from the livepatching tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Maybe the selects under config PPC should be sorted ...

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Kconfig
index fbebde0771c8,944a79a2768f..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -159,7 -159,7 +159,8 @@@ config PP
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
  	select HAVE_ARCH_SECCOMP_FILTER
  	select ARCH_HAS_UBSAN_SANITIZE_ALL
 +	select ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT
+ 	select HAVE_LIVEPATCH if HAVE_DYNAMIC_FTRACE_WITH_REGS
  
  config GENERIC_CSUM
  	def_bool CPU_LITTLE_ENDIAN
