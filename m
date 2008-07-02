From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Fw: [linuxtv-commits] [hg:v4l-dvb] uvc: Fix compilation breakage
 for the other drivers, if uvc is selected
Date: Wed, 2 Jul 2008 09:06:43 -0300
Message-ID: <20080702090643.60b8ce47@gaivota>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:45896 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754164AbYGBMGy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 08:06:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Hi Stephen,

I noticed a bad thing on a patch that I've added to linux-next. Basically, if
you select uvc, it will drop some other drivers. So, your today build is
probably incomplete.

I'm adding this patch to my linux-next tree.

The error and its fix is trivial.

It would be nice if we have a tool to get this error. I only noticed the
problem due to the large decrease of the compilation time.

Cheers,
Mauro.

------

From: Mauro Carvalho Chehab  <mchehab@infradead.org>
uvc: Fix compilation breakage for the other drivers, if uvc is selected


UVC makefile defines obj as:
	obj-$(CONFIG_USB_VIDEO_CLASS) := uvcvideo.o
Instead of:
	obj-$(CONFIG_USB_VIDEO_CLASS) += uvcvideo.o

Due to that, if uvc is selected, all obj-y or obj-m that were added to
compilation were forget. This breaks a proper kernel build.

Acked-by: Laurent Pinchart <laurent.pinchart@skynet.be>
Signed-off-by: Mauro Carvalho Chehab <mchehab@infradead.org>


---

 linux/drivers/media/video/uvc/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -r d51bf59f63b5 -r 02cda7958a05 linux/drivers/media/video/uvc/Makefile
--- a/linux/drivers/media/video/uvc/Makefile	Tue Jul 01 17:20:13 2008 -0300
+++ b/linux/drivers/media/video/uvc/Makefile	Wed Jul 02 08:03:33 2008 -0300
@@ -1,3 +1,3 @@ uvcvideo-objs  := uvc_driver.o uvc_queue
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
 		  uvc_status.o uvc_isight.o
-obj-$(CONFIG_USB_VIDEO_CLASS) := uvcvideo.o
+obj-$(CONFIG_USB_VIDEO_CLASS) += uvcvideo.o


---

Patch is available at: http://linuxtv.org/hg/v4l-dvb/rev/02cda7958a05b568b2851aeb88b57dba8fb77eb9

_______________________________________________
linuxtv-commits mailing list
linuxtv-commits@linuxtv.org
http://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-commits




Cheers,
Mauro
