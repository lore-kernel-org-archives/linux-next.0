From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 1 Sep 2008 13:22:20 +1000
Message-ID: <20080901132220.9dea12cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45017 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750878AbYIADW0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Aug 2008 23:22:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Antoine Jacquet <royale@zerezo.com>, Greg KH <greg@kroah.com>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/media/video/zr364xx.c between commit
4f1ddb5e3580439b0168e1ad14b8328ec926768f ("USB: remove info() macro from
usb.h") from the usb tree and commit
1527ad8b9b0ecacb5d06c309e26a688359ef2919 ("V4L/DVB (8731): zr364xx:
remove BKL") from the v4l-dvb tree.

Just overlapping context.  I have fixed it up (see below) and can carry
the fix.  This is, of course, also fixable in the v4l-dvb tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/media/video/zr364xx.c
index 5eb8cb8,93991cb..0000000
--- a/drivers/media/video/zr364xx.c
+++ b/drivers/media/video/zr364xx.c
@@@ -651,8 -652,9 +653,9 @@@ static int zr364xx_open(struct inode *i
  	if (!cam->framebuf) {
  		cam->framebuf = vmalloc_32(MAX_FRAME_SIZE * FRAMES);
  		if (!cam->framebuf) {
 -			info("vmalloc_32 failed!");
 +			dev_err(&cam->udev->dev, "vmalloc_32 failed!\n");
- 			return -ENOMEM;
+ 			err = -ENOMEM;
+ 			goto out;
  		}
  	}
  
@@@ -663,10 -664,8 +665,9 @@@
  				     0, init[cam->method][i].bytes,
  				     init[cam->method][i].size);
  		if (err < 0) {
 -			info("error during open sequence: %d", i);
 +			dev_err(&cam->udev->dev,
 +				"error during open sequence: %d\n", i);
- 			mutex_unlock(&cam->lock);
- 			return err;
+ 			goto out;
  		}
  	}
  
@@@ -705,9 -712,8 +714,8 @@@ static int zr364xx_release(struct inod
  				     0, init[i][cam->method].bytes,
  				     init[cam->method][i].size);
  		if (err < 0) {
 -			info("error during release sequence");
 +			dev_err(&udev->dev, "error during release sequence\n");
- 			mutex_unlock(&cam->lock);
- 			return err;
+ 			goto out;
  		}
  	}
  
