From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc-paulus tree with the fsl
 tree
Date: Mon, 11 Jul 2016 16:05:27 +1000
Message-ID: <20160711160527.70a50968@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55805 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752406AbcGKGFa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 02:05:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>, Scott Wood <scottwood@freescale.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Christophe Leroy <christophe.leroy@c-s.fr>

Hi Paul,

Today's linux-next merge of the kvm-ppc-paulus tree got a conflict in:

  arch/powerpc/include/asm/paca.h

between commit:

  c223c90386bc ("powerpc32: provide VIRT_CPU_ACCOUNTING")

from the fsl tree and commit:

  fd7bacbca47a ("KVM: PPC: Book3S HV: Fix TB corruption in guest exit path on HMI interrupt")

from the kvm-ppc-paulus tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/paca.h
index ad171e979ab0,4b17bd058e01..000000000000
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@@ -25,7 -25,7 +25,8 @@@
  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
  #include <asm/kvm_book3s_asm.h>
  #endif
 +#include <asm/accounting.h>
+ #include <asm/hmi.h>
  
  register struct paca_struct *local_paca asm("r13");
  
