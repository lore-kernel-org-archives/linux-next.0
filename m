From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rpmsg tree with the slave-dma tree
Date: Mon, 14 Nov 2016 16:20:26 +1100
Message-ID: <20161114162026.0511e0db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33917 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752682AbcKNFU3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 00:20:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>

Hi Bjorn,

Today's linux-next merge of the rpmsg tree got a conflict in:

  drivers/remoteproc/Kconfig

between commit:

  bb6869b21478 ("remoteproc: st_slim_rproc: add a slimcore rproc driver")

from the slave-dma tree and commit:

  99d93470dcb4 ("remoteproc: qcom_wcnss: Fix circular module dependency")

from the rpmsg tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/remoteproc/Kconfig
index 14d5d2d43a38,5fcbefcb8636..000000000000
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@@ -100,10 -95,9 +96,9 @@@ config QCOM_WCNSS_PI
  	tristate "Qualcomm WCNSS Peripheral Image Loader"
  	depends on OF && ARCH_QCOM
  	depends on QCOM_SMEM
 +	depends on REMOTEPROC
  	select QCOM_MDT_LOADER
  	select QCOM_SCM
- 	select QCOM_WCNSS_IRIS
 -	select REMOTEPROC
  	help
  	  Say y here to support the Peripheral Image Loader for the Qualcomm
  	  Wireless Connectivity Subsystem.
