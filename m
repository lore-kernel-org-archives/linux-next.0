From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] fbdev: Make jz4740-fb depends on MACH_JZ4740
Date: Tue, 27 Jul 2010 04:32:59 +0200
Message-ID: <1280197979-24307-1-git-send-email-lars@metafoo.de>
References: <20100727111422.673b4919.sfr@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100727111422.673b4919.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org

The jz4740-fb driver should only be selectabed of MACH_JZ4740 is selected.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/video/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index a42cb9b..9e711a1 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -2231,7 +2231,7 @@ config FB_BROADSHEET
 
 config FB_JZ4740
 	tristate "JZ4740 LCD framebuffer support"
-	depends on FB
+	depends on FB && MACH_JZ4740
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
-- 
1.5.6.5
