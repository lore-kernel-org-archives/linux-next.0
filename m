From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] drm: fix kconfig unmet dependency warning
Date: Wed, 10 Aug 2011 14:24:01 -0700
Message-ID: <20110810142401.c0a4a041.rdunlap@xenotime.net>
References: <20110810142702.da4f1b9ff86ddbedc3c73a48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:59586 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755045Ab1HJVYD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Aug 2011 17:24:03 -0400
In-Reply-To: <20110810142702.da4f1b9ff86ddbedc3c73a48@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix kconfig unmet dependency warning.  BACKLIGHT_CLASS_DEVICE depends on
BACKLIGHT_LCD_SUPPORT, so select the latter along with the former.

warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && PANEL_SHARP_LS037V7DW01 && PANEL_ACX565AKM && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_ASUS && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/gpu/drm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- lnx-31-rc1.orig/drivers/gpu/drm/Kconfig
+++ lnx-31-rc1/drivers/gpu/drm/Kconfig
@@ -96,6 +96,7 @@ config DRM_I915
 	select FB_CFB_IMAGEBLIT
 	# i915 depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
+	select BACKLIGHT_LCD_SUPPORT if ACPI
 	select BACKLIGHT_CLASS_DEVICE if ACPI
 	select VIDEO_OUTPUT_CONTROL if ACPI
 	select INPUT if ACPI
