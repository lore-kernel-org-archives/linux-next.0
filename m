From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with Linus' tree
Date: Wed, 17 Feb 2016 13:38:33 +1100
Message-ID: <20160217133833.2e5ff923@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34536 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753041AbcBQCif (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Feb 2016 21:38:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  drivers/clocksource/Kconfig

between commit:

  863ee050726b ("clocksource/drivers: Fix dependencies for !HAS_IOMEM archs")

from Linus' tree and commit:

  0219c41c9e0a ("clocksource/drivers/lpc32xx: Support timer-based ARM delay")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clocksource/Kconfig
index 33db7406c0e2,04954877d227..000000000000
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@@ -159,7 -152,8 +159,8 @@@ config CLKSRC_EFM3
  
  config CLKSRC_LPC32XX
  	bool "Clocksource for LPC32XX" if COMPILE_TEST
 -	depends on GENERIC_CLOCKEVENTS
 +	depends on GENERIC_CLOCKEVENTS && HAS_IOMEM
+ 	depends on ARM
  	select CLKSRC_MMIO
  	select CLKSRC_OF
  	help
