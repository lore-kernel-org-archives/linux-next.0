From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the char-misc tree
Date: Wed, 12 Apr 2017 15:18:59 +1000
Message-ID: <20170412151859.38f188a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750899AbdDLFTC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 01:19:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Escande <thierry.escande@collabora.com>

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/firmware/google/memconsole-x86-legacy.c:23:0:
arch/x86/include/uapi/asm/e820.h:66:23: error: 'E820_X_MAX' undeclared here (not in a function)
  struct e820entry map[E820_X_MAX];
                       ^

Caused by commit

  afe9dba4f9ae ("firmware: google memconsole: Move specific EBDA parts")

interacting with commit

  66441bd3cfdc ("x86/boot/e820: Move asm/e820.h to asm/e820/api.h")

from the tip tree.

I applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Apr 2017 15:12:12 +1000
Subject: [PATCH] firmware: google memconsole: merge fix for e820.h move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/firmware/google/memconsole-x86-legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/google/memconsole-x86-legacy.c b/drivers/firmware/google/memconsole-x86-legacy.c
index 529078c62488..99df2749c4c5 100644
--- a/drivers/firmware/google/memconsole-x86-legacy.c
+++ b/drivers/firmware/google/memconsole-x86-legacy.c
@@ -20,7 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/mm.h>
 #include <asm/bios_ebda.h>
-#include <asm/e820.h>
+#include <asm/e820/api.h>
 #include <linux/acpi.h>
 
 #include "memconsole.h"
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
