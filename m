From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung-krzk tree with the renesas
 tree
Date: Tue, 15 Dec 2015 10:10:41 +1100
Message-ID: <20151215101041.3a71eabb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57301 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753634AbbLNXKm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2015 18:10:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Krzysztof,

Today's linux-next merge of the samsung-krzk tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  954ceafd50cf ("ARM: multi_v7_defconfig: Enable missing Renesas ARM support based on DTSes")

from the renesas tree and commit:

  23a526f0478c ("ARM: multi_v7_defconfig: Build ChromeOS EC drivers as modules")

from the samsung-krzk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/configs/multi_v7_defconfig
index a4f8f5d37d82,e191a083d3ed..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -412,10 -400,9 +415,10 @@@ CONFIG_MFD_AS3722=
  CONFIG_MFD_ATMEL_FLEXCOM=y
  CONFIG_MFD_BCM590XX=y
  CONFIG_MFD_AXP20X=y
- CONFIG_MFD_CROS_EC=y
+ CONFIG_MFD_CROS_EC=m
  CONFIG_MFD_CROS_EC_I2C=m
- CONFIG_MFD_CROS_EC_SPI=y
+ CONFIG_MFD_CROS_EC_SPI=m
 +CONFIG_MFD_DA9063=m
  CONFIG_MFD_MAX14577=y
  CONFIG_MFD_MAX77686=y
  CONFIG_MFD_MAX77693=y
