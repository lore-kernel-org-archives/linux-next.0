From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with the arm-soc tree
Date: Tue, 22 Aug 2017 10:55:34 +1000
Message-ID: <20170822105534.7f52bda0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49547 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932065AbdHVAzg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Aug 2017 20:55:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>, Steve Longerbeam <steve_longerbeam@mentor.com>, Shawn Guo <shawnguo@kernel.org>

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  arch/arm/configs/imx_v6_v7_defconfig

between commit:

  b834bc1c52b8 ("ARM: imx_v6_v7_defconfig: Enable staging video4linux drivers")

from the arm-soc tree and commit:

  b9e1486e0e4b ("media: rc-core: do not depend on MEDIA_SUPPORT")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/configs/imx_v6_v7_defconfig
index 3a48ad809731,1736813bdea7..000000000000
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@@ -230,9 -226,7 +230,9 @@@ CONFIG_REGULATOR_MC13892=
  CONFIG_REGULATOR_PFUZE100=y
  CONFIG_MEDIA_SUPPORT=y
  CONFIG_MEDIA_CAMERA_SUPPORT=y
- CONFIG_MEDIA_RC_SUPPORT=y
+ CONFIG_RC_CORE=y
 +CONFIG_MEDIA_CONTROLLER=y
 +CONFIG_VIDEO_V4L2_SUBDEV_API=y
  CONFIG_RC_DEVICES=y
  CONFIG_IR_GPIO_CIR=y
  CONFIG_MEDIA_USB_SUPPORT=y
