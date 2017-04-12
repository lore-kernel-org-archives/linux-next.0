From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Apr 2017 14:20:41 +1000
Message-ID: <20170412142041.377473ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34939 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750908AbdDLEUo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 00:20:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/mmu.c

between commit:

  66441bd3cfdc ("x86/boot/e820: Move asm/e820.h to asm/e820/api.h")

from the tip tree and commit:

  5159dc315db8 ("x86/xen: split off mmu_pv.c")

from the xen-tip tree.

The code changed in the former was moved to a new file by the latter,
so I applied the following merge fix patch.

This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Apr 2017 14:17:58 +1000
Subject: [PATCH] x86/xen: merge fix up for arch/x86/xen/mmu.c code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/xen/mmu_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 284d189f40dd..c98bfb9f0248 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -58,7 +58,7 @@
 #include <asm/mmu_context.h>
 #include <asm/setup.h>
 #include <asm/paravirt.h>
-#include <asm/e820.h>
+#include <asm/e820/api.h>
 #include <asm/linkage.h>
 #include <asm/page.h>
 #include <asm/init.h>
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
