From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] gpu: fix qxl missing crc32_le
Date: Fri, 20 Dec 2013 10:58:15 -0800
Message-ID: <52B49347.3090209@infradead.org>
References: <20131220172503.b2b7cb92f437d974f032e1a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38024 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581Ab3LTS6S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2013 13:58:18 -0500
In-Reply-To: <20131220172503.b2b7cb92f437d974f032e1a4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, alevy@redhat.com

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error: qxl uses crc32 functions so it needs to select
CRC32.

Also use angle quotes around a kernel header file name.

drivers/built-in.o: In function `qxl_display_read_client_monitors_config':
(.text+0x19d754): undefined reference to `crc32_le'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/gpu/drm/qxl/Kconfig       |    1 +
 drivers/gpu/drm/qxl/qxl_display.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20131220.orig/drivers/gpu/drm/qxl/qxl_display.c
+++ linux-next-20131220/drivers/gpu/drm/qxl/qxl_display.c
@@ -24,7 +24,7 @@
  */
 
 
-#include "linux/crc32.h"
+#include <linux/crc32.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
--- linux-next-20131220.orig/drivers/gpu/drm/qxl/Kconfig
+++ linux-next-20131220/drivers/gpu/drm/qxl/Kconfig
@@ -8,6 +8,7 @@ config DRM_QXL
 	select DRM_KMS_HELPER
 	select DRM_KMS_FB_HELPER
 	select DRM_TTM
+	select CRC32
 	help
 	  QXL virtual GPU for Spice virtualization desktop integration.
 	  Do not enable this driver unless your distro ships a corresponding
