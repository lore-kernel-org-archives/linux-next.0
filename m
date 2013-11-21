From: Anton Blanchard <anton@samba.org>
Subject: [PATCH] powerpc: allyesconfig should not select
 CONFIG_CPU_LITTLE_ENDIAN
Date: Thu, 21 Nov 2013 16:33:55 +1100
Message-ID: <20131121163355.7b7d42a5@kryten>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:36579 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750902Ab3KUFd4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Nov 2013 00:33:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org, fengguang.wu@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>, imunsie@au1.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


Stephen reported a failure in an allyesconfig build.  
CONFIG_CPU_LITTLE_ENDIAN=y gets set but his toolchain is not
new enough to support little endian. We really want to
default to a big endian build; Ben suggested using a choice
which defaults to CPU_BIG_ENDIAN.

Signed-off-by: Anton Blanchard <anton@samba.org>
---

Index: b/arch/powerpc/platforms/Kconfig.cputype
===================================================================
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -404,13 +404,27 @@ config PPC_DOORBELL
 
 endmenu
 
-config CPU_LITTLE_ENDIAN
-	bool "Build little endian kernel"
-	default n
+choice
+	prompt "Endianness selection"
+	default CPU_BIG_ENDIAN
 	help
 	  This option selects whether a big endian or little endian kernel will
 	  be built.
 
+config CPU_BIG_ENDIAN
+	bool "Build big endian kernel"
+	help
+	  Build a big endian kernel.
+
+	  If unsure, select this option.
+
+config CPU_LITTLE_ENDIAN
+	bool "Build little endian kernel"
+	help
+	  Build a little endian kernel.
+
 	  Note that if cross compiling a little endian kernel,
 	  CROSS_COMPILE must point to a toolchain capable of targeting
 	  little endian powerpc.
+
+endchoice
