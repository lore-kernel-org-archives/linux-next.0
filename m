From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 14 Feb 2017 16:59:33 +1100
Message-ID: <20170214165933.13ebd4f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44297 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750751AbdBNF7k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Feb 2017 00:59:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anju T <anju@linux.vnet.ibm.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/lib/code-patching.c:61:16: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'is_conditional_branch'
 bool __kprobes is_conditional_branch(unsigned int instr)
                ^

Caused by commit

  916c821aaf13 ("kprobes: move kprobe declarations to asm-generic/kprobes.h")

interacting with commit

  51c9c0843993 ("powerpc/kprobes: Implement Optprobes")

from the powerpc tree.

I have applied this merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 14 Feb 2017 16:56:11 +1100
Subject: [PATCH] powerpc/kprobes: fixup for kprobes declarations moving

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/lib/code-patching.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 0899315e1434..0d3002b7e2b4 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -14,6 +14,7 @@
 #include <asm/page.h>
 #include <asm/code-patching.h>
 #include <linux/uaccess.h>
+#include <linux/kprobes.h>
 
 
 int patch_instruction(unsigned int *addr, unsigned int instr)
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
