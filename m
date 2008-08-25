From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree
Date: Mon, 25 Aug 2008 11:03:48 +1000
Message-ID: <20080825110348.9f5485ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45936 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752546AbYHYBDz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Aug 2008 21:03:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Ian Molton <spyro@f2s.com>

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mach-pxa/include/mach/irqs.h between commit
dec5abe9219aebf6d65e9af95de1c031d7039bdb ("[ARM] Fix eseries IRQ limit")
from Linus' tree and commit 44b6deaa10e0b62fc6d6db0b673f8bfa61b745d1
("[ARM] pxa: introduce PXA_HAVE_BOARD_IRQS") from the arm tree.

I used the version of that file from the arm tree and added the following
patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 72ba281..0d119f8 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -122,6 +122,7 @@ config MACH_TOSA
 config ARCH_PXA_ESERIES
 	bool "PXA based Toshiba e-series PDAs"
 	select PXA25x
+	select PXA_HAVE_BOARD_IRQS
 
 config MACH_E330
 	bool "Toshiba e330"
