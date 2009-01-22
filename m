From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the i2c tree with the pxa tree
Date: Thu, 22 Jan 2009 11:24:42 +1100
Message-ID: <20090122112442.1c99650e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34943 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754412AbZAVAYq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2009 19:24:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, Philipp Zabel <philipp.zabel@gmail.com>, Eric Miao <eric.miao@marvell.com>

Hi Jean,

Today's linux-next merge of the i2c tree got a conflict in
arch/arm/configs/magician_defconfig between commit
b25a386b9c68ed23c3b2656f44b523e61480218b ("[ARM] pxa/magician: Update
defconfig") from the pxa tree and commit
4f1889016ff7e12fe429ba072be215cbac63e0e0 ("eeprom: More consistent symbol
names") from the i2c tree.

Just changed context, nothing important.  I fixed it up (see below) and
can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/configs/magician_defconfig
index dde50df,73ba62b..0000000
--- a/arch/arm/configs/magician_defconfig
+++ b/arch/arm/configs/magician_defconfig
@@@ -747,11 -675,11 +747,11 @@@ CONFIG_I2C_PXA=
  #
  # Miscellaneous I2C Chip support
  #
 -# CONFIG_SENSORS_DS1337 is not set
 -# CONFIG_SENSORS_DS1374 is not set
  # CONFIG_DS1682 is not set
 +# CONFIG_AT24 is not set
- # CONFIG_SENSORS_EEPROM is not set
+ # CONFIG_EEPROM_LEGACY is not set
  # CONFIG_SENSORS_PCF8574 is not set
 +# CONFIG_PCF8575 is not set
  # CONFIG_SENSORS_PCA9539 is not set
  # CONFIG_SENSORS_PCF8591 is not set
  # CONFIG_SENSORS_MAX6875 is not set
