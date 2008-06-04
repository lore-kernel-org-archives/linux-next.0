From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb build failure
Date: Wed, 4 Jun 2008 12:28:30 +1000
Message-ID: <20080604122830.e8331d4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44702 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750695AbYFDC2d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2008 22:28:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-next@vger.kernel.org

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/soc_camera.c: In function 'soc_camera_video_start':
drivers/media/video/soc_camera.c:937: error: 'struct video_device' has no member named 'vidioc_g_fmt_cap'
drivers/media/video/soc_camera.c:938: error: 'struct video_device' has no member named 'vidioc_enum_fmt_cap'
drivers/media/video/soc_camera.c:939: error: 'struct video_device' has no member named 'vidioc_s_fmt_cap'
drivers/media/video/soc_camera.c:945: error: 'struct video_device' has no member named 'vidioc_try_fmt_cap'


Caused by commit 7ddf62fca6b9be8867204dfcd062bca43a75bae6 ("V4L/DVB
(7949): videodev: renamed the vidioc_*_fmt_* callbacks").

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

>From a8d310313869b6ca7f0fd32362f7d4912c48e0e2 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Jun 2008 12:24:59 +1000
Subject: [PATCH] v4l-dvb: fix fallout from struct member renames

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/video/soc_camera.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/video/soc_camera.c b/drivers/media/video/soc_camera.c
index cc7f7c4..38ce780 100644
--- a/drivers/media/video/soc_camera.c
+++ b/drivers/media/video/soc_camera.c
@@ -934,15 +934,15 @@ int soc_camera_video_start(struct soc_camera_device *icd)
 	vdev->minor		= -1;
 	vdev->tvnorms		= V4L2_STD_UNKNOWN,
 	vdev->vidioc_querycap	= soc_camera_querycap;
-	vdev->vidioc_g_fmt_cap	= soc_camera_g_fmt_cap;
-	vdev->vidioc_enum_fmt_cap = soc_camera_enum_fmt_cap;
-	vdev->vidioc_s_fmt_cap	= soc_camera_s_fmt_cap;
+	vdev->vidioc_g_fmt_vid_cap	= soc_camera_g_fmt_cap;
+	vdev->vidioc_enum_fmt_vid_cap = soc_camera_enum_fmt_cap;
+	vdev->vidioc_s_fmt_vid_cap	= soc_camera_s_fmt_cap;
 	vdev->vidioc_enum_input	= soc_camera_enum_input;
 	vdev->vidioc_g_input	= soc_camera_g_input;
 	vdev->vidioc_s_input	= soc_camera_s_input;
 	vdev->vidioc_s_std	= soc_camera_s_std;
 	vdev->vidioc_reqbufs	= soc_camera_reqbufs;
-	vdev->vidioc_try_fmt_cap = soc_camera_try_fmt_cap;
+	vdev->vidioc_try_fmt_vid_cap = soc_camera_try_fmt_cap;
 	vdev->vidioc_querybuf	= soc_camera_querybuf;
 	vdev->vidioc_qbuf	= soc_camera_qbuf;
 	vdev->vidioc_dqbuf	= soc_camera_dqbuf;
-- 
1.5.5.3

