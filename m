From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150603 build: 5 failures 55 warnings (next-20150603)
Date: Wed, 03 Jun 2015 14:06:03 +0100
Message-ID: <E1Z08Mt-0006dU-4j@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40626 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352AbbFCNGM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 09:06:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150603
Git describe: next-20150603
Commit: 273de33838 Add linux-next specific files for 20150603

Build Time: 64 min 44 sec

Passed:    4 / 9   ( 44.44 %)
Failed:    5 / 9   ( 55.56 %)

Errors: 10
Warnings: 55
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig
	arm-multi_v7_defconfig
	arm-allmodconfig
	arm-allnoconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

	arm-multi_v7_defconfig
../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

	arm-allmodconfig
../drivers/cpufreq/exynos-cpufreq.c:239:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
../drivers/tty/serial/8250/8250_omap.c:586:20: error: redefinition of 'omap8250_irq'

	arm64-defconfig
../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     30 warnings    1 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-multi_v5_defconfig
     18 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
     36 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 10
	  4 ../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	  4 ../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	  2 ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	  2 ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	  2 ../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	  2 ../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	  1 ../drivers/tty/serial/8250/8250_omap.c:586:20: error: redefinition of 'omap8250_irq'
	  1 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	  1 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	  1 ../drivers/cpufreq/exynos-cpufreq.c:239:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]

Warnings Summary: 55
	 11 warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	  8 <stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	  4 ../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	  4 ../include/linux/device.h:1301:1: warning: data definition has no type or storage class
	  4 ../include/linux/device.h:1296:1: warning: data definition has no type or storage class
	  4 ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
	  4 ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
	  4 ../drivers/clk/sunxi/clk-mod0.c:131:1: warning: parameter names (without types) in function declaration [enabled by default]
	  4 ../drivers/clk/sunxi/clk-mod0.c:131:1: warning: data definition has no type or storage class [enabled by default]
	  2 ../drivers/soc/tegra/fuse/fuse-tegra.c:171:24: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]
	  2 ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]
	  2 ../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	  2 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: parameter names (without types) in function declaration [enabled by default]
	  2 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: parameter names (without types) in function declaration
	  2 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: data definition has no type or storage class [enabled by default]
	  2 ../drivers/hwtracing/coresight/coresight-etm4x.c:2701:1: warning: parameter names (without types) in function declaration
	  2 ../drivers/clk/sunxi/clk-mod0.c:131:1: warning: 'sun4i_a10_mod0_clk_driver_init' defined but not used [-Wunused-function]
	  1 arch/arm/configs/multi_v7_defconfig:603:warning: override: reassigning to symbol COMMON_CLK_QCOM
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/ipv4/inet_hashtables.c:631:13: warning: division by zero [-Wdiv-by-zero]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/trace/trace_events.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/tty/serial/8250/8250_omap.c:560:20: warning: 'omap8250_irq' defined but not used [-Wunused-function]
	  1 ../drivers/scsi/advansys.c:7805:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:20: warning: 'replicator_driver_init' defined but not used [-Wunused-function]
	  1 ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: 'replicator_driver_init' defined but not used [-Wunused-function]
	  1 ../drivers/hwtracing/coresight/coresight-etm4x.c:2701:20: warning: 'etm4x_driver_init' defined but not used [-Wunused-function]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11877:6: warning: 'crtc' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11853:14: warning: 'crtc_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/cpufreq/exynos-cpufreq.c:239:1: warning: parameter names (without types) in function declaration [enabled by default]
	  1 ../drivers/cpufreq/exynos-cpufreq.c:239:1: warning: data definition has no type or storage class [enabled by default]
	  1 ../drivers/cpufreq/exynos-cpufreq.c:239:1: warning: 'exynos_cpufreq_platdrv_init' defined but not used [-Wunused-function]
	  1 ../drivers/block/nvme-core.c:1821:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1782:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1778:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1756:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  1 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 6 errors, 30 warnings, 1 section mismatches

Errors:
	../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/linux/device.h:1296:1: warning: data definition has no type or storage class
	../drivers/hwtracing/coresight/coresight-etm4x.c:2701:1: warning: parameter names (without types) in function declaration
	../include/linux/device.h:1301:1: warning: data definition has no type or storage class
	../drivers/hwtracing/coresight/coresight-etm4x.c:2701:1: warning: parameter names (without types) in function declaration
	../drivers/hwtracing/coresight/coresight-etm4x.c:2701:20: warning: 'etm4x_driver_init' defined but not used [-Wunused-function]
	../include/linux/device.h:1296:1: warning: data definition has no type or storage class
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: parameter names (without types) in function declaration
	../include/linux/device.h:1301:1: warning: data definition has no type or storage class
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: parameter names (without types) in function declaration
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:20: warning: 'replicator_driver_init' defined but not used [-Wunused-function]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/linux/device.h:1296:1: warning: data definition has no type or storage class
	../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	../include/linux/device.h:1301:1: warning: data definition has no type or storage class
	../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:24: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../net/ipv4/inet_hashtables.c:631:13: warning: division by zero [-Wdiv-by-zero]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : FAIL, 4 errors, 18 warnings, 0 section mismatches

Errors:
	../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Warnings:
	arch/arm/configs/multi_v7_defconfig:603:warning: override: reassigning to symbol COMMON_CLK_QCOM
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: 'sun4i_a10_mod0_clk_driver_init' defined but not used [-Wunused-function]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/i915/intel_display.c:11853:14: warning: 'crtc_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/i915/intel_display.c:11877:6: warning: 'crtc' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 8 errors, 36 warnings, 0 section mismatches

Errors:
	../drivers/cpufreq/exynos-cpufreq.c:239:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
	../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	../drivers/tty/serial/8250/8250_omap.c:586:20: error: redefinition of 'omap8250_irq'

Warnings:
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	warning: (ARCH_MXC) selects CLKSRC_IMX_GPT which has unmet direct dependencies (OF && BROKEN)
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/block/nvme-core.c:1756:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1778:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1782:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1821:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/cpufreq/exynos-cpufreq.c:239:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/cpufreq/exynos-cpufreq.c:239:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/cpufreq/exynos-cpufreq.c:239:1: warning: 'exynos_cpufreq_platdrv_init' defined but not used [-Wunused-function]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/clk/sunxi/clk-mod0.c:131:1: warning: 'sun4i_a10_mod0_clk_driver_init' defined but not used [-Wunused-function]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: warning: 'replicator_driver_init' defined but not used [-Wunused-function]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/trace/trace_events.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]
	../drivers/tty/serial/8250/8250_omap.c:560:20: warning: 'omap8250_irq' defined but not used [-Wunused-function]
	../drivers/scsi/advansys.c:7805:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 2 errors, 6 warnings, 0 section mismatches

Errors:
	../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../include/linux/device.h:1296:1: warning: data definition has no type or storage class
	../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	../include/linux/device.h:1301:1: warning: data definition has no type or storage class
	../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	../drivers/soc/tegra/fuse/fuse-tegra.c:171:24: warning: 'tegra_fuse_driver_init' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
