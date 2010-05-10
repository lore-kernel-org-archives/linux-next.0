From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Mon, 10 May 2010 10:32:49 +1000
Message-ID: <20100510103249.55e033bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42391 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753411Ab0EJAcv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 May 2010 20:32:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Vaibhav Hiremath <hvaibhav@ti.com>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/video/Makefile between commit
b704e82a54591d69816b45f4324caf143f1a6fc8 ("V4L/DVB: V4L - Makfile:Removed
duplicate entry of davinci") from Linus' tree and commit
3b5ce90284aff5f8683cfd08e0e1b38f73ad0aa8 ("V4L/DVB: V4L: SuperH Video
Output Unit (VOU) driver") from the v4l-dvb tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/media/video/Makefile
index c51c386,cc93859..0000000
--- a/drivers/media/video/Makefile
+++ b/drivers/media/video/Makefile
@@@ -160,6 -166,10 +166,8 @@@ obj-$(CONFIG_VIDEO_MX3)			+= mx3_camera
  obj-$(CONFIG_VIDEO_PXA27x)		+= pxa_camera.o
  obj-$(CONFIG_VIDEO_SH_MOBILE_CEU)	+= sh_mobile_ceu_camera.o
  
 -obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
 -
+ obj-$(CONFIG_VIDEO_SH_VOU)		+= sh_vou.o
+ 
  obj-$(CONFIG_VIDEO_AU0828) += au0828/
  
  obj-$(CONFIG_USB_VIDEO_CLASS)	+= uvc/
