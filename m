From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151021 build: 1 failures 55 warnings (next-20151021)
Date: Wed, 21 Oct 2015 10:56:52 +0100
Message-ID: <E1Zoq8a-0001YX-EQ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40420 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754331AbbJUJ5D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2015 05:57:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151021
Git describe: next-20151021
Commit: 5d491cc5b8 Add linux-next specific files for 20151021

Build Time: 75 min 4 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 33
Warnings: 55
Section Mismatches: 1

Failed defconfigs:
	arm-allnoconfig

Errors:

	arm-allnoconfig
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../include/linux/uaccess.h:88:13: error: storage class specified for parameter '__probe_kernel_read'
../include/linux/uaccess.h:99:21: error: storage class specified for parameter 'probe_kernel_write'
../include/linux/uaccess.h:99:21: error: 'no_instrument_function' attribute applies only to functions
../include/linux/uaccess.h:100:21: error: storage class specified for parameter '__probe_kernel_write'
../include/linux/uaccess.h:100:21: error: 'no_instrument_function' attribute applies only to functions
../include/linux/uaccess.h:102:13: error: storage class specified for parameter 'strncpy_from_unsafe'
../arch/arm/include/asm/glue-cache.h:133:20: error: storage class specified for parameter 'nop_flush_icache_all'
../arch/arm/include/asm/glue-cache.h:133:20: error: 'no_instrument_function' attribute applies only to functions
../arch/arm/include/asm/glue-cache.h:133:47: error: expected ';', ',' or ')' before '{' token
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../include/linux/ksm.h:69:19: error: storage class specified for parameter 'ksm_fork'
../include/linux/ksm.h:69:19: error: 'no_instrument_function' attribute applies only to functions
../include/linux/ksm.h:70:1: error: expected ';', ',' or ')' before '{' token
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../mm/internal.h:44:20: error: storage class specified for parameter 'set_page_count'
../mm/internal.h:44:20: error: 'no_instrument_function' attribute applies only to functions
../mm/internal.h:45:1: error: expected ';', ',' or ')' before '{' token
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../include/linux/cpu.h:30:12: error: storage class specified for parameter 'register_cpu'
../include/linux/cpu.h:31:23: error: storage class specified for parameter 'get_cpu_device'
../include/linux/cpu.h:32:13: error: storage class specified for parameter 'cpu_is_hotpluggable'
../include/linux/cpu.h:33:13: error: storage class specified for parameter 'arch_match_cpu_phys_id'
../include/linux/cpu.h:34:13: error: storage class specified for parameter 'arch_find_n_match_cpu_physical_id'
../include/linux/cpu.h:37:12: error: storage class specified for parameter 'cpu_add_dev_attr'
../include/linux/cpu.h:38:13: error: storage class specified for parameter 'cpu_remove_dev_attr'
../include/linux/cpu.h:40:12: error: storage class specified for parameter 'cpu_add_dev_attr_group'
../include/linux/cpu.h:41:13: error: storage class specified for parameter 'cpu_remove_dev_attr_group'
../include/linux/cpu.h:44:16: error: storage class specified for parameter 'cpu_device_create'
../include/linux/cpu.h:184:19: error: storage class specified for parameter 'register_cpu_notifier'
../include/linux/cpu.h:184:19: error: 'no_instrument_function' attribute applies only to functions
../include/linux/cpu.h:185:1: error: expected ';', ',' or ')' before '{' token
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../mm/internal.h:44:20: error: storage class specified for parameter 'set_page_count'
../mm/internal.h:44:20: error: 'no_instrument_function' attribute applies only to functions
../mm/internal.h:45:1: error: expected ';', ',' or ')' before '{' token
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../include/linux/cpu.h:30:12: error: storage class specified for parameter 'register_cpu'
../include/linux/cpu.h:31:23: error: storage class specified for parameter 'get_cpu_device'
../include/linux/cpu.h:32:13: error: storage class specified for parameter 'cpu_is_hotpluggable'
../include/linux/cpu.h:33:13: error: storage class specified for parameter 'arch_match_cpu_phys_id'
../include/linux/cpu.h:34:13: error: storage class specified for parameter 'arch_find_n_match_cpu_physical_id'
../include/linux/cpu.h:37:12: error: storage class specified for parameter 'cpu_add_dev_attr'
../include/linux/cpu.h:38:13: error: storage class specified for parameter 'cpu_remove_dev_attr'
../include/linux/cpu.h:40:12: error: storage class specified for parameter 'cpu_add_dev_attr_group'
../include/linux/cpu.h:41:13: error: storage class specified for parameter 'cpu_remove_dev_attr_group'
../include/linux/cpu.h:44:16: error: storage class specified for parameter 'cpu_device_create'
../include/linux/cpu.h:184:19: error: storage class specified for parameter 'register_cpu_notifier'
../include/linux/cpu.h:184:19: error: 'no_instrument_function' attribute applies only to functions
../include/linux/cpu.h:185:1: error: expected ';', ',' or ')' before '{' token
../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
../include/linux/rbtree_augmented.h:44:13: error: storage class specified for parameter '__rb_insert_augmented'
../include/linux/rbtree_augmented.h:57:1: error: storage class specified for parameter 'rb_insert_augmented'
../include/linux/rbtree_augmented.h:57:1: error: 'no_instrument_function' attribute applies only to functions
../include/linux/rbtree_augmented.h:59:1: error: expected ';', ',' or ')' before '{' token

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     78 warnings    3 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     38 warnings    0 mismatches  : arm-allmodconfig
     17 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 33
	  7 ../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	  2 ../mm/internal.h:45:1: error: expected ';', ',' or ')' before '{' token
	  2 ../mm/internal.h:44:20: error: storage class specified for parameter 'set_page_count'
	  2 ../mm/internal.h:44:20: error: 'no_instrument_function' attribute applies only to functions
	  2 ../include/linux/cpu.h:44:16: error: storage class specified for parameter 'cpu_device_create'
	  2 ../include/linux/cpu.h:41:13: error: storage class specified for parameter 'cpu_remove_dev_attr_group'
	  2 ../include/linux/cpu.h:40:12: error: storage class specified for parameter 'cpu_add_dev_attr_group'
	  2 ../include/linux/cpu.h:38:13: error: storage class specified for parameter 'cpu_remove_dev_attr'
	  2 ../include/linux/cpu.h:37:12: error: storage class specified for parameter 'cpu_add_dev_attr'
	  2 ../include/linux/cpu.h:34:13: error: storage class specified for parameter 'arch_find_n_match_cpu_physical_id'
	  2 ../include/linux/cpu.h:33:13: error: storage class specified for parameter 'arch_match_cpu_phys_id'
	  2 ../include/linux/cpu.h:32:13: error: storage class specified for parameter 'cpu_is_hotpluggable'
	  2 ../include/linux/cpu.h:31:23: error: storage class specified for parameter 'get_cpu_device'
	  2 ../include/linux/cpu.h:30:12: error: storage class specified for parameter 'register_cpu'
	  2 ../include/linux/cpu.h:185:1: error: expected ';', ',' or ')' before '{' token
	  2 ../include/linux/cpu.h:184:19: error: storage class specified for parameter 'register_cpu_notifier'
	  2 ../include/linux/cpu.h:184:19: error: 'no_instrument_function' attribute applies only to functions
	  1 ../include/linux/uaccess.h:99:21: error: storage class specified for parameter 'probe_kernel_write'
	  1 ../include/linux/uaccess.h:99:21: error: 'no_instrument_function' attribute applies only to functions
	  1 ../include/linux/uaccess.h:88:13: error: storage class specified for parameter '__probe_kernel_read'
	  1 ../include/linux/uaccess.h:102:13: error: storage class specified for parameter 'strncpy_from_unsafe'
	  1 ../include/linux/uaccess.h:100:21: error: storage class specified for parameter '__probe_kernel_write'
	  1 ../include/linux/uaccess.h:100:21: error: 'no_instrument_function' attribute applies only to functions
	  1 ../include/linux/rbtree_augmented.h:59:1: error: expected ';', ',' or ')' before '{' token
	  1 ../include/linux/rbtree_augmented.h:57:1: error: storage class specified for parameter 'rb_insert_augmented'
	  1 ../include/linux/rbtree_augmented.h:57:1: error: 'no_instrument_function' attribute applies only to functions
	  1 ../include/linux/rbtree_augmented.h:44:13: error: storage class specified for parameter '__rb_insert_augmented'
	  1 ../include/linux/ksm.h:70:1: error: expected ';', ',' or ')' before '{' token
	  1 ../include/linux/ksm.h:69:19: error: storage class specified for parameter 'ksm_fork'
	  1 ../include/linux/ksm.h:69:19: error: 'no_instrument_function' attribute applies only to functions
	  1 ../arch/arm/include/asm/glue-cache.h:133:47: error: expected ';', ',' or ')' before '{' token
	  1 ../arch/arm/include/asm/glue-cache.h:133:20: error: storage class specified for parameter 'nop_flush_icache_all'
	  1 ../arch/arm/include/asm/glue-cache.h:133:20: error: 'no_instrument_function' attribute applies only to functions

Warnings Summary: 55
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  7 <stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	  3 ../drivers/regulator/core.c:143:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../mm/internal.h:45:1: warning: 'always_inline' attribute ignored [-Wattributes]
	  2 ../mm/internal.h:44:20: warning: parameter 'set_page_count' declared 'inline' [enabled by default]
	  2 ../include/linux/cpu.h:185:1: warning: 'always_inline' attribute ignored [-Wattributes]
	  2 ../include/linux/cpu.h:184:19: warning: parameter 'register_cpu_notifier' declared 'inline' [enabled by default]
	  2 ../drivers/mfd/rtsx_pcr.c:565:6: warning: unused variable 'err' [-Wunused-variable]
	  2 ../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/netfilter/nfnetlink_log.c:320:14: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6661:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6661:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/rbtree_augmented.h:59:1: warning: 'always_inline' attribute ignored [-Wattributes]
	  1 ../include/linux/rbtree_augmented.h:58:20: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
	  1 ../include/linux/rbtree_augmented.h:58:20: warning: 'struct rb_augment_callbacks' declared inside parameter list [enabled by default]
	  1 ../include/linux/rbtree_augmented.h:57:1: warning: parameter 'rb_insert_augmented' declared 'inline' [enabled by default]
	  1 ../include/linux/ksm.h:70:1: warning: 'always_inline' attribute ignored [-Wattributes]
	  1 ../include/linux/ksm.h:69:19: warning: parameter 'ksm_fork' declared 'inline' [enabled by default]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/core/uverbs_cmd.c:1481:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/include/asm/glue-cache.h:133:20: warning: parameter 'nop_flush_icache_all' declared 'inline' [enabled by default]
	  1 ../arch/arm/include/asm/glue-cache.h:133:1: warning: 'always_inline' attribute ignored [-Wattributes]

Section Mismatch Summary: 1
	  3 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 78 warnings, 3 section mismatches

Warnings:
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/mfd/rtsx_pcr.c:565:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../drivers/regulator/core.c:143:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6661:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6661:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/regulator/core.c:143:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nfnetlink_log.c:320:14: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 38 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'long long int' [-Wformat]
	../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../drivers/infiniband/core/uverbs_cmd.c:1481:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/mfd/rtsx_pcr.c:565:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 55 errors, 17 warnings, 0 section mismatches

Errors:
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../include/linux/uaccess.h:88:13: error: storage class specified for parameter '__probe_kernel_read'
	../include/linux/uaccess.h:99:21: error: storage class specified for parameter 'probe_kernel_write'
	../include/linux/uaccess.h:99:21: error: 'no_instrument_function' attribute applies only to functions
	../include/linux/uaccess.h:100:21: error: storage class specified for parameter '__probe_kernel_write'
	../include/linux/uaccess.h:100:21: error: 'no_instrument_function' attribute applies only to functions
	../include/linux/uaccess.h:102:13: error: storage class specified for parameter 'strncpy_from_unsafe'
	../arch/arm/include/asm/glue-cache.h:133:20: error: storage class specified for parameter 'nop_flush_icache_all'
	../arch/arm/include/asm/glue-cache.h:133:20: error: 'no_instrument_function' attribute applies only to functions
	../arch/arm/include/asm/glue-cache.h:133:47: error: expected ';', ',' or ')' before '{' token
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../include/linux/ksm.h:69:19: error: storage class specified for parameter 'ksm_fork'
	../include/linux/ksm.h:69:19: error: 'no_instrument_function' attribute applies only to functions
	../include/linux/ksm.h:70:1: error: expected ';', ',' or ')' before '{' token
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../mm/internal.h:44:20: error: storage class specified for parameter 'set_page_count'
	../mm/internal.h:44:20: error: 'no_instrument_function' attribute applies only to functions
	../mm/internal.h:45:1: error: expected ';', ',' or ')' before '{' token
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../include/linux/cpu.h:30:12: error: storage class specified for parameter 'register_cpu'
	../include/linux/cpu.h:31:23: error: storage class specified for parameter 'get_cpu_device'
	../include/linux/cpu.h:32:13: error: storage class specified for parameter 'cpu_is_hotpluggable'
	../include/linux/cpu.h:33:13: error: storage class specified for parameter 'arch_match_cpu_phys_id'
	../include/linux/cpu.h:34:13: error: storage class specified for parameter 'arch_find_n_match_cpu_physical_id'
	../include/linux/cpu.h:37:12: error: storage class specified for parameter 'cpu_add_dev_attr'
	../include/linux/cpu.h:38:13: error: storage class specified for parameter 'cpu_remove_dev_attr'
	../include/linux/cpu.h:40:12: error: storage class specified for parameter 'cpu_add_dev_attr_group'
	../include/linux/cpu.h:41:13: error: storage class specified for parameter 'cpu_remove_dev_attr_group'
	../include/linux/cpu.h:44:16: error: storage class specified for parameter 'cpu_device_create'
	../include/linux/cpu.h:184:19: error: storage class specified for parameter 'register_cpu_notifier'
	../include/linux/cpu.h:184:19: error: 'no_instrument_function' attribute applies only to functions
	../include/linux/cpu.h:185:1: error: expected ';', ',' or ')' before '{' token
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../mm/internal.h:44:20: error: storage class specified for parameter 'set_page_count'
	../mm/internal.h:44:20: error: 'no_instrument_function' attribute applies only to functions
	../mm/internal.h:45:1: error: expected ';', ',' or ')' before '{' token
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../include/linux/cpu.h:30:12: error: storage class specified for parameter 'register_cpu'
	../include/linux/cpu.h:31:23: error: storage class specified for parameter 'get_cpu_device'
	../include/linux/cpu.h:32:13: error: storage class specified for parameter 'cpu_is_hotpluggable'
	../include/linux/cpu.h:33:13: error: storage class specified for parameter 'arch_match_cpu_phys_id'
	../include/linux/cpu.h:34:13: error: storage class specified for parameter 'arch_find_n_match_cpu_physical_id'
	../include/linux/cpu.h:37:12: error: storage class specified for parameter 'cpu_add_dev_attr'
	../include/linux/cpu.h:38:13: error: storage class specified for parameter 'cpu_remove_dev_attr'
	../include/linux/cpu.h:40:12: error: storage class specified for parameter 'cpu_add_dev_attr_group'
	../include/linux/cpu.h:41:13: error: storage class specified for parameter 'cpu_remove_dev_attr_group'
	../include/linux/cpu.h:44:16: error: storage class specified for parameter 'cpu_device_create'
	../include/linux/cpu.h:184:19: error: storage class specified for parameter 'register_cpu_notifier'
	../include/linux/cpu.h:184:19: error: 'no_instrument_function' attribute applies only to functions
	../include/linux/cpu.h:185:1: error: expected ';', ',' or ')' before '{' token
	../include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
	../include/linux/rbtree_augmented.h:44:13: error: storage class specified for parameter '__rb_insert_augmented'
	../include/linux/rbtree_augmented.h:57:1: error: storage class specified for parameter 'rb_insert_augmented'
	../include/linux/rbtree_augmented.h:57:1: error: 'no_instrument_function' attribute applies only to functions
	../include/linux/rbtree_augmented.h:59:1: error: expected ';', ',' or ')' before '{' token

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../arch/arm/include/asm/glue-cache.h:133:20: warning: parameter 'nop_flush_icache_all' declared 'inline' [enabled by default]
	../arch/arm/include/asm/glue-cache.h:133:1: warning: 'always_inline' attribute ignored [-Wattributes]
	../include/linux/ksm.h:69:19: warning: parameter 'ksm_fork' declared 'inline' [enabled by default]
	../include/linux/ksm.h:70:1: warning: 'always_inline' attribute ignored [-Wattributes]
	../mm/internal.h:44:20: warning: parameter 'set_page_count' declared 'inline' [enabled by default]
	../mm/internal.h:45:1: warning: 'always_inline' attribute ignored [-Wattributes]
	../include/linux/cpu.h:184:19: warning: parameter 'register_cpu_notifier' declared 'inline' [enabled by default]
	../include/linux/cpu.h:185:1: warning: 'always_inline' attribute ignored [-Wattributes]
	../mm/internal.h:44:20: warning: parameter 'set_page_count' declared 'inline' [enabled by default]
	../mm/internal.h:45:1: warning: 'always_inline' attribute ignored [-Wattributes]
	../include/linux/cpu.h:184:19: warning: parameter 'register_cpu_notifier' declared 'inline' [enabled by default]
	../include/linux/cpu.h:185:1: warning: 'always_inline' attribute ignored [-Wattributes]
	../include/linux/rbtree_augmented.h:58:20: warning: 'struct rb_augment_callbacks' declared inside parameter list [enabled by default]
	../include/linux/rbtree_augmented.h:58:20: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
	../include/linux/rbtree_augmented.h:57:1: warning: parameter 'rb_insert_augmented' declared 'inline' [enabled by default]
	../include/linux/rbtree_augmented.h:59:1: warning: 'always_inline' attribute ignored [-Wattributes]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:143:6: warning: unused variable 'i' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
