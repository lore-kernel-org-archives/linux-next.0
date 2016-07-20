From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fsl tree with the arm-soc tree
Date: Wed, 20 Jul 2016 10:45:01 +1000
Message-ID: <20160720104501.02bd5a2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49842 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752718AbcGTApF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Jul 2016 20:45:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Scott Wood <scottwood@freescale.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>

Hi Scott,

Today's linux-next merge of the fsl tree got a conflict in:

  drivers/soc/Kconfig

between commit:

  34642650e5bc ("soc: Move brcmstb to bcm/brcmstb")

from the arm-soc tree and commit:

  82117b4a8897 ("soc: fsl: add GUTS driver for QorIQ platforms")

from the fsl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/soc/Kconfig
index fe42a2fdf351,7106463f118e..000000000000
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@@ -1,7 -1,8 +1,7 @@@
  menu "SOC (System On Chip) specific Drivers"
  
  source "drivers/soc/bcm/Kconfig"
- source "drivers/soc/fsl/qe/Kconfig"
 -source "drivers/soc/brcmstb/Kconfig"
+ source "drivers/soc/fsl/Kconfig"
  source "drivers/soc/mediatek/Kconfig"
  source "drivers/soc/qcom/Kconfig"
  source "drivers/soc/rockchip/Kconfig"
