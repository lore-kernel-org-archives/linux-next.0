From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] drm: fix nouveau_acpi build
Date: Wed, 11 May 2011 15:04:34 -0700
Message-ID: <20110511150434.b7f5c2f6.randy.dunlap@oracle.com>
References: <20110511152508.0d5d5aa6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:48150 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754154Ab1EKWFD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 May 2011 18:05:03 -0400
In-Reply-To: <20110511152508.0d5d5aa6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build errors when CONFIG_ACPI is enabled but MXM_WMI is not enabled
by selecting both MXM_WMI and ACPI_WMI (the latter just for kconfig
dependencies):

nouveau_acpi.c:(.text+0x2400c8): undefined reference to `mxm_wmi_call_mxmx'
nouveau_acpi.c:(.text+0x2400cf): undefined reference to `mxm_wmi_call_mxds'
nouveau_acpi.c:(.text+0x2400fe): undefined reference to `mxm_wmi_call_mxmx'
nouveau_acpi.c:(.text+0x2402ba): undefined reference to `mxm_wmi_supported

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/gpu/drm/nouveau/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20110511.orig/drivers/gpu/drm/nouveau/Kconfig
+++ linux-next-20110511/drivers/gpu/drm/nouveau/Kconfig
@@ -11,7 +11,8 @@ config DRM_NOUVEAU
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FB_BACKLIGHT if DRM_NOUVEAU_BACKLIGHT
 	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL && INPUT
-	select MXM_WMI if ACPI && ACPI_WMI
+	select ACPI_WMI if ACPI
+	select MXM_WMI if ACPI
 	help
 	  Choose this option for open-source nVidia support.
 
