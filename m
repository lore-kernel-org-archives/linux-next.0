From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: linux-next: Tree for Feb 3 (arc:defconfig build failure)
Date: Tue, 03 Feb 2015 14:07:48 -0500
Message-ID: <54D11C84.2060606@hurleysoftware.com>
References: <20150203182010.73624992@canb.auug.org.au> <20150203184218.GA20822@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:47148 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966250AbbBCTHu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 14:07:50 -0500
Received: by mail-qa0-f48.google.com with SMTP id v8so35129873qal.7
        for <linux-next@vger.kernel.org>; Tue, 03 Feb 2015 11:07:49 -0800 (PST)
In-Reply-To: <20150203184218.GA20822@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>

On 02/03/2015 01:42 PM, Guenter Roeck wrote:
> On Tue, Feb 03, 2015 at 06:20:10PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150202:
>>
>> The target-updates tree gained a conflict against Linus' tree.
>>
>> The clk tree gained conflicts against the arm-soc tree.
>>
>> Non-merge commits (relative to Linus' tree): 7173
>>  7143 files changed, 301126 insertions(+), 167764 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
> Building arc:defconfig ... failed
> --------------
> Error log:
> 
> drivers/built-in.o: In function `of_setup_earlycon':
> (.init.text+0xb3e): undefined reference to `arc_early_base_baud'
> drivers/built-in.o: In function `setup_earlycon':
> (.init.text+0xcd0): undefined reference to `arc_early_base_baud'
> make: *** [vmlinux] Error 1
> 
> This is due to "ARC: Dynamically determine BASE_BAUD from DeviceTree".
> arc:defconfig does not define CONFIG_SERIAL_8250 and thus also not
> CONFIG_SERIAL_8250_CONSOLE, but it looks like it is mandatory
> after this patch.
> 
> Guenter

Thanks for the report. Does the patch below fix the build breakage?

Regards,
Peter Hurley

--- >% ---
Subject: [PATCH] ARC: Fix earlycon build breakage

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
