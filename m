From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Tue, 18 Aug 2015 16:01:16 +1000
Message-ID: <20150818160116.1c77685d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

make[2]: *** No rule to make target 'arch/arm/boot/dts/imx6sl-fox-p1.dtb', needed by '__build'.  Stop.

Caused by commit

  189550b8644e ("serial: imx: introduce serial_imx_enable_wakeup()")

I guess a file was missed.

I partially reverted that commit:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Aug 2015 15:56:40 +1000
Subject: [PATCH] serial: imx: partial revert of "introduce
 serial_imx_enable_wakeup()"

This reverts the part of commit 189550b8644e that affects
arch/arm/boot/dts/Makefile

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/boot/dts/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d3ee1f01ffc7..233159d2eaab 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -330,7 +330,6 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-wandboard-revb1.dtb
 dtb-$(CONFIG_SOC_IMX6SL) += \
 	imx6sl-evk.dtb \
-	imx6sl-fox-p1.dtb \
 	imx6sl-warp.dtb
 dtb-$(CONFIG_SOC_IMX6SX) += \
 	imx6sx-sabreauto.dtb \
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
