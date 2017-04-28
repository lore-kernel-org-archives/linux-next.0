From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm-ppc tree
Date: Fri, 28 Apr 2017 14:31:39 +1000
Message-ID: <20170428143139.0eec043b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1164489AbdD1Ebr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 Apr 2017 00:31:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paul,

After merging the kvm-ppc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kvm/book3s_xive.c: In function 'xive_debugfs_init':
arch/powerpc/kvm/book3s_xive.c:1852:52: error: 'powerpc_debugfs_root' undeclared (first use in this function)
  xive->dentry = debugfs_create_file(name, S_IRUGO, powerpc_debugfs_root,
                                                    ^

Caused by commit

  5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE interrupt controller")

interacting with commit

  7644d5819cf8 ("powerpc: Create asm/debugfs.h and move powerpc_debugfs_root there")

from the powerpc tree.

I have added the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 28 Apr 2017 14:28:17 +1000
Subject: [PATCH] powerpc: merge fix for powerpc_debugfs_root move.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kvm/book3s_xive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 7807ee17af4b..ffe1da95033a 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -24,6 +24,7 @@
 #include <asm/xive.h>
 #include <asm/xive-regs.h>
 #include <asm/debug.h>
+#include <asm/debugfs.h>
 #include <asm/time.h>
 #include <asm/opal.h>
 
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
