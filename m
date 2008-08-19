From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Tue, 19 Aug 2008 14:11:13 +1000
Message-ID: <20080819141113.1a0a9819.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57368 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751039AbYHSELe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 00:11:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Hans Verkuil <hverkuil@xs4all.nl>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/video/zr364xx.c between commit
8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB: remove info() macro from
usb.h") from the usb tree and commit
dcdbac23cc15325ae04696803537b35bb0bcb3cb ("V4L/DVB (8613): v4l: move BKL
down to the driver level") from the v4l-dvb tree.

A context clashing change and addition.  I fixed it up (see below) and
can carry it.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/media/video/zr364xx.c
index 5eb8cb8,4e1ef10..0000000
--- a/drivers/media/video/zr364xx.c
+++ b/drivers/media/video/zr364xx.c
@@@ -651,7 -653,8 +654,8 @@@ static int zr364xx_open(struct inode *i
  	if (!cam->framebuf) {
  		cam->framebuf = vmalloc_32(MAX_FRAME_SIZE * FRAMES);
  		if (!cam->framebuf) {
 -			info("vmalloc_32 failed!");
 +			dev_err(&cam->udev->dev, "vmalloc_32 failed!\n");
+ 			unlock_kernel();
  			return -ENOMEM;
  		}
  	}
@@@ -663,9 -666,9 +667,10 @@@
  				     0, init[cam->method][i].bytes,
  				     init[cam->method][i].size);
  		if (err < 0) {
 -			info("error during open sequence: %d", i);
 +			dev_err(&cam->udev->dev,
 +				"error during open sequence: %d\n", i);
  			mutex_unlock(&cam->lock);
+ 			unlock_kernel();
  			return err;
  		}
  	}
