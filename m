From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 12 Oct 2016 13:40:10 +1100
Message-ID: <20161012134010.5d88d2c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753055AbcJLCkd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Oct 2016 22:40:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/list.h:8:0,
                 from include/linux/kobject.h:20,
                 from include/linux/device.h:17,
                 from arch/powerpc/include/asm/io.h:27,
                 from include/linux/kexec.h:17,
                 from arch/powerpc/kernel/machine_kexec_64.c:13:
arch/powerpc/kernel/machine_kexec_64.c: In function 'arch_kexec_kernel_image_probe':
arch/powerpc/kernel/machine_kexec_64.c:420:29: error: 'kexec_file_loaders' undeclared (first use in this function)
  for (i = 0; i < ARRAY_SIZE(kexec_file_loaders); i++) {
                             ^
arch/powerpc/kernel/machine_kexec_64.c: In function 'setup_purgatory':
arch/powerpc/kernel/machine_kexec_64.c:568:27: error: 'SLAVE_CODE_SIZE' undeclared (first use in this function)
  slave_code_buf = kmalloc(SLAVE_CODE_SIZE, GFP_KERNEL);
                           ^
arch/powerpc/kernel/machine_kexec_64.c: In function 'setup_new_fdt':
arch/powerpc/kernel/machine_kexec_64.c:774:8: error: implicit declaration of function 'setup_ima_buffer' [-Werror=implicit-function-declaration]
  ret = setup_ima_buffer(image, fdt, chosen_node);
        ^

Caused by commits

  bbd24d7bb4cd ("powerpc: implement kexec_file_load")
  325f517062cb ("powerpc: ima: send the kexec buffer to the next kernel")

I applied the following fix patches for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Oct 2016 13:28:20 +1100
Subject: [PATCH] powerpc: include asm/ima.h for setup_ima_buffer

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/machine_kexec_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/machine_kexec_64.c b/arch/powerpc/kernel/machine_kexec_64.c
index 8dbaf636c95e..2d14d769fc76 100644
--- a/arch/powerpc/kernel/machine_kexec_64.c
+++ b/arch/powerpc/kernel/machine_kexec_64.c
@@ -31,6 +31,7 @@
 #include <asm/sections.h>	/* _end */
 #include <asm/prom.h>
 #include <asm/smp.h>
+#include <asm/ima.h>
 #include <asm/hw_breakpoint.h>
 #include <asm/asm-prototypes.h>
 
-- 
2.8.1

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Oct 2016 13:32:58 +1100
Subject: [PATCH] powerpc: disable KEXEC_FILE for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 40ee044f1915..c8bd188285d1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -463,6 +463,7 @@ config KEXEC_FILE
 	depends on PPC64
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
+	depends on BROKEN
 	help
 	  This is a new version of the kexec system call. This call is
 	  file based and takes in file descriptors as system call arguments
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
