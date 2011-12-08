From: Michael Neuling <mikey@neuling.org>
Subject: [PATCH] powerpc: fix compile error with 85xx/p1023_rds.c
Date: Thu, 08 Dec 2011 17:10:54 +1100
Message-ID: <7679.1323324654@neuling.org>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42338 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750768Ab1LHGK6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Dec 2011 01:10:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kyle Moffett <Kyle.D.Moffett@boeing.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <michaele@au1.ibm.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org

Current linux-next compiled with mpc85xx_smp_defconfig causes this:
arch/powerpc/platforms/85xx/p1023_rds.c: In function 'mpc85xx_rds_pic_init':
arch/powerpc/platforms/85xx/p1023_rds.c:102:14: error: 'np' undeclared (first use in this function)
arch/powerpc/platforms/85xx/p1023_rds.c:102:14: note: each undeclared identifier is reported only once for each function it appears in

Introduced in: 
  commit 996983b75cebb1bc1c2c545f20336f24ebfa17af
  Author: Kyle Moffett <Kyle.D.Moffett@boeing.com>
  Date:   Fri Dec 2 06:28:02 2011 +0000
  powerpc/mpic: Search for open-pic device-tree node if NULL

Signed-off-by: Michael Neuling <mikey@neuling.org>

diff --git a/arch/powerpc/platforms/85xx/p1023_rds.c b/arch/powerpc/platforms/85xx/p1023_rds.c
index e92a714..d951e70 100644
--- a/arch/powerpc/platforms/85xx/p1023_rds.c
+++ b/arch/powerpc/platforms/85xx/p1023_rds.c
@@ -99,7 +99,6 @@ static void __init mpc85xx_rds_pic_init(void)
 		0, 256, " OpenPIC  ");
 
 	BUG_ON(mpic == NULL);
-	of_node_put(np);
 
 	mpic_init(mpic);
 }
