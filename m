From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] sh: fix up the machtypes.h move.
Date: Mon, 28 Sep 2009 16:33:27 +0900
Message-ID: <20090928073327.GC6668@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:52096 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432AbZI1HeB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2009 03:34:01 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org

rts7751r2d PCI support is referencing the old asm/ version.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 arch/sh/drivers/pci/fixups-rts7751r2d.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/drivers/pci/fixups-rts7751r2d.c b/arch/sh/drivers/pci/fixups-rts7751r2d.c
index 052b354..7898f14 100644
--- a/arch/sh/drivers/pci/fixups-rts7751r2d.c
+++ b/arch/sh/drivers/pci/fixups-rts7751r2d.c
@@ -15,7 +15,7 @@
 #include <mach/lboxre2.h>
 #include <mach/r2d.h>
 #include "pci-sh4.h"
-#include <asm/machtypes.h>
+#include <generated/machtypes.h>
 
 #define PCIMCR_MRSET_OFF	0xBFFFFFFF
 #define PCIMCR_RFSH_OFF		0xFFFFFFFB
