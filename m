From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] x86/mrst: force support code to be built
Date: Sat, 13 Nov 2010 08:44:37 -0800
Message-ID: <20101113084437.a9707260.randy.dunlap@oracle.com>
References: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:33183 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755712Ab0KMQpR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Nov 2010 11:45:17 -0500
In-Reply-To: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix mrst.c build: make sure that its called functions are built.

arch/x86/built-in.o: In function `mrst_reboot':
mrst.c:(.text+0x2250b): undefined reference to `intel_scu_ipc_simple_command'
arch/x86/built-in.o: In function `mrst_power_off':
mrst.c:(.text+0x2252e): undefined reference to `intel_scu_ipc_simple_command'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20101112.orig/arch/x86/Kconfig
+++ linux-next-20101112/arch/x86/Kconfig
@@ -387,6 +387,7 @@ config X86_MRST
 	select APB_TIMER
 	select I2C
 	select SPI
+	select X86_PLATFORM_DEVICES
 	---help---
 	  Moorestown is Intel's Low Power Intel Architecture (LPIA) based Moblin
 	  Internet Device(MID) platform. Moorestown consists of two chips:
