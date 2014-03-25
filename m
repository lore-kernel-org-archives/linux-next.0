From: Michael Neuling <mikey@neuling.org>
Subject: [PATCH] powerpc/opal: Add missing include
Date: Tue, 25 Mar 2014 11:43:08 +1100
Message-ID: <13762.1395708188@ale.ozlabs.ibm.com>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:36867 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751191AbaCYAnL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Mar 2014 20:43:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: sfr@canb.auug.org.au, Linux PPC dev <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org

next-20140324 currently fails compiling celleb_defconfig with:

arch/powerpc/include/asm/opal.h:894:42: error: 'struct notifier_block' declared inside parameter list [-Werror]
arch/powerpc/include/asm/opal.h:894:42: error: its scope is only this definition or declaration, which is probably not what you want [-Werror]
arch/powerpc/include/asm/opal.h:896:14: error: 'struct notifier_block' declared inside parameter list [-Werror]

This is due to a missing include which is added here.

Signed-off-by: Michael Neuling <mikey@neuling.org>

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index fe2aa0b..f57fb58 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -177,6 +177,8 @@ extern int opal_enter_rtas(struct rtas_args *args,
 
 #ifndef __ASSEMBLY__
 
+#include <linux/notifier.h>
+
 /* Other enums */
 enum OpalVendorApiTokens {
 	OPAL_START_VENDOR_API_RANGE = 1000, OPAL_END_VENDOR_API_RANGE = 1999
