From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 omap_dss2 tree
Date: Mon, 24 Aug 2015 20:53:32 +1000
Message-ID: <20150824205332.3ecb165a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53467 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932242AbbHXKxe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Aug 2015 06:53:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolai Stange <nicstange@gmail.com>, Yuriy Kolerov <yuriy.kolerov@synopsys.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/video/console/Kconfig

between commit:

  48fd8ecf29e3 ("framebuffer: disable vgacon on microblaze arch")

from the omap_dss2 tree and commit:

  4b9939fb41ee ("drivers/video/concole: add negative dependency for VGA_CONSOLE on ARC")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

Another place begging for a controlling CONFIG_ symbol that other
places can select (or a negative symbol).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/video/console/Kconfig
index e0dc0fee4ea6,071280643db7..000000000000
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@@ -9,7 -9,7 +9,7 @@@ config VGA_CONSOL
  	depends on !4xx && !8xx && !SPARC && !M68K && !PARISC && !FRV && \
  		!SUPERH && !BLACKFIN && !AVR32 && !MN10300 && !CRIS && \
  		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
- 		!ARM64 && !MICROBLAZE
 -		!ARM64 && !ARC
++		!ARM64 && !MICROBLAZE && !ARC
  	default y
  	help
  	  Saying Y here will allow you to use Linux in text mode through a
