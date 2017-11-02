From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the powerpc tree
Date: Thu, 2 Nov 2017 17:49:36 +1100
Message-ID: <20171102174936.7cc061cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750883AbdKBGtj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 02:49:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

arch/powerpc/kernel/irq.o: In function `.replay_system_reset':
irq.c:(.text+0x10): undefined reference to `.ppc_save_regs'

Caused by commit

  78adf6c214f0 ("powerpc/64s: Implement system reset idle wakeup reason")

I have applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 Nov 2017 17:45:18 +1100
Subject: [PATCH] powerpc/64s: ppc_save_regs is now needed for all 64s builds

Fixes: 78adf6c214f0 ("powerpc/64s: Implement system reset idle wakeup reason")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 91960f83039c..34b6e729f38c 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -128,7 +128,7 @@ obj64-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= tm.o
 obj-$(CONFIG_PPC64)		+= $(obj64-y)
 obj-$(CONFIG_PPC32)		+= $(obj32-y)
 
-ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE),)
+ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)(CONFIG_PPC_BOOK3S),)
 obj-y				+= ppc_save_regs.o
 endif
 
-- 
2.14.1

-- 
Cheers,
Stephen Rothwell
