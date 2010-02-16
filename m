From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] vmwgfx: depends on FB
Date: Tue, 16 Feb 2010 15:18:20 -0800
Message-ID: <4B7B27BC.8010905@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

vmwfgx uses framebuffer interfaces, so it should depend on FB.
Otherwise it has these build errors (e.g., when CONFIG_FB=m):

drivers/built-in.o: In function `vmw_fb_close':
(.text+0x97713): undefined reference to `unregister_framebuffer'
drivers/built-in.o: In function `vmw_fb_close':
(.text+0x97754): undefined reference to `framebuffer_release'
drivers/built-in.o: In function `vmw_fb_init':
(.text+0x97e1c): undefined reference to `framebuffer_alloc'
drivers/built-in.o: In function `vmw_fb_init':
(.text+0x9838d): undefined reference to `register_framebuffer'
drivers/built-in.o: In function `vmw_fb_init':
(.text+0x9842a): undefined reference to `framebuffer_release'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/gpu/drm/vmwgfx/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100216.orig/drivers/gpu/drm/vmwgfx/Kconfig
+++ linux-next-20100216/drivers/gpu/drm/vmwgfx/Kconfig
@@ -1,6 +1,6 @@
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
-	depends on DRM && PCI
+	depends on DRM && PCI && FB
 	select FB_DEFERRED_IO
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
--
