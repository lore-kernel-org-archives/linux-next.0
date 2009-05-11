From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] soc_camera: depends on I2C
Date: Mon, 11 May 2009 09:36:14 -0700
Message-ID: <4A0853FE.6060709@oracle.com>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
Sender: linux-media-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, g.liakhovetski@gmx.de, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

soc_camera uses i2c_*() functions and has build errors when CONFIG_I2C=n:

ERROR: "i2c_new_device" [drivers/media/video/soc_camera.ko] undefined!
ERROR: "i2c_get_adapter" [drivers/media/video/soc_camera.ko] undefined!
ERROR: "i2c_put_adapter" [drivers/media/video/soc_camera.ko] undefined!
ERROR: "i2c_unregister_device" [drivers/media/video/soc_camera.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/media/video/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090511.orig/drivers/media/video/Kconfig
+++ linux-next-20090511/drivers/media/video/Kconfig
@@ -694,7 +694,7 @@ config VIDEO_CAFE_CCIC
 
 config SOC_CAMERA
 	tristate "SoC camera support"
-	depends on VIDEO_V4L2 && HAS_DMA
+	depends on VIDEO_V4L2 && HAS_DMA && I2C
 	select VIDEOBUF_GEN
 	help
 	  SoC Camera is a common API to several cameras, not connecting


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
