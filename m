From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the powerpc tree
Date: Mon, 18 Jul 2016 13:03:15 +1000
Message-ID: <20160718130315.314f8a77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44598 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062AbcGRDDR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jul 2016 23:03:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@c-s.fr>

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  c223c90386bc ("powerpc32: provide VIRT_CPU_ACCOUNTING")

from the powerpc tree and commit:

  006d998dda94 ("powerpc/uaccess: Enable hardened usercopy")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Michael: time to sort these selects?
-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Kconfig
index fcfe5332416f,b7a18b2604be..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -165,7 -164,7 +165,8 @@@ config PP
  	select ARCH_HAS_UBSAN_SANITIZE_ALL
  	select ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT
  	select HAVE_LIVEPATCH if HAVE_DYNAMIC_FTRACE_WITH_REGS
 +	select HAVE_VIRT_CPU_ACCOUNTING
+ 	select HAVE_ARCH_HARDENED_USERCOPY
  
  config GENERIC_CSUM
  	def_bool CPU_LITTLE_ENDIAN
