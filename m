From: Michael Neuling <mikey@neuling.org>
Subject: [PATCH] powerpc/of: add OF_DYNAMIC for chroma
Date: Mon, 20 Feb 2012 09:48:01 +1100
Message-ID: <5145.1329691681@neuling.org>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:32805 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754026Ab2BSWsF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Feb 2012 17:48:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jimi Xenidis <jimix@pobox.com>, grant.likely@secretlab.ca
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org

linux next-20120217 compiling ppc64e_defconfig fails with:

arch/powerpc/platforms/wsp/h8.c: In function 'wsp_h8_getaddr':
arch/powerpc/platforms/wsp/h8.c:116: error: implicit declaration of function 'of_detach_node'

The below fixes this by selecting the new OF_DYNAMIC when PPC_CHROMA.

Signed-off-by: Michael Neuling <mikey@neuling.org>

diff --git a/arch/powerpc/platforms/wsp/Kconfig b/arch/powerpc/platforms/wsp/Kconfig
index 57d22a2..79d2225 100644
--- a/arch/powerpc/platforms/wsp/Kconfig
+++ b/arch/powerpc/platforms/wsp/Kconfig
@@ -25,6 +25,7 @@ config PPC_CHROMA
 	bool "PowerEN PCIe Chroma Card"
 	select EPAPR_BOOT
 	select PPC_WSP
+	select OF_DYNAMIC
 	default y
 
 endmenu
