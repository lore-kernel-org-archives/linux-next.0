From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160418 build: 1 failures 20 warnings (next-20160418)
Date: Mon, 18 Apr 2016 09:38:01 +0100
Message-ID: <E1as4gz-00062h-Ad@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50572 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751015AbcDRIiP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Apr 2016 04:38:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160418
Git describe: next-20160418
Commit: 1bd7a2081d Add linux-next specific files for 20160418

Build Time: 87 min 10 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 20
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__bad_udelay" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     11 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : x86_64-defconfig
     14 warnings    0 mismatches  : arm-allmodconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__bad_udelay" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!

Warnings Summary: 20
	  5 <stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	  5 <stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	  5 ../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  5 ../drivers/regulator/core.c:2514:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	  3 ../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  2 ../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  2 ../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../kernel/trace/bpf_trace.c:372:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../kernel/trace/bpf_trace.c:354:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/core.c:2514:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2514:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/core.c:2514:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
	../net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
	../net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
	../net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 14 warnings, 0 section mismatches

Errors:
	ERROR: "__bad_udelay" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!

Warnings:
	../kernel/trace/bpf_trace.c:354:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../kernel/trace/bpf_trace.c:372:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/regulator/core.c:2514:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/regulator/core.c:2514:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-allnoconfig
