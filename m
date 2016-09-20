From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Sep 2016 16:53:41 +1000
Message-ID: <20160920165341.78ca6f45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33082 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751119AbcITGxo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 02:53:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/built-in.o: In function `.apply_relocate_add':
(.text+0x302e4): undefined reference to `.elf64_apply_relocate_add'

I needed to add the following merge resolution patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 20 Sep 2016 16:50:31 +1000
Subject: [PATCH] fix another merge resolution

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 8dca64f2851f..e59ed6af0523 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -125,7 +125,7 @@ obj-y				+= iomap.o
 endif
 
 ifneq ($(CONFIG_MODULES)$(CONFIG_KEXEC_FILE),)
-ifeq ($(CONFIG_WORD_SIZE),64)
+ifeq ($(BITS),64)
 obj-y				+= elf_util.o elf_util_64.o
 endif
 endif
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
