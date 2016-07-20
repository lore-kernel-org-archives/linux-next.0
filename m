From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the l2-mtd tree with the
 wireless-drivers-next tree
Date: Wed, 20 Jul 2016 12:31:33 +1000
Message-ID: <20160720123133.44dab209@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43988 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752321AbcGTCbg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Jul 2016 22:31:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>

Hi Brian,

Today's linux-next merge of the l2-mtd tree got a conflict in:

  drivers/mtd/devices/Kconfig

between commit:

  efacc699139e ("mtd: add arch dependency for MTD_BCM47XXSFLASH symbol")

from the wireless-drivers-next tree and commit:

  0a526341fee0 ("mtd: update description of MTD_BCM47XXSFLASH symbol")

from the l2-mtd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/mtd/devices/Kconfig
index 64a248556d29,bf8238fb2e12..000000000000
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@@ -113,8 -113,8 +113,8 @@@ config MTD_SST25
  	  if you want to specify device partitioning.
  
  config MTD_BCM47XXSFLASH
- 	tristate "R/O support for serial flash on BCMA bus"
+ 	tristate "Support for serial flash on BCMA bus"
 -	depends on BCMA_SFLASH
 +	depends on BCMA_SFLASH && (MIPS || ARM)
  	help
  	  BCMA bus can have various flash memories attached, they are
  	  registered by bcma as platform devices. This enables driver for
