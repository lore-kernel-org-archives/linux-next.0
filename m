From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the mips tree
Date: Wed, 12 Apr 2017 09:39:01 +1000
Message-ID: <20170412093901.01dded8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752379AbdDKXjE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Apr 2017 19:39:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Cowgill <James.Cowgill@imgtec.com>

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/mips/Kconfig

between commit:

  3c81d1369703 ("MIPS: Opt into HAVE_COPY_THREAD_TLS")

from the mips tree and commit:

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

diff --cc arch/mips/Kconfig
index 52d81ca6f74e,81ce5b4b9251..000000000000
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -69,8 -68,6 +69,7 @@@ config MIP
  	select HANDLE_DOMAIN_IRQ
  	select HAVE_EXIT_THREAD
  	select HAVE_REGS_AND_STACK_ACCESS_API
- 	select HAVE_ARCH_HARDENED_USERCOPY
 +	select HAVE_COPY_THREAD_TLS
  
  menu "Machine selection"
  
