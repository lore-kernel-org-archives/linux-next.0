From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pinctrl tree with the mvebu tree
Date: Thu, 25 May 2017 11:47:39 +1000
Message-ID: <20170525114739.1d8d0a3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751332AbdEYBrm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 May 2017 21:47:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Hi Linus,

Today's linux-next merge of the pinctrl tree got a conflict in:

  MAINTAINERS

between commit:

  e7c1572f6565 ("MAINTAINERS: sort F entries for Marvell EBU maintainers")

from the mvebu tree and commit:

  15accb3cbbcd ("MAINTAINERS: extend mvebu SoC entry with pinctrl drivers")

from the pinctrl tree.

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
index d724ab4b717f,d023b172e3af..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -1489,15 -1489,14 +1489,16 @@@ M:	Gregory Clement <gregory.clement@fre
  M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
 -F:	arch/arm/mach-mvebu/
 -F:	drivers/rtc/rtc-armada38x.c
  F:	arch/arm/boot/dts/armada*
  F:	arch/arm/boot/dts/kirkwood*
 +F:	arch/arm/configs/mvebu_*_defconfig
 +F:	arch/arm/mach-mvebu/
  F:	arch/arm64/boot/dts/marvell/armada*
  F:	drivers/cpufreq/mvebu-cpufreq.c
 +F:	drivers/irqchip/irq-armada-370-xp.c
 +F:	drivers/irqchip/irq-mvebu-*
+ F:	drivers/pinctrl/mvebu/
 -F:	arch/arm/configs/mvebu_*_defconfig
 +F:	drivers/rtc/rtc-armada38x.c
  
  ARM/Marvell Berlin SoC support
  M:	Jisheng Zhang <jszhang@marvell.com>
