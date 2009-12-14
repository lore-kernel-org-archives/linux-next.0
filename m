From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] nouveau: fix ch7006 build
Date: Mon, 14 Dec 2009 11:51:40 -0800
Message-ID: <20091214115140.db309483.randy.dunlap@oracle.com>
References: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:30801 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754376AbZLNTwJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 14:52:09 -0500
In-Reply-To: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

The ch7006 driver could be built even when nouveau was not enabled,
but the build fails in that case, so make it depend on DRM_NOUVEUA.

Also make the I2c encoder/helper chips menu depend on I2C (no build
error, just visual inspection).

ERROR: "drm_helper_probe_single_connector_modes" [drivers/gpu/drm/i2c/ch7006.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/Kconfig |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20091214.orig/drivers/gpu/drm/nouveau/Kconfig
+++ linux-next-20091214/drivers/gpu/drm/nouveau/Kconfig
@@ -30,11 +30,12 @@ config DRM_NOUVEAU_DEBUG
 	  via debugfs.
 
 menu "I2C encoder or helper chips"
-     depends on DRM
+     depends on DRM && I2C
 
 config DRM_I2C_CH7006
 	tristate "Chrontel ch7006 TV encoder"
-	default m if DRM_NOUVEAU
+	depends on DRM_NOUVEAU
+	default m
 	help
 	  Support for Chrontel ch7006 and similar TV encoders, found
 	  on some nVidia video cards.
