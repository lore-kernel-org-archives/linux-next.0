From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc-paulus tree with the
 powerpc tree
Date: Mon, 27 Jun 2016 14:23:52 +1000
Message-ID: <20160627142352.2c1ae65b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45136 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751629AbcF0EXz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2016 00:23:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Daniel Axtens <dja@axtens.net>

Hi Paul,

Today's linux-next merge of the kvm-ppc-paulus tree got a conflict in:

  arch/powerpc/kernel/traps.c

between commit:

  42f5b4cacd78 ("powerpc: Introduce asm-prototypes.h")

from the powerpc tree and commit:

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

diff --cc arch/powerpc/kernel/traps.c
index f7e2f2e318bd,9ec95daccad9..000000000000
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@@ -60,7 -60,7 +60,8 @@@
  #include <asm/switch_to.h>
  #include <asm/tm.h>
  #include <asm/debug.h>
 +#include <asm/asm-prototypes.h>
+ #include <asm/hmi.h>
  #include <sysdev/fsl_pci.h>
  
  #if defined(CONFIG_DEBUGGER) || defined(CONFIG_KEXEC)
