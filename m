From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH -next] ARC: Fix earlycon build breakage
Date: Tue,  3 Feb 2015 20:08:52 -0500
Message-ID: <1423012132-9149-1-git-send-email-peter@hurleysoftware.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:34329 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754585AbbBDBJS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 20:09:18 -0500
Received: by mail-qg0-f46.google.com with SMTP id j5so280624qga.5
        for <linux-next@vger.kernel.org>; Tue, 03 Feb 2015 17:09:17 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Vineet Gupta <vgupta@synopsys.com>, Guenter Roeck <linux@roeck-us.net>, Peter Hurley <peter@hurleysoftware.com>

Commit ffb7fcd66f14 ("ARC: Dynamically determine BASE_BAUD from DeviceTree")
breaks arc:defconfig build:

       drivers/built-in.o: In function `of_setup_earlycon':
       (.init.text+0xb3e): undefined reference to `arc_early_base_baud'
       drivers/built-in.o: In function `setup_earlycon':
       (.init.text+0xcd0): undefined reference to `arc_early_base_baud'
       make: *** [vmlinux] Error 1

BASE_BAUD is only required for earlycon, which should depend on
CONFIG_SERIAL_EARLYCON.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 arch/arc/kernel/devtree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 5036d4c..e32b54a 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -17,7 +17,7 @@
 #include <asm/clk.h>
 #include <asm/mach_desc.h>
 
-#ifdef CONFIG_SERIAL_8250_CONSOLE
+#ifdef CONFIG_SERIAL_EARLYCON
 
 static unsigned int __initdata arc_base_baud;
 
-- 
2.2.2
