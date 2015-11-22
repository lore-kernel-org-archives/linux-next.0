From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sunxi tree with the samsung-krzk
 tree
Date: Mon, 23 Nov 2015 10:09:17 +1100
Message-ID: <20151123100917.36b71f1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48007 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752541AbbKVXJT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2015 18:09:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Maxime,

Today's linux-next merge of the sunxi tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  23a526f0478c ("ARM: multi_v7_defconfig: Build ChromeOS EC drivers as modules")

from the samsung-krzk tree and commit:

  83e9e1f84074 ("ARM: multi_v7_defconfig: Enable RSB and AXP20X related drivers as modules")

from the sunxi tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/configs/multi_v7_defconfig
index b96bb7c15a74,1a609b10a055..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -252,10 -252,8 +252,10 @@@ CONFIG_TOUCHSCREEN_STMPE=
  CONFIG_TOUCHSCREEN_SUN4I=y
  CONFIG_TOUCHSCREEN_WM97XX=m
  CONFIG_INPUT_MISC=y
 +CONFIG_INPUT_MAX77693_HAPTIC=m
 +CONFIG_INPUT_MAX8997_HAPTIC=m
  CONFIG_INPUT_MPU3050=y
- CONFIG_INPUT_AXP20X_PEK=y
+ CONFIG_INPUT_AXP20X_PEK=m
  CONFIG_INPUT_ADXL34X=m
  CONFIG_SERIO_AMBAKMI=y
  CONFIG_SERIAL_8250=y
@@@ -367,8 -365,8 +367,9 @@@ CONFIG_BATTERY_MAX17040=
  CONFIG_BATTERY_MAX17042=m
  CONFIG_CHARGER_MAX14577=m
  CONFIG_CHARGER_MAX77693=m
 +CONFIG_CHARGER_MAX8997=m
  CONFIG_CHARGER_TPS65090=y
+ CONFIG_AXP20X_POWER=m
  CONFIG_POWER_RESET_AS3722=y
  CONFIG_POWER_RESET_GPIO=y
  CONFIG_POWER_RESET_GPIO_RESTART=y
@@@ -400,9 -398,11 +401,11 @@@ CONFIG_MFD_AS3722=
  CONFIG_MFD_ATMEL_FLEXCOM=y
  CONFIG_MFD_BCM590XX=y
  CONFIG_MFD_AXP20X=y
+ CONFIG_MFD_AXP20X_I2C=m
+ CONFIG_MFD_AXP20X_RSB=m
 -CONFIG_MFD_CROS_EC=y
 +CONFIG_MFD_CROS_EC=m
  CONFIG_MFD_CROS_EC_I2C=m
 -CONFIG_MFD_CROS_EC_SPI=y
 +CONFIG_MFD_CROS_EC_SPI=m
  CONFIG_MFD_MAX14577=y
  CONFIG_MFD_MAX77686=y
  CONFIG_MFD_MAX77693=y
