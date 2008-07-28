From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Mon, 28 Jul 2008 14:44:40 +1000
Message-ID: <20080728144440.74e28e8b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52458 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750922AbYG1Eop (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 00:44:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Karsten Keil <kkeil@suse.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>

Hi Karsten,

(Previously reported by Dave Miller for Sparc)

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/isdn/hardware/mISDN/hfcmulti.c:5255:2: error: #error "not running on big endian machines now"

I just disabled it using the patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From c4f3c0cba3811f71465c332fe36fe30b3b17f507 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Jul 2008 14:38:29 +1000
Subject: [PATCH] hfcmulti is not supported on big endian

So stick it to X86 for now.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/isdn/hardware/mISDN/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/Kconfig b/drivers/isdn/hardware/mISDN/Kconfig
index 9cd5f5f..1a78575 100644
--- a/drivers/isdn/hardware/mISDN/Kconfig
+++ b/drivers/isdn/hardware/mISDN/Kconfig
@@ -16,6 +16,7 @@ config MISDN_HFCMULTI
 	tristate "Support for HFC multiport cards (HFC-4S/8S/E1)"
 	depends on PCI
 	depends on MISDN
+	depends on X86
 	help
 	  Enable support for cards with Cologne Chip AG's HFC multiport
 	  chip. There are three types of chips that are quite similar,
-- 
1.5.6.3
