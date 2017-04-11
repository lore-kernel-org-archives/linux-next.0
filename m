From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Wed, 12 Apr 2017 08:34:04 +1000
Message-ID: <20170412083404.76cda3b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38545 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752010AbdDKWeI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Apr 2017 18:34:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, ARM <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>

Hi all,

Today's linux-next merge of the mvebu tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  3c9d36192802 ("arm64: set CONFIG_MMC_BCM2835=y in defconfig")

from the arm-soc tree and commit:

  6ff829553345 ("arm64: configs: enable SDHCI driver for Xenon")

from the mvebu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

BTW, that arm-soc commit has no Signed-off-by from its committer :-(

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index ab4461b6b226,93b0aab959c0..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -402,7 -401,7 +402,8 @@@ CONFIG_MMC_DW_EXYNOS=
  CONFIG_MMC_DW_K3=y
  CONFIG_MMC_DW_ROCKCHIP=y
  CONFIG_MMC_SUNXI=y
 +CONFIG_MMC_BCM2835=y
+ CONFIG_MMC_SDHCI_XENON=y
  CONFIG_NEW_LEDS=y
  CONFIG_LEDS_CLASS=y
  CONFIG_LEDS_GPIO=y
