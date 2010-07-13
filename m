From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s5p tree with Linus' tree
Date: Tue, 13 Jul 2010 11:14:51 +1000
Message-ID: <20100713111451.8b6162e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Kukjin,

Today's linux-next merge of the s5p tree got a conflict in
arch/arm/configs/s5pv210_defconfig between commit
07a8c03f3e06129e847acd068b8b89c13357ee64 ("ARM: reduce defconfigs") from
Linus' tree and commit 2976beb1dd86974ae98a992ca23a626f8be7e7dd ("ARM:
s5pv210_defconfig: Update for removing s5pc110_defconfig") from the s5p
tree.

I fixed it up (see below - it may no longer be minimal) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index 1753836..bbb1736 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -7,6 +7,10 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_S5PV210=y
 CONFIG_S3C_LOWLEVEL_UART_PORT=1
+CONFIG_S3C_DEV_FB=y
+CONFIG_S5PV210_SETUP_FB_24BPP=y
+CONFIG_MACH_AQUILA=y
+CONFIG_MACH_SMDKC110=y
 CONFIG_MACH_SMDKV210=y
 CONFIG_VMSPLIT_2G=y
 CONFIG_PREEMPT=y
@@ -31,6 +35,9 @@ CONFIG_SERIAL_SAMSUNG=y
 CONFIG_SERIAL_SAMSUNG_CONSOLE=y
 CONFIG_HW_RANDOM=y
 # CONFIG_HWMON is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_MFD_SUPPORT=y
+# CONFIG_ABX500_CORE is not set
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
