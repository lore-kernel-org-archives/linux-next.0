From: Pat Erley <pat-lkml@erley.org>
Subject: btrfs+compression corruption in 20161125
Date: Sun, 27 Nov 2016 22:56:48 -0800
Message-ID: <002861ba-d845-b802-b455-a59f261c4225@erley.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from erley.org ([97.107.129.9]:53512 "EHLO remote.erley.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932111AbcK1HDF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Nov 2016 02:03:05 -0500
Received: from [10.0.0.4] (c-50-156-90-132.hsd1.ca.comcast.net [50.156.90.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by remote.erley.org (Postfix) with ESMTPSA id 0495030017
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2016 06:56:53 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Don't have a good window since when my last test was (almost a month on
the 10/24 tag) but my playground system experienced very strange
corruptions in any subvolume using lzo compression in last nights build.

I reverted back to my previous kernel and any files I hadn't written
that were showing corruption were fine again.  Any files written on the
new(problematic) kernel were also fine after falling back to the
working version (so it just looks like something in the read path was
causing problems).  The most noticible issues were my ~/.mozilla
profiles all getting obliterated, so it may be something particular to
the way firefox/thunderbird deal with profiles.

Looking at the .configs for the two kernels, the only differences that 
seem important to me (that aren't just exposing more sub drivers) are:

+CONFIG_BLK_WBT=y
+CONFIG_BLK_WBT_SQ=y
+CONFIG_BLK_WBT_MQ=y

+CONFIG_INTEL_RDT_A=y

+CONFIG_COMPAT_32=y

+CONFIG_FS_IOMAP=y

+CONFIG_CRYPTO_ACOMP2=y

if any of those are a smoking gun.

I'll be available briefly each evening (GMT-8) to test/reproduce/etc.

Pat

Full .config diff follows
---
--- .config.working	2016-11-27 22:49:04.037477804 -0800
+++ .config	2016-11-27 20:04:56.423679344 -0800
@@ -1,6 +1,6 @@
  #
  # Automatically generated file; DO NOT EDIT.
-# Linux/x86 4.8.0 Kernel Configuration
+# Linux/x86 4.9.0-rc6 Kernel Configuration
  #
  CONFIG_64BIT=y
  CONFIG_X86_64=y
@@ -137,7 +137,6 @@
  # CONFIG_TASKS_RCU is not set
  CONFIG_RCU_STALL_COMMON=y
  # CONFIG_TREE_RCU_TRACE is not set
-# CONFIG_RCU_EXPEDITE_BOOT is not set
  CONFIG_BUILD_BIN2C=y
  CONFIG_IKCONFIG=y
  CONFIG_IKCONFIG_PROC=y
@@ -189,6 +188,7 @@
  CONFIG_RD_XZ=y
  CONFIG_RD_LZO=y
  CONFIG_RD_LZ4=y
+CONFIG_INITRAMFS_COMPRESSION=".gz"
  CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
  # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
  CONFIG_SYSCTL=y
@@ -203,6 +203,7 @@
  CONFIG_SGETMASK_SYSCALL=y
  CONFIG_SYSFS_SYSCALL=y
  # CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_POSIX_TIMERS=y
  CONFIG_KALLSYMS=y
  CONFIG_KALLSYMS_ALL=y
  CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
@@ -341,8 +342,12 @@
  CONFIG_BLK_DEV_BSG=y
  # CONFIG_BLK_DEV_BSGLIB is not set
  # CONFIG_BLK_DEV_INTEGRITY is not set
+# CONFIG_BLK_DEV_ZONED is not set
  # CONFIG_BLK_DEV_THROTTLING is not set
  # CONFIG_BLK_CMDLINE_PARSER is not set
+CONFIG_BLK_WBT=y
+CONFIG_BLK_WBT_SQ=y
+CONFIG_BLK_WBT_MQ=y

  #
  # Partition Types
@@ -408,6 +413,7 @@
  CONFIG_X86_X2APIC=y
  # CONFIG_X86_MPPARSE is not set
  # CONFIG_GOLDFISH is not set
+CONFIG_INTEL_RDT_A=y
  # CONFIG_X86_EXTENDED_PLATFORM is not set
  CONFIG_X86_INTEL_LPSS=y
  # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
@@ -719,12 +725,6 @@
  CONFIG_INTEL_IDLE=y

  #
-# Memory power savings
-#
-CONFIG_I7300_IDLE_IOAT_CHANNEL=y
-CONFIG_I7300_IDLE=y
-
-#
  # Bus options (PCI etc.)
  #
  CONFIG_PCI=y
@@ -789,6 +789,7 @@
  CONFIG_IA32_EMULATION=y
  CONFIG_IA32_AOUT=y
  CONFIG_X86_X32=y
+CONFIG_COMPAT_32=y
  CONFIG_COMPAT=y
  CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
  CONFIG_SYSVIPC_COMPAT=y
@@ -838,6 +839,7 @@
  CONFIG_INET_DIAG=m
  CONFIG_INET_TCP_DIAG=m
  CONFIG_INET_UDP_DIAG=m
+# CONFIG_INET_RAW_DIAG is not set
  # CONFIG_INET_DIAG_DESTROY is not set
  CONFIG_TCP_CONG_ADVANCED=y
  # CONFIG_TCP_CONG_BIC is not set
@@ -883,6 +885,8 @@
  # CONFIG_IPV6_FOU_TUNNEL is not set
  # CONFIG_IPV6_MULTIPLE_TABLES is not set
  # CONFIG_IPV6_MROUTE is not set
+# CONFIG_IPV6_SEG6_LWTUNNEL is not set
+# CONFIG_IPV6_SEG6_HMAC is not set
  # CONFIG_NETLABEL is not set
  CONFIG_NETWORK_SECMARK=y
  CONFIG_NET_PTP_CLASSIFY=y
@@ -901,6 +905,7 @@
  # CONFIG_NETFILTER_NETLINK_QUEUE is not set
  # CONFIG_NETFILTER_NETLINK_LOG is not set
  CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_LOG_NETDEV is not set
  CONFIG_NF_CONNTRACK_MARK=y
  # CONFIG_NF_CONNTRACK_SECMARK is not set
  CONFIG_NF_CONNTRACK_PROCFS=y
@@ -936,6 +941,7 @@
  CONFIG_NF_TABLES_NETDEV=m
  CONFIG_NFT_EXTHDR=m
  CONFIG_NFT_META=m
+# CONFIG_NFT_RT is not set
  # CONFIG_NFT_NUMGEN is not set
  CONFIG_NFT_CT=m
  # CONFIG_NFT_SET_RBTREE is not set
@@ -1032,7 +1038,6 @@
  # CONFIG_NETFILTER_XT_MATCH_REALM is not set
  # CONFIG_NETFILTER_XT_MATCH_RECENT is not set
  # CONFIG_NETFILTER_XT_MATCH_SCTP is not set
-# CONFIG_NETFILTER_XT_MATCH_SOCKET is not set
  # CONFIG_NETFILTER_XT_MATCH_STATE is not set
  # CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
  # CONFIG_NETFILTER_XT_MATCH_STRING is not set
@@ -1047,10 +1052,12 @@
  #
  CONFIG_NF_DEFRAG_IPV4=m
  CONFIG_NF_CONNTRACK_IPV4=m
+# CONFIG_NF_SOCKET_IPV4 is not set
  CONFIG_NF_TABLES_IPV4=m
  CONFIG_NFT_CHAIN_ROUTE_IPV4=m
  CONFIG_NFT_REJECT_IPV4=m
  # CONFIG_NFT_DUP_IPV4 is not set
+# CONFIG_NFT_FIB_IPV4 is not set
  CONFIG_NF_TABLES_ARP=m
  # CONFIG_NF_DUP_IPV4 is not set
  # CONFIG_NF_LOG_ARP is not set
@@ -1088,10 +1095,12 @@
  #
  CONFIG_NF_DEFRAG_IPV6=m
  CONFIG_NF_CONNTRACK_IPV6=m
+# CONFIG_NF_SOCKET_IPV6 is not set
  CONFIG_NF_TABLES_IPV6=m
  CONFIG_NFT_CHAIN_ROUTE_IPV6=m
  CONFIG_NFT_REJECT_IPV6=m
  # CONFIG_NFT_DUP_IPV6 is not set
+# CONFIG_NFT_FIB_IPV6 is not set
  # CONFIG_NF_DUP_IPV6 is not set
  CONFIG_NF_REJECT_IPV6=m
  # CONFIG_NF_LOG_IPV6 is not set
@@ -1369,6 +1378,7 @@
  # CONFIG_DEBUG_DRIVER is not set
  # CONFIG_DEBUG_DEVRES is not set
  # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
+# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
  CONFIG_SYS_HYPERVISOR=y
  # CONFIG_GENERIC_CPU_DEVICES is not set
  CONFIG_GENERIC_CPU_AUTOPROBE=y
@@ -1376,12 +1386,11 @@
  CONFIG_REGMAP_I2C=y
  CONFIG_REGMAP_SPI=y
  CONFIG_DMA_SHARED_BUFFER=y
-# CONFIG_FENCE_TRACE is not set
+# CONFIG_DMA_FENCE_TRACE is not set

  #
  # Bus devices
  #
-# CONFIG_QCOM_EBI2 is not set
  CONFIG_CONNECTOR=y
  CONFIG_PROC_EVENTS=y
  # CONFIG_MTD is not set
@@ -1808,6 +1817,7 @@
  # CONFIG_HIPPI is not set
  # CONFIG_NET_SB1000 is not set
  CONFIG_PHYLIB=m
+CONFIG_LED_TRIGGER_PHY=y

  #
  # MDIO bus device drivers
@@ -1836,6 +1846,7 @@
  # CONFIG_LSI_ET1011C_PHY is not set
  # CONFIG_LXT_PHY is not set
  # CONFIG_MARVELL_PHY is not set
+# CONFIG_MESON_GXL_PHY is not set
  # CONFIG_MICREL_PHY is not set
  # CONFIG_MICROCHIP_PHY is not set
  # CONFIG_MICROSEMI_PHY is not set
@@ -2218,6 +2229,7 @@
  # CONFIG_I2C_MUX_PCA954x is not set
  # CONFIG_I2C_MUX_PINCTRL is not set
  # CONFIG_I2C_MUX_REG is not set
+# CONFIG_I2C_MUX_MLXCPLD is not set
  CONFIG_I2C_HELPER_AUTO=y
  CONFIG_I2C_SMBUS=m
  CONFIG_I2C_ALGOBIT=m
@@ -2276,6 +2288,7 @@
  #
  # Other I2C/SMBus bus drivers
  #
+# CONFIG_I2C_MLXCPLD is not set
  # CONFIG_I2C_STUB is not set
  # CONFIG_I2C_SLAVE is not set
  # CONFIG_I2C_DEBUG_CORE is not set
@@ -2347,13 +2360,13 @@
  CONFIG_GENERIC_PINCONF=y
  # CONFIG_DEBUG_PINCTRL is not set
  # CONFIG_PINCTRL_AMD is not set
+# CONFIG_PINCTRL_SX150X is not set
  # CONFIG_PINCTRL_BAYTRAIL is not set
  # CONFIG_PINCTRL_CHERRYVIEW is not set
  CONFIG_PINCTRL_INTEL=y
  # CONFIG_PINCTRL_BROXTON is not set
  CONFIG_PINCTRL_SUNRISEPOINT=y
  CONFIG_GPIOLIB=y
-CONFIG_GPIO_DEVRES=y
  CONFIG_GPIO_ACPI=y
  CONFIG_GPIOLIB_IRQCHIP=y
  # CONFIG_DEBUG_GPIO is not set
@@ -2369,7 +2382,6 @@
  # CONFIG_GPIO_LYNXPOINT is not set
  # CONFIG_GPIO_MOCKUP is not set
  # CONFIG_GPIO_VX855 is not set
-# CONFIG_GPIO_ZX is not set

  #
  # Port-mapped I/O GPIO drivers
@@ -2389,7 +2401,6 @@
  # CONFIG_GPIO_PCF857X is not set
  # CONFIG_GPIO_SX150X is not set
  # CONFIG_GPIO_TPIC2810 is not set
-# CONFIG_GPIO_TS4900 is not set

  #
  # MFD GPIO expanders
@@ -2515,6 +2526,7 @@
  # CONFIG_SENSORS_MAX6697 is not set
  # CONFIG_SENSORS_MAX31790 is not set
  # CONFIG_SENSORS_MCP3021 is not set
+# CONFIG_SENSORS_TC654 is not set
  # CONFIG_SENSORS_ADCXX is not set
  # CONFIG_SENSORS_LM63 is not set
  # CONFIG_SENSORS_LM70 is not set
@@ -2712,7 +2724,6 @@
  # CONFIG_MFD_DA9063 is not set
  # CONFIG_MFD_DA9150 is not set
  # CONFIG_MFD_DLN2 is not set
-# CONFIG_MFD_EXYNOS_LPASS is not set
  # CONFIG_MFD_MC13XXX_SPI is not set
  # CONFIG_MFD_MC13XXX_I2C is not set
  # CONFIG_HTC_PASIC3 is not set
@@ -2796,6 +2807,9 @@
  # CONFIG_MEDIA_RADIO_SUPPORT is not set
  CONFIG_MEDIA_SDR_SUPPORT=y
  # CONFIG_MEDIA_RC_SUPPORT is not set
+CONFIG_MEDIA_CEC_SUPPORT=y
+# CONFIG_MEDIA_CEC_DEBUG is not set
+CONFIG_MEDIA_CEC_EDID=y
  CONFIG_MEDIA_CONTROLLER=y
  CONFIG_MEDIA_CONTROLLER_DVB=y
  CONFIG_VIDEO_DEV=m
@@ -2811,6 +2825,7 @@
  # CONFIG_TTPCI_EEPROM is not set
  CONFIG_DVB_MAX_ADAPTERS=8
  # CONFIG_DVB_DYNAMIC_MINORS is not set
+# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set

  #
  # Media drivers
@@ -2865,6 +2880,11 @@
  CONFIG_USB_AIRSPY=m
  # CONFIG_USB_HACKRF is not set
  # CONFIG_USB_MSI2500 is not set
+
+#
+# USB HDMI CEC adapters
+#
+# CONFIG_USB_PULSE8_CEC is not set
  # CONFIG_MEDIA_PCI_SUPPORT is not set
  # CONFIG_V4L_PLATFORM_DRIVERS is not set
  # CONFIG_V4L_MEM2MEM_DRIVERS is not set
@@ -2959,6 +2979,7 @@
  # DVB-T (terrestrial) frontends
  #
  # CONFIG_DVB_AS102_FE is not set
+# CONFIG_DVB_GP8PSK_FE is not set

  #
  # DVB-C (cable) frontends
@@ -3027,7 +3048,9 @@
  CONFIG_NOUVEAU_DEBUG_DEFAULT=3
  CONFIG_DRM_NOUVEAU_BACKLIGHT=y
  CONFIG_DRM_I915=m
-CONFIG_DRM_I915_PRELIMINARY_HW_SUPPORT=y
+CONFIG_DRM_I915_ALPHA_SUPPORT=y
+CONFIG_DRM_I915_CAPTURE_ERROR=y
+CONFIG_DRM_I915_COMPRESS_ERROR=y
  CONFIG_DRM_I915_USERPTR=y
  # CONFIG_DRM_I915_GVT is not set
  CONFIG_DRM_VGEM=m
@@ -3051,6 +3074,7 @@
  # Display Interface Bridges
  #
  # CONFIG_DRM_ANALOGIX_ANX78XX is not set
+# CONFIG_DRM_HISI_HIBMC is not set
  # CONFIG_DRM_LEGACY is not set

  #
@@ -3370,6 +3394,7 @@
  CONFIG_HID_LENOVO=m
  # CONFIG_HID_LOGITECH is not set
  # CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_MAYFLASH is not set
  # CONFIG_HID_MICROSOFT is not set
  # CONFIG_HID_MONTEREY is not set
  # CONFIG_HID_MULTITOUCH is not set
@@ -3396,6 +3421,7 @@
  # CONFIG_HID_TOPSEED is not set
  # CONFIG_HID_THINGM is not set
  # CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_UDRAW_PS3 is not set
  CONFIG_HID_WACOM=m
  # CONFIG_HID_WIIMOTE is not set
  # CONFIG_HID_XINMO is not set
@@ -3636,7 +3662,7 @@
  # CONFIG_MMC_VUB300 is not set
  # CONFIG_MMC_USHC is not set
  # CONFIG_MMC_USDHI6ROL0 is not set
-# CONFIG_MMC_REALTEK_PCI is not set
+CONFIG_MMC_REALTEK_PCI=m
  # CONFIG_MMC_TOSHIBA_PCI is not set
  # CONFIG_MMC_MTK is not set
  # CONFIG_MEMSTICK is not set
@@ -3675,6 +3701,8 @@
  #
  # CONFIG_LEDS_BLINKM is not set
  # CONFIG_LEDS_MLXCPLD is not set
+CONFIG_LEDS_USER=y
+# CONFIG_LEDS_NIC78BX is not set

  #
  # LED Triggers
@@ -4000,8 +4028,13 @@
  # CONFIG_COMMON_CLK_PWM is not set
  # CONFIG_COMMON_CLK_PXA is not set
  # CONFIG_COMMON_CLK_PIC32 is not set
-# CONFIG_COMMON_CLK_MT8135 is not set
-# CONFIG_COMMON_CLK_MT8173 is not set
+# CONFIG_COMMON_CLK_MT2701 is not set
+# CONFIG_COMMON_CLK_MT2701_MMSYS is not set
+# CONFIG_COMMON_CLK_MT2701_IMGSYS is not set
+# CONFIG_COMMON_CLK_MT2701_VDECSYS is not set
+# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
+# CONFIG_COMMON_CLK_MT2701_ETHSYS is not set
+# CONFIG_COMMON_CLK_MT2701_BDPSYS is not set

  #
  # Hardware Spinlock drivers
@@ -4037,7 +4070,7 @@
  #
  # Remoteproc drivers
  #
-# CONFIG_STE_MODEM_RPROC is not set
+# CONFIG_REMOTEPROC is not set

  #
  # Rpmsg drivers
@@ -4154,11 +4187,17 @@
  # CONFIG_EFI_CAPSULE_LOADER is not set
  # CONFIG_EFI_TEST is not set
  CONFIG_UEFI_CPER=y
+# CONFIG_EFI_DEV_PATH_PARSER is not set
+
+#
+# Tegra firmware driver
+#

  #
  # File systems
  #
  CONFIG_DCACHE_WORD_ACCESS=y
+CONFIG_FS_IOMAP=y
  # CONFIG_EXT2_FS is not set
  # CONFIG_EXT3_FS is not set
  CONFIG_EXT4_FS=y
@@ -4201,6 +4240,7 @@
  CONFIG_FUSE_FS=m
  # CONFIG_CUSE is not set
  CONFIG_OVERLAY_FS=m
+# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set

  #
  # Caches
@@ -4360,6 +4400,7 @@
  # printk and dmesg options
  #
  # CONFIG_PRINTK_TIME is not set
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
  CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
  # CONFIG_BOOT_PRINTK_DELAY is not set
  # CONFIG_DYNAMIC_DEBUG is not set
@@ -4466,7 +4507,6 @@
  # CONFIG_TORTURE_TEST is not set
  # CONFIG_RCU_PERF_TEST is not set
  # CONFIG_RCU_TORTURE_TEST is not set
-# CONFIG_WAKE_TORTURE_TEST is not set
  CONFIG_RCU_CPU_STALL_TIMEOUT=60
  # CONFIG_RCU_TRACE is not set
  CONFIG_RCU_EQS_DEBUG=y
@@ -4595,7 +4635,6 @@
  #
  CONFIG_KEYS=y
  # CONFIG_PERSISTENT_KEYRINGS is not set
-# CONFIG_BIG_KEYS is not set
  # CONFIG_TRUSTED_KEYS is not set
  CONFIG_ENCRYPTED_KEYS=m
  # CONFIG_KEY_DH_OPERATIONS is not set
@@ -4650,6 +4689,7 @@
  CONFIG_CRYPTO_RNG_DEFAULT=m
  CONFIG_CRYPTO_AKCIPHER2=y
  CONFIG_CRYPTO_KPP2=y
+CONFIG_CRYPTO_ACOMP2=y
  # CONFIG_CRYPTO_RSA is not set
  # CONFIG_CRYPTO_DH is not set
  # CONFIG_CRYPTO_ECDH is not set
