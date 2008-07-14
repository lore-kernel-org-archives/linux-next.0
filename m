From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] powerpc: mman.h export fixups
Date: Mon, 14 Jul 2008 19:25:57 +1000
Message-ID: <20080714192557.331a50f5.sfr@canb.auug.org.au>
References: <20080714170301.93f940fd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35291 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756216AbYGNJZ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 05:25:59 -0400
In-Reply-To: <20080714170301.93f940fd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: ppc-dev <linuxppc-dev@ozlabs.org>, Dave Kleikamp <shaggy@linux.vnet.ibm.com>, linux-next@vger.kernel.org

Commit ef3d3246a0d06be622867d21af25f997aeeb105f ("powerpc/mm: Add Strong
Access Ordering support") in the powerpc/{next,master} tree caused the
following in a powerpc allmodconfig build:

usr/include/asm/mman.h requires linux/mm.h, which does not exist in exported headers

We should not use CONFIG_PPC64 in an unprotected (by __KERNEL__)
section of an exported include file and linux/mm.h is not exported.  So
protect the whole section that is CONFIG_PPC64 with __KERNEL__ and put
the two introduced includes in there as well.

CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/asm-powerpc/Kbuild |    2 +-
 include/asm-powerpc/mman.h |    8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

I have included this patch in today's linux-next tree.

diff --git a/include/asm-powerpc/Kbuild b/include/asm-powerpc/Kbuild
index 34a0a8d..329ecfd 100644
--- a/include/asm-powerpc/Kbuild
+++ b/include/asm-powerpc/Kbuild
@@ -2,7 +2,6 @@ include include/asm-generic/Kbuild.asm
 
 header-y += auxvec.h
 header-y += ioctls.h
-header-y += mman.h
 header-y += sembuf.h
 header-y += siginfo.h
 header-y += stat.h
@@ -28,6 +27,7 @@ unifdef-y += byteorder.h
 unifdef-y += cputable.h
 unifdef-y += elf.h
 unifdef-y += nvram.h
+unifdef-y += mman.h
 unifdef-y += param.h
 unifdef-y += posix_types.h
 unifdef-y += ptrace.h
diff --git a/include/asm-powerpc/mman.h b/include/asm-powerpc/mman.h
index f8a32e2..9209f75 100644
--- a/include/asm-powerpc/mman.h
+++ b/include/asm-powerpc/mman.h
@@ -1,9 +1,7 @@
 #ifndef _ASM_POWERPC_MMAN_H
 #define _ASM_POWERPC_MMAN_H
 
-#include <asm/cputable.h>
 #include <asm-generic/mman.h>
-#include <linux/mm.h>
 
 /*
  * This program is free software; you can redistribute it and/or
@@ -28,7 +26,12 @@
 #define MAP_POPULATE	0x8000		/* populate (prefault) pagetables */
 #define MAP_NONBLOCK	0x10000		/* do not block on IO */
 
+#ifdef __KERNEL__
 #ifdef CONFIG_PPC64
+
+#include <asm/cputable.h>
+#include <linux/mm.h>
+
 /*
  * This file is included by linux/mman.h, so we can't use cacl_vm_prot_bits()
  * here.  How important is the optimization?
@@ -56,4 +59,5 @@ static inline int arch_validate_prot(unsigned long prot)
 #define arch_validate_prot(prot) arch_validate_prot(prot)
 
 #endif /* CONFIG_PPC64 */
+#endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_MMAN_H */
-- 
1.5.6.2
