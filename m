From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 18 Jul 2016 18:29:22 +1000
Message-ID: <20160718182922.7b41f923@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54272 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751676AbcGRI30 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 04:29:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

In file included from arch/x86/kernel/x8664_ksyms_64.c:10:0:
arch/x86/include/asm/pgtable.h:38:8: error: unknown type name 'spinlock_t'
 extern spinlock_t pgd_lock;
        ^

Probably caused by commit

  186f43608a5c ("x86/kernel: Audit and remove any unnecessary uses of module.h")

I added this patch for today (maybe adding the include to
arch/x86/include/asm/pgtable.h would be better?):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Jul 2016 18:23:24 +1000
Subject: [PATCH] x86/kernel: include spinlock_types.h for missing spinlock_t

Fixes: 186f43608a5c ("x86/kernel: Audit and remove any unnecessary uses of module.h")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/x8664_ksyms_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/x8664_ksyms_64.c b/arch/x86/kernel/x8664_ksyms_64.c
index f6d30fedcc03..95e49f6e4fc3 100644
--- a/arch/x86/kernel/x8664_ksyms_64.c
+++ b/arch/x86/kernel/x8664_ksyms_64.c
@@ -2,6 +2,7 @@
    All C exports should go in the respective C files. */
 
 #include <linux/export.h>
+#include <linux/spinlock_types.h>
 #include <linux/smp.h>
 
 #include <net/checksum.h>
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
