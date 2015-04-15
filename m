From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Wed, 15 Apr 2015 11:00:44 +0200
Message-ID: <1429088444.3480.4.camel@pengutronix.de>
References: <20150415134908.751fd80f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150415134908.751fd80f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillion <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Hyun Kwon <hyun.kwon@xilinx.com>
List-Id: linux-next.vger.kernel.org

Am Mittwoch, den 15.04.2015, 13:49 +1000 schrieb Stephen Rothwell:
> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in
> include/uapi/linux/media-bus-format.h between commits 7b0fd4568bee
> ("[media] v4l: Add RBG and RGB 8:8:8 media bus formats on 24 and 32 bit
> busses"), e8b2d7a565ae ("[media] v4l: Sort YUV formats of
> v4l2_mbus_pixelcode") and 2dca0551e4e2 ("[media] v4l: Add VUY8 24 bits
> bus format") from the v4l-dvb tree and commits 4b3a81a917a5 ("Add
> RGB444_1X12 and RGB565_1X16 media bus formats"), b295c22978b8 ("Add
> LVDS RGB media bus formats"), 08c38458be7e ("Add BGR888_1X24 and
> GBR888_1X24 media bus formats") and 203508ef52e3 ("Add
> RGB666_1X24_CPADHI media bus format") from the drm tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
> 
> (what a mess :-()

I remember Sakari warned about this when I posted my part of these
conflicting changes to linux-media.
How about this fixup to get rid of the duplicated values:

-----8<-----
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 7f6a9f5..54344c2 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -33,7 +33,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1016 */
+/* RGB - next is	0x1018 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x100e
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -45,7 +45,7 @@
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
 #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
 #define MEDIA_BUS_FMT_RGB666_1X18		0x1009
-#define MEDIA_BUS_FMT_RBG888_1X24		0x100e
+#define MEDIA_BUS_FMT_RBG888_1X24		0x1016
 #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
 #define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG		0x1010
 #define MEDIA_BUS_FMT_BGR888_1X24		0x1013
@@ -56,9 +56,9 @@
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
-#define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
+#define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x1017
 
-/* YUV (including grey) - next is	0x2025 */
+/* YUV (including grey) - next is	0x2026 */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
 #define MEDIA_BUS_FMT_UV8_1X8			0x2015
 #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@ -89,7 +89,7 @@
 #define MEDIA_BUS_FMT_YUYV10_1X20		0x200d
 #define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
 #define MEDIA_BUS_FMT_YUV8_1X24			0x2024
-#define MEDIA_BUS_FMT_VUY8_1X24			0x2024
+#define MEDIA_BUS_FMT_VUY8_1X24			0x2025
 #define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
 #define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
 #define MEDIA_BUS_FMT_YUYV12_1X24		0x2022
-- 
2.1.4
----->8-----

regards
Philipp
