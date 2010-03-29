From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 17/17] arm: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:45 +0900
Message-ID: <1269885165-18617-18-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57110 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755415Ab0C2RxJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 13:53:09 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Russell King <linux@arm.linux.org.uk>

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <linux@arm.linux.org.uk>
---
 arch/arm/mach-vexpress/ct-ca9x4.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-vexpress/ct-ca9x4.c b/arch/arm/mach-vexpress/ct-ca9x4.c
index 5a0449c..b4b0bb4 100644
--- a/arch/arm/mach-vexpress/ct-ca9x4.c
+++ b/arch/arm/mach-vexpress/ct-ca9x4.c
@@ -2,6 +2,7 @@
  * Versatile Express Core Tile Cortex A9x4 Support
  */
 #include <linux/init.h>
+#include <linux/gfp.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/amba/bus.h>
-- 
1.6.4.2
