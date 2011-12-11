From: Michael Neuling <mikey@neuling.org>
Subject: [PATCH] powerpc: fix compile error with 85xx/p1022_ds.c
Date: Mon, 12 Dec 2011 09:49:14 +1100
Message-ID: <22284.1323643754@neuling.org>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:49574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752439Ab1LKWtP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Dec 2011 17:49:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kyle Moffett <Kyle.D.Moffett@boeing.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sfr@canb.auug.org.au, linux-next@vger.kernel.org

Current linux-next compiled with mpc85xx_defconfig causes this:
 arch/powerpc/platforms/85xx/p1022_ds.c:341:14: error: 'udbg_progress' undeclared here (not in a function)

Add include to fix this.

Signed-off-by: Michael Neuling <mikey@neuling.org>

diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index bb3d84f..b0984ad 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -25,6 +25,7 @@
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
+#include <asm/udbg.h>
 #include <asm/fsl_guts.h>
 #include "smp.h"
 
