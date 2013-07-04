From: Cristian Bercaru <cristian.bercaru@freescale.com>
Subject: [PATCH] invoke arguments the right way in coccinelle script
Date: Thu, 4 Jul 2013 19:25:22 +0300
Message-ID: <1372955122-6480-1-git-send-email-cristian.bercaru@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]:27976
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756657Ab3GDQZd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2013 12:25:33 -0400
Received: from mail192-co1 (localhost [127.0.0.1])	by
 mail192-co1-R.bigfish.com (Postfix) with ESMTP id 51829C60C24	for
 <linux-next@vger.kernel.org>; Thu,  4 Jul 2013 16:25:32 +0000 (UTC)
Received: from CO1EHSMHS017.bigfish.com (unknown [10.243.78.233])	by
 mail192-co1.bigfish.com (Postfix) with ESMTP id 370E6A40045	for
 <linux-next@vger.kernel.org>; Thu,  4 Jul 2013 16:25:31 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Cristian Bercaru <cristian.bercaru@freescale.com>

Because the command line arguments were invoked incorrectly
'make coccicheck' failed to run 'irqf_oneshot.cocci' and all tests that
followed. Fixed that.

Signed-off-by: Cristian Bercaru <cristian.bercaru@freescale.com>
---
 scripts/coccinelle/misc/irqf_oneshot.cocci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/misc/irqf_oneshot.cocci b/scripts/coccinelle/misc/irqf_oneshot.cocci
index 6cfde94..5cca680 100644
--- a/scripts/coccinelle/misc/irqf_oneshot.cocci
+++ b/scripts/coccinelle/misc/irqf_oneshot.cocci
@@ -4,7 +4,7 @@
 //
 // Confidence: Good
 // Comments:
-// Options: --no-includes
+// Options: -no_includes
 
 virtual patch
 virtual context
-- 
1.7.11.7
