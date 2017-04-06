From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the s390 tree
Date: Fri, 7 Apr 2017 09:26:30 +1000
Message-ID: <20170407092630.7e020327@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755303AbdDFX0d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Apr 2017 19:26:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/s390/Kconfig

between commit:

  59cea29a34eb ("s390: remove HAVE_ARCH_EARLY_PFN_TO_NID select statement")

from the s390 tree and commit:

  37df4b8ce129 ("HAVE_ARCH_HARDENED_USERCOPY is unconditional now")

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

diff --cc arch/s390/Kconfig
index 249c2771be0e,b8b143432381..000000000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -124,7 -123,7 +124,6 @@@ config S39
  	select GENERIC_TIME_VSYSCALL
  	select HAVE_ALIGNED_STRUCT_PAGE if SLUB
  	select HAVE_ARCH_AUDITSYSCALL
- 	select HAVE_ARCH_HARDENED_USERCOPY
 -	select HAVE_ARCH_EARLY_PFN_TO_NID
  	select HAVE_ARCH_JUMP_LABEL
  	select CPU_NO_EFFICIENT_FFS if !HAVE_MARCH_Z9_109_FEATURES
  	select HAVE_ARCH_SECCOMP_FILTER
