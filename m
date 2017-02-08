From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the s390 tree
Date: Wed, 8 Feb 2017 12:37:03 +1100
Message-ID: <20170208123703.6165fbce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932077AbdBHBhF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Feb 2017 20:37:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/s390/Kconfig.debug

between commit:

  89175cf76686 ("s390: provide sclp based boot console")

from the s390 tree and commit:

  ad21fc4faa2a ("arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/Kconfig.debug
index 32b3e3bfd022,57f8ea9c49e3..000000000000
--- a/arch/s390/Kconfig.debug
+++ b/arch/s390/Kconfig.debug
@@@ -17,11 -17,4 +17,7 @@@ config S390_PTDUM
  	  kernel.
  	  If in doubt, say "N"
  
- config DEBUG_SET_MODULE_RONX
- 	def_bool y
- 	depends on MODULES
- 
 +config EARLY_PRINTK
 +	def_bool y
 +
  endmenu
