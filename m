From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the reset tree with Linus' tree
Date: Mon, 24 Jul 2017 10:24:46 +1000
Message-ID: <20170724102446.6650d65e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: linux-next.vger.kernel.org

Hi Philipp,

Today's linux-next merge of the reset tree got a conflict in:

  MAINTAINERS

between commit:

  82abbea734d6 ("MAINTAINERS: fix alphabetical ordering")

from Linus' tree and commit:

  e0be864f1424 ("ARC: reset: introduce HSDKv1 reset driver")

from the reset tree.

I suspect that I may get a few of these.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index f66488dfdbc9,57853844969b..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12606,35 -12752,6 +12606,42 @@@ F:	arch/arc/plat-axs10
  F:	arch/arc/boot/dts/ax*
  F:	Documentation/devicetree/bindings/arc/axs10*
  
 +SYNOPSYS DESIGNWARE DMAC DRIVER
 +M:	Viresh Kumar <vireshk@kernel.org>
 +M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 +S:	Maintained
 +F:	include/linux/dma/dw.h
 +F:	include/linux/platform_data/dma-dw.h
 +F:	drivers/dma/dw/
 +
 +SYNOPSYS DESIGNWARE ENTERPRISE ETHERNET DRIVER
 +M:	Jie Deng <jiedeng@synopsys.com>
 +L:	netdev@vger.kernel.org
 +S:	Supported
 +F:	drivers/net/ethernet/synopsys/
 +
 +SYNOPSYS DESIGNWARE I2C DRIVER
 +M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 +R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 +R:	Mika Westerberg <mika.westerberg@linux.intel.com>
 +L:	linux-i2c@vger.kernel.org
 +S:	Maintained
 +F:	drivers/i2c/busses/i2c-designware-*
 +F:	include/linux/platform_data/i2c-designware.h
 +
 +SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 +M:	Jaehoon Chung <jh80.chung@samsung.com>
 +L:	linux-mmc@vger.kernel.org
 +S:	Maintained
 +F:	drivers/mmc/host/dw_mmc*
 +
++SYNOPSYS HSDK RESET CONTROLLER DRIVER
++M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
++S:	Supported
++F:	drivers/reset/reset-hsdk-v1.c
++F:	include/dt-bindings/reset/snps,hsdk-v1-reset.h
++F:	Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt
++
  SYSTEM CONFIGURATION (SYSCON)
  M:	Lee Jones <lee.jones@linaro.org>
  M:	Arnd Bergmann <arnd@arndb.de>
