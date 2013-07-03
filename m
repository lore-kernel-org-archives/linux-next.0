From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next 2/2] arm: multi_v7_defconfig: add support for NFS root
Date: Wed, 3 Jul 2013 10:12:59 +0200
Message-ID: <1372839179-14542-3-git-send-email-vincent.stehle@freescale.com>
References: <1372839179-14542-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372839179-14542-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>
List-Id: linux-next.vger.kernel.org

Add the necessary config options, to allow booting with NFS root on an =
i.MX6
sabre sd.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>
---
 arch/arm/configs/multi_v7_defconfig |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mul=
ti_v7_defconfig
index cc8723a..81eac83 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -47,6 +47,8 @@ CONFIG_ARM_APPENDED_DTB=3Dy
 CONFIG_NET=3Dy
 CONFIG_UNIX=3Dy
 CONFIG_INET=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
 CONFIG_DEVTMPFS=3Dy
 CONFIG_DEVTMPFS_MOUNT=3Dy
 CONFIG_BLK_DEV_SD=3Dy
@@ -149,6 +151,10 @@ CONFIG_PWM=3Dy
 CONFIG_PWM_VT8500=3Dy
 CONFIG_EXT4_FS=3Dy
 CONFIG_TMPFS=3Dy
+CONFIG_NFS_FS=3Dy
+CONFIG_NFS_V3_ACL=3Dy
+CONFIG_NFS_V4=3Dy
+CONFIG_ROOT_NFS=3Dy
 CONFIG_PRINTK_TIME=3Dy
 CONFIG_DEBUG_FS=3Dy
 CONFIG_DEBUG_KERNEL=3Dy
--=20
1.7.10.4
