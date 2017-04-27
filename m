From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the s390 tree
Date: Thu, 27 Apr 2017 10:50:54 +1000
Message-ID: <20170427105054.65dff661@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S937891AbdD0Au7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Apr 2017 20:50:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harald Freudenberger <freude@linux.vnet.ibm.com>, Sean Wang <sean.wang@mediatek.com>

Hi Herbert,

Today's linux-next merge of the crypto tree got conflicts in:

  drivers/char/hw_random/Makefile
  drivers/char/hw_random/Kconfig

between commit:

  bbcb478e3fef ("s390/trng: Introduce s390 TRNG device driver.")

from the s390 tree and commit:

  7701d1ff8ed1 ("hwrng: mtk - Add driver for hardware random generator on MT7623 SoC")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/char/hw_random/Kconfig
index b9918fb9587d,fd34121934e5..000000000000
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@@ -423,20 -409,20 +409,34 @@@ config HW_RANDOM_CAVIU
  
           If unsure, say Y.
  
 +config HW_RANDOM_S390
 +	tristate "S390 True Random Number Generator support"
 +	depends on S390
 +	default HW_RANDOM
 +	---help---
 +	  This driver provides kernel-side support for the True
 +	  Random Number Generator available as CPACF extension
 +	  on modern s390 hardware platforms.
 +
 +	  To compile this driver as a module, choose M here: the
 +	  module will be called s390-trng.
 +
 +	  If unsure, say Y.
 +
+ config HW_RANDOM_MTK
+ 	tristate "Mediatek Random Number Generator support"
+ 	depends on HW_RANDOM
+ 	depends on ARCH_MEDIATEK || COMPILE_TEST
+ 	default y
+ 	---help---
+ 	  This driver provides kernel-side support for the Random Number
+ 	  Generator hardware found on Mediatek SoCs.
+ 
+ 	  To compile this driver as a module, choose M here. the
+ 	  module will be called mtk-rng.
+ 
+ 	  If unsure, say Y.
+ 
  endif # HW_RANDOM
  
  config UML_RANDOM
diff --cc drivers/char/hw_random/Makefile
index dd1765246255,de6ea808bd3c..000000000000
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@@ -36,4 -35,4 +35,5 @@@ obj-$(CONFIG_HW_RANDOM_STM32) += stm32-
  obj-$(CONFIG_HW_RANDOM_PIC32) += pic32-rng.o
  obj-$(CONFIG_HW_RANDOM_MESON) += meson-rng.o
  obj-$(CONFIG_HW_RANDOM_CAVIUM) += cavium-rng.o cavium-rng-vf.o
 +obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
+ obj-$(CONFIG_HW_RANDOM_MTK)	+= mtk-rng.o
