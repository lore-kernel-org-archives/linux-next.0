From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 7 Mar 2017 13:38:43 +1100
Message-ID: <20170307133843.1e42787d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750993AbdCGCjJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Mar 2017 21:39:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/kernel/machine_kexec.c: In function 'machine_kexec':
arch/arm/kernel/machine_kexec.c:163:2: error: implicit declaration of function 'set_kernel_text_rw' [-Werror=implicit-function-declaration]
  set_kernel_text_rw();
  ^

Caused by patches

  treewide: move set_memory_* functions away from cacheflush.h
  treewide: decouple cacheflush.h and set_memory.h

I have added this fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 7 Mar 2017 13:28:38 +1100
Subject: [PATCH] treewide-decouple-cacheflushh-and-set_memoryh-fix-7

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/kernel/machine_kexec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index b18c1ea56bed..80f48f522b0c 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -14,6 +14,7 @@
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
 #include <asm/cacheflush.h>
+#include <asm/set_memory.h>
 #include <asm/fncpy.h>
 #include <asm/mach-types.h>
 #include <asm/smp_plat.h>
-- 
2.11.0

Which lead to (again in the arm multi_v7_defconfig build):

drivers/misc/sram-exec.c: In function 'sram_exec_copy':
drivers/misc/sram-exec.c:93:2: error: implicit declaration of function 'set_memory_nx' [-Werror=implicit-function-declaration]
  set_memory_nx((unsigned long)base, pages);
  ^
drivers/misc/sram-exec.c:94:2: error: implicit declaration of function 'set_memory_rw' [-Werror=implicit-function-declaration]
  set_memory_rw((unsigned long)base, pages);
  ^
drivers/misc/sram-exec.c:98:2: error: implicit declaration of function 'set_memory_ro' [-Werror=implicit-function-declaration]
  set_memory_ro((unsigned long)base, pages);
  ^
drivers/misc/sram-exec.c:99:2: error: implicit declaration of function 'set_memory_x' [-Werror=implicit-function-declaration]
  set_memory_x((unsigned long)base, pages);
  ^

For which I added:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 7 Mar 2017 13:34:58 +1100
Subject: [PATCH] treewide-decouple-cacheflushh-and-set_memoryh-fix-8

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/misc/sram-exec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/sram-exec.c b/drivers/misc/sram-exec.c
index ac522417c462..225300bb5510 100644
--- a/drivers/misc/sram-exec.c
+++ b/drivers/misc/sram-exec.c
@@ -19,6 +19,7 @@
 #include <linux/sram.h>
 
 #include <asm/cacheflush.h>
+#include <asm/set_memory.h>
 
 #include "sram.h"
 
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
