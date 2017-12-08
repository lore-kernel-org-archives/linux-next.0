From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tpmdd tree with Linus' tree
Date: Fri, 8 Dec 2017 13:25:35 +1100
Message-ID: <20171208132536.0c55270d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54311 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752335AbdLHCZi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Dec 2017 21:25:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jarkko,

Today's linux-next merge of the tpmdd tree got a conflict in:

  MAINTAINERS

between commit:

  60fdb44a23cb ("MAINTAINERS: update TPM driver infrastructure changes")

from Linus' tree and commit:

  510230d28445 ("tpm: Update MAINTAINERS for Jason Gunthorpe")

from the tpmdd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 9fa8f576f5cf,3e099b360db3..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -13830,10 -13581,12 +13830,10 @@@ F:	drivers/platform/x86/toshiba-wmi.
  
  TPM DEVICE DRIVER
  M:	Peter Huewe <peterhuewe@gmx.de>
 -M:	Marcel Selhorst <tpmdd@selhorst.net>
  M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
- R:	Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
+ R:	Jason Gunthorpe <jgg@ziepe.ca>
 -W:	http://tpmdd.sourceforge.net
 -L:	tpmdd-devel@lists.sourceforge.net (moderated for non-subscribers)
 -Q:	https://patchwork.kernel.org/project/tpmdd-devel/list/
 +L:	linux-integrity@vger.kernel.org
 +Q:	https://patchwork.kernel.org/project/linux-integrity/list/
  T:	git git://git.infradead.org/users/jjs/linux-tpmdd.git
  S:	Maintained
  F:	drivers/char/tpm/
