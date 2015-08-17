From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the rdma tree
Date: Mon, 17 Aug 2015 18:13:12 +1000
Message-ID: <20150817181312.4be1a554@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56465 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750754AbbHQINO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 04:13:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Gromm <christian.gromm@microchip.com>, Steve Wise <swise@opengridcomputing.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/Kconfig
  drivers/staging/Makefile

between commit:

  c2347d1b409d ("RDMA/amso1100: deprecate the amso1100 provider")
  17465e48756f ("IB/ipath: Move ipath driver to staging.")
  97748be1d6d0 ("Move hfi1 to staging")

from the rdma tree and commit:

  57562a72414c ("Staging: most: add MOST driver's core module")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/Kconfig
index 3f9f058f9ba7,e29293c0c71e..000000000000
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@@ -112,10 -108,6 +108,12 @@@ source "drivers/staging/fsl-mc/Kconfig
  
  source "drivers/staging/wilc1000/Kconfig"
  
 +source "drivers/staging/amso1100/Kconfig"
 +
 +source "drivers/staging/ipath/Kconfig"
 +
 +source "drivers/staging/hfi1/Kconfig"
 +
+ source "drivers/staging/most/Kconfig"
+ 
  endif # STAGING
diff --cc drivers/staging/Makefile
index 20f827632349,50824dde2c09..000000000000
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@@ -48,6 -46,4 +46,7 @@@ obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+
  obj-$(CONFIG_FB_TFT)		+= fbtft/
  obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
  obj-$(CONFIG_WILC1000)		+= wilc1000/
 +obj-$(CONFIG_INFINIBAND_AMSO1100)	+= amso1100/
 +obj-$(CONFIG_INFINIBAND_IPATH)	+= ipath/
 +obj-$(CONFIG_INFINIBAND_HFI1)	+= hfi1/
+ obj-$(CONFIG_MOST)		+= most/
