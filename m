From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] Fixup RGB444_1X12, RGB565_1X16, and YUV8_1X24 media bus format
Date: Fri, 17 Apr 2015 19:12:41 +0200
Message-ID: <1429290761-21826-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43920 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932753AbbDQRMu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Apr 2015 13:12:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Philipp Zabel <p.zabel@pengutronix.de>

Change the constant values for RGB444_1X12, RGB565_1X16, and YUV8_1X24 media
bus formats in anticipation of a merge conflict with the media tree, where
the old values are already taken by RBG888_1X24, RGB888_1X32_PADHI, and
VUY8_1X24, respectively.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/DocBook/media/v4l/subdev-formats.xml |  6 +++---
 include/uapi/linux/media-bus-format.h              | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/DocBook/media/v4l/subdev-formats.xml b/Documentation/DocBook/media/v4l/subdev-formats.xml
index 18b71af..553a380 100644
--- a/Documentation/DocBook/media/v4l/subdev-formats.xml
+++ b/Documentation/DocBook/media/v4l/subdev-formats.xml
@@ -196,7 +196,7 @@ see <xref linkend="colorspaces" />.</entry>
 	  <tbody valign="top">
 	    <row id="MEDIA-BUS-FMT-RGB444-1X12">
 	      <entry>MEDIA_BUS_FMT_RGB444_1X12</entry>
-	      <entry>0x100e</entry>
+	      <entry>0x1016</entry>
 	      <entry></entry>
 	      &dash-ent-20;
 	      <entry>r<subscript>3</subscript></entry>
@@ -326,7 +326,7 @@ see <xref linkend="colorspaces" />.</entry>
 	    </row>
 	    <row id="MEDIA-BUS-FMT-RGB565-1X16">
 	      <entry>MEDIA_BUS_FMT_RGB565_1X16</entry>
-	      <entry>0x100f</entry>
+	      <entry>0x1017</entry>
 	      <entry></entry>
 	      &dash-ent-16;
 	      <entry>r<subscript>4</subscript></entry>
@@ -3049,7 +3049,7 @@ see <xref linkend="colorspaces" />.</entry>
 	    </row>
 	    <row id="MEDIA-BUS-FMT-YUV8-1X24">
 	      <entry>MEDIA_BUS_FMT_YUV8_1X24</entry>
-	      <entry>0x2024</entry>
+	      <entry>0x2025</entry>
 	      <entry></entry>
 	      <entry>-</entry>
 	      <entry>-</entry>
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 83ea46f..73c78f1 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -33,13 +33,13 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1016 */
-#define MEDIA_BUS_FMT_RGB444_1X12		0x100e
+/* RGB - next is	0x1018 */
+#define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
-#define MEDIA_BUS_FMT_RGB565_1X16		0x100f
+#define MEDIA_BUS_FMT_RGB565_1X16		0x1017
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
@@ -56,7 +56,7 @@
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 
-/* YUV (including grey) - next is	0x2025 */
+/* YUV (including grey) - next is	0x2026 */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
 #define MEDIA_BUS_FMT_UV8_1X8			0x2015
 #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@ -82,7 +82,7 @@
 #define MEDIA_BUS_FMT_VYUY10_1X20		0x201b
 #define MEDIA_BUS_FMT_YUYV10_1X20		0x200d
 #define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
-#define MEDIA_BUS_FMT_YUV8_1X24			0x2024
+#define MEDIA_BUS_FMT_YUV8_1X24			0x2025
 #define MEDIA_BUS_FMT_YUV10_1X30		0x2016
 #define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
 #define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
-- 
2.1.4
