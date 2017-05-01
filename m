From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the spi tree with the pm tree
Date: Mon, 1 May 2017 12:50:20 +1000
Message-ID: <20170501125020.721afc5a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S637843AbdEACuY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Apr 2017 22:50:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hanjun Guo <hanjun.guo@linaro.org>, Jayachandran C <jnair@caviumnetworks.com>

Hi Mark,

Today's linux-next merge of the spi tree got a conflict in:

  drivers/acpi/acpi_apd.c

between commit:

  6e14cf361a0c ("ACPI / APD: Add clock frequency for Hisilicon Hip07/08 I2C controller")

from the pm tree and commit:

  251831bd4f49 ("spi: xlp: update for ARCH_VULCAN2")

from the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/acpi/acpi_apd.c
index 8f57648f318b,17a1eb14847a..000000000000
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@@ -179,8 -169,7 +179,9 @@@ static const struct acpi_device_id acpi
  #ifdef CONFIG_ARM64
  	{ "APMC0D0F", APD_ADDR(xgene_i2c_desc) },
  	{ "BRCM900D", APD_ADDR(vulcan_spi_desc) },
+ 	{ "CAV900D",  APD_ADDR(vulcan_spi_desc) },
 +	{ "HISI0A21", APD_ADDR(hip07_i2c_desc) },
 +	{ "HISI0A22", APD_ADDR(hip08_i2c_desc) },
  #endif
  	{ }
  };
