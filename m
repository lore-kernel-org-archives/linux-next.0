From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the sparc tree
Date: Wed, 19 Apr 2017 10:14:56 +1000
Message-ID: <20170419101456.3c3fc713@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38375 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751977AbdDSAPA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 20:15:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, David Miller <davem@davemloft.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/sparc/Kconfig

between commit:

  395102db441a ("sparc64: Use LOCKDEP_SMALL, not PROVE_LOCKING_SMALL")

from the sparc tree and commit:

  28fa21828dbd ("HAVE_ARCH_HARDENED_USERCOPY is unconditional now")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/sparc/Kconfig
index a59deaef21e5,b577dbff5efb..000000000000
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@@ -42,8 -42,7 +42,7 @@@ config SPAR
  	select OLD_SIGSUSPEND
  	select ARCH_HAS_SG_CHAIN
  	select CPU_NO_EFFICIENT_FFS
- 	select HAVE_ARCH_HARDENED_USERCOPY
 -	select PROVE_LOCKING_SMALL if PROVE_LOCKING
 +	select LOCKDEP_SMALL if LOCKDEP
  	select ARCH_WANT_RELAX_ORDER
  
  config SPARC32
