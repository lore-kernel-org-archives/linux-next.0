From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Tue, 11 Apr 2017 13:32:42 +1000
Message-ID: <20170411133242.05651a8c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753064AbdDKDcp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 23:32:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Hans Verkuil <hans.verkuil@cisco.com>, Michael Zoran <mzoran@crowfest.net>, Alan Cox <alan@linux.intel.com>

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/media/Kconfig
  drivers/staging/media/Makefile

between commits:

  fc4e009c6c98 ("[media] stih-cec: add CEC notifier support")
  a93d429b51fb ("[media] s5p-cec: add cec-notifier support, move out of staging")

from the v4l-dvb tree and commits:

  212afb97efe1 ("staging: bcm2835-camera: Move driver under vc04_services")
  a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/media/Kconfig
index 8ed8202da57a,5a26eb211c7a..000000000000
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@@ -27,9 -27,12 +27,9 @@@ source "drivers/staging/media/davinci_v
  
  source "drivers/staging/media/omap4iss/Kconfig"
  
- source "drivers/staging/media/platform/bcm2835/Kconfig"
 -source "drivers/staging/media/s5p-cec/Kconfig"
--
  # Keep LIRC at the end, as it has sub-menus
  source "drivers/staging/media/lirc/Kconfig"
  
 -source "drivers/staging/media/st-cec/Kconfig"
 -
+ source "drivers/staging/media/atomisp/Kconfig"
++
  endif
diff --cc drivers/staging/media/Makefile
index 3a6adeabede1,ab60a89c6593..000000000000
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@@ -1,6 -1,8 +1,6 @@@
  obj-$(CONFIG_I2C_BCM2048)	+= bcm2048/
 -obj-$(CONFIG_VIDEO_SAMSUNG_S5P_CEC) += s5p-cec/
  obj-$(CONFIG_DVB_CXD2099)	+= cxd2099/
  obj-$(CONFIG_LIRC_STAGING)	+= lirc/
- obj-$(CONFIG_VIDEO_BCM2835)	+= platform/bcm2835/
  obj-$(CONFIG_VIDEO_DM365_VPFE)	+= davinci_vpfe/
  obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 -obj-$(CONFIG_VIDEO_STI_HDMI_CEC) += st-cec/
+ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
