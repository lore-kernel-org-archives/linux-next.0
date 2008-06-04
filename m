From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ldp build failure
Date: Wed, 4 Jun 2008 15:08:19 +1000
Message-ID: <20080604150819.ec26f31f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58511 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750765AbYFDFIX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 01:08:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@infradead.org>, Dean Anderson <dean@sensoray.com>

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/s2255drv.c:1659: error: unknown field 'vidioc_enum_fmt_cap' specified in initializer
drivers/media/video/s2255drv.c:1659: warning: initialization from incompatible pointer type
drivers/media/video/s2255drv.c:1660: error: unknown field 'vidioc_g_fmt_cap' specified in initializer
drivers/media/video/s2255drv.c:1660: warning: initialization from incompatible pointer type
drivers/media/video/s2255drv.c:1661: error: unknown field 'vidioc_try_fmt_cap' specified in initializer
drivers/media/video/s2255drv.c:1661: warning: initialization from incompatible pointer type
drivers/media/video/s2255drv.c:1662: error: unknown field 'vidioc_s_fmt_cap' specified in initializer
drivers/media/video/s2255drv.c:1662: warning: initialization from incompatible pointer type

Caused by commit 7ddf62fca6b9be8867204dfcd062bca43a75bae6 ("V4L/DVB
(7949): videodev: renamed the vidioc_*_fmt_* callbacks") from the v4l-dvb
tree.  I applied the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 7072d424c2a66ad1df68b4dc6266fcbbd721532b Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Jun 2008 15:06:07 +1000
Subject: [PATCH] ldp: fix fallout from v4l struct element renaming

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/video/s2255drv.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/video/s2255drv.c b/drivers/media/video/s2255drv.c
index d9abde2..181cb78 100644
--- a/drivers/media/video/s2255drv.c
+++ b/drivers/media/video/s2255drv.c
@@ -1656,10 +1656,10 @@ static struct video_device template = {
 	.minor = -1,
 	.release = video_device_release,
 	.vidioc_querycap = vidioc_querycap,
-	.vidioc_enum_fmt_cap = vidioc_enum_fmt_cap,
-	.vidioc_g_fmt_cap = vidioc_g_fmt_cap,
-	.vidioc_try_fmt_cap = vidioc_try_fmt_cap,
-	.vidioc_s_fmt_cap = vidioc_s_fmt_cap,
+	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_cap,
+	.vidioc_g_fmt_vid_cap = vidioc_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap = vidioc_try_fmt_cap,
+	.vidioc_s_fmt_vid_cap = vidioc_s_fmt_cap,
 	.vidioc_reqbufs = vidioc_reqbufs,
 	.vidioc_querybuf = vidioc_querybuf,
 	.vidioc_qbuf = vidioc_qbuf,
-- 
1.5.5.3

