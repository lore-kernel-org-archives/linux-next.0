From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] drivers/media: fix dependencies in video mt9t001/mt9p031
Date: Fri, 30 Sep 2011 17:34:51 -0400
Message-ID: <1317418491-26513-1-git-send-email-paul.gortmaker@windriver.com>
References: <4E83A02F.2020309@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <4E83A02F.2020309@xenotime.net>
Sender: linux-media-owner@vger.kernel.org
To: mchehab@redhat.com
Cc: rdunlap@xenotime.net, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-media@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

Both mt9t001.c and mt9p031.c have two identical issues, those
being that they will need module.h inclusion for the upcoming
cleanup going on there, and that their dependencies don't limit
selection of configs that will fail to compile as follows:

drivers/media/video/mt9p031.c:457: error: implicit declaration of funct=
ion =E2=80=98v4l2_subdev_get_try_crop=E2=80=99
drivers/media/video/mt9t001.c:787: error: =E2=80=98struct v4l2_subdev=E2=
=80=99 has no member named =E2=80=98entity=E2=80=99

The related config options are CONFIG_MEDIA_CONTROLLER and
CONFIG_VIDEO_V4L2_SUBDEV_API.  Looking at the code, it appears
that the driver was never intended to work without these enabled,
so add a dependency on CONFIG_VIDEO_V4L2_SUBDEV_API, which in
turn already has a dependency on CONFIG_MEDIA_CONTROLLER.

Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/drivers/media/video/Kconfig b/drivers/media/video/Kconfig
index 75e43c0..d285c8c 100644
--- a/drivers/media/video/Kconfig
+++ b/drivers/media/video/Kconfig
@@ -469,14 +469,14 @@ config VIDEO_OV7670
=20
 config VIDEO_MT9P031
 	tristate "Aptina MT9P031 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	---help---
 	  This is a Video4Linux2 sensor-level driver for the Aptina
 	  (Micron) mt9p031 5 Mpixel camera.
=20
 config VIDEO_MT9T001
 	tristate "Aptina MT9T001 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	---help---
 	  This is a Video4Linux2 sensor-level driver for the Aptina
 	  (Micron) mt0t001 3 Mpixel camera.
diff --git a/drivers/media/video/mt9p031.c b/drivers/media/video/mt9p03=
1.c
index 8bcb1ce..fc9603f 100644
--- a/drivers/media/video/mt9p031.c
+++ b/drivers/media/video/mt9p031.c
@@ -14,6 +14,7 @@
=20
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
 #include <linux/pm.h>
diff --git a/drivers/media/video/mt9t001.c b/drivers/media/video/mt9t00=
1.c
index ae75d82..280d01d 100644
--- a/drivers/media/video/mt9t001.c
+++ b/drivers/media/video/mt9t001.c
@@ -13,6 +13,7 @@
  */
=20
 #include <linux/i2c.h>
+#include <linux/module.h>
 #include <linux/log2.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
--=20
1.7.6
