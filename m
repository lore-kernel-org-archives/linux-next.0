From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the samsung-krzk
 tree
Date: Mon, 29 Feb 2016 15:20:55 +1100
Message-ID: <20160229152055.3af83d1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54667 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754859AbcB2EU6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Feb 2016 23:20:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>

Hi Joerg,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/memory/Kconfig

between commit:

  78fbb9361ca3 ("memory: Add support for Exynos SROM driver")

from the samsung-krzk tree and commit:

  cc8bbe1a8312 ("memory: mediatek: Add SMI driver")

from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/memory/Kconfig
index bcb19822968b,51d5cd20c26a..000000000000
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@@ -114,7 -114,14 +114,15 @@@ config JZ4780_NEM
  	  the Ingenic JZ4780. This controller is used to handle external
  	  memory devices such as NAND and SRAM.
  
+ config MTK_SMI
+ 	bool
+ 	depends on ARCH_MEDIATEK || COMPILE_TEST
+ 	help
+ 	  This driver is for the Memory Controller module in MediaTek SoCs,
+ 	  mainly help enable/disable iommu and control the power domain and
+ 	  clocks for each local arbiter.
+ 
 +source "drivers/memory/samsung/Kconfig"
  source "drivers/memory/tegra/Kconfig"
  
  endif
