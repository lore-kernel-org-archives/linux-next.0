From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171102 build: 3 failures 26 warnings (next-20171102)
Date: Fri, 03 Nov 2017 02:25:27 +0000
Message-ID: <E1eARfj-0002Vt-6N@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44404 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964918AbdKCCZa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2017 22:25:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171102
Git describe: next-20171102
Commit: fa8785e862 Add linux-next specific files for 20171102

Build Time: 99 min 49 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 4
Warnings: 26
Section Mismatches: 0

Failed defconfigs:
	arm-multi_v4t_defconfig

Errors:

	arm-multi_v4t_defconfig
../lib/bug.c:212:32: error: 'module_bug_list' undeclared (first use in this function)
../include/linux/kernel.h:929:32: error: invalid type argument of unary '*' (have 'int')
../include/linux/rculist.h:351:49: error: dereferencing pointer to incomplete type 'struct module'
../include/linux/kernel.h:930:18: error: invalid type argument of unary '*' (have 'int')
../include/linux/kernel.h:929:32: error: invalid type argument of unary '*' (have 'int')
../include/linux/kernel.h:930:18: error: invalid type argument of unary '*' (have 'int')

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     21 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
     19 warnings    0 mismatches  : arm-allmodconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  2 ../include/linux/kernel.h:930:18: error: invalid type argument of unary '*' (have 'int')
	  2 ../include/linux/kernel.h:929:32: error: invalid type argument of unary '*' (have 'int')
	  1 ../lib/bug.c:212:32: error: 'module_bug_list' undeclared (first use in this function)
	  1 ../include/linux/rculist.h:351:49: error: dereferencing pointer to incomplete type 'struct module'

Warnings Summary: 26
	  4 ../include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast
	  2 ../sound/soc/stm/stm32_sai_sub.c:485:7: warning: 'cr1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../drivers/staging/rtlwifi/base.c:2167:23: warning: unused variable 'hw' [-Wunused-variable]
	  2 ../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1415:5: warning: unused variable 'ret2' [-Wunused-variable]
	  2 ../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1414:5: warning: unused variable 'ret1' [-Wunused-variable]
	  2 ../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
	  2 ../drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:693:20: warning: unused variable 'chip' [-Wunused-variable]
	  2 ../drivers/gpu/drm/vc4/vc4_bo.c:95:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  2 ../drivers/gpu/drm/vc4/vc4_bo.c:91:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
	  1 ../drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
	  1 ../drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2497:9: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1780:4: warning: 'skb' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:534:5: warning: this decimal constant is unsigned only in ISO C90
	  1 ../arch/arm/probes/kprobes/test-core.c:398:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  1 ../arch/arm/probes/kprobes/test-core.c:390:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : FAIL, 6 errors, 0 warnings, 0 section mismatches

Errors:
	../lib/bug.c:212:32: error: 'module_bug_list' undeclared (first use in this function)
	../include/linux/kernel.h:929:32: error: invalid type argument of unary '*' (have 'int')
	../include/linux/rculist.h:351:49: error: dereferencing pointer to incomplete type 'struct module'
	../include/linux/kernel.h:930:18: error: invalid type argument of unary '*' (have 'int')
	../include/linux/kernel.h:929:32: error: invalid type argument of unary '*' (have 'int')
	../include/linux/kernel.h:930:18: error: invalid type argument of unary '*' (have 'int')

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 21 warnings, 0 section mismatches

Warnings:
	../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../sound/soc/stm/stm32_sai_sub.c:485:7: warning: 'cr1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast
	../drivers/gpu/drm/vc4/vc4_bo.c:91:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/gpu/drm/vc4/vc4_bo.c:95:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:693:20: warning: unused variable 'chip' [-Wunused-variable]
	../drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2497:9: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1780:4: warning: 'skb' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
	../drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
	../drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
	../drivers/staging/rtlwifi/base.c:2167:23: warning: unused variable 'hw' [-Wunused-variable]
	../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1415:5: warning: unused variable 'ret2' [-Wunused-variable]
	../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1414:5: warning: unused variable 'ret1' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 19 warnings, 0 section mismatches

Warnings:
	../arch/arm/probes/kprobes/test-core.c:390:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../arch/arm/probes/kprobes/test-core.c:398:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../sound/soc/stm/stm32_sai_sub.c:485:7: warning: 'cr1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:534:5: warning: this decimal constant is unsigned only in ISO C90
	../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
	../drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/staging/rtlwifi/base.c:2167:23: warning: unused variable 'hw' [-Wunused-variable]
	../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1415:5: warning: unused variable 'ret2' [-Wunused-variable]
	../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1414:5: warning: unused variable 'ret1' [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/vc4/vc4_bo.c:91:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/gpu/drm/vc4/vc4_bo.c:95:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast
	../drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:693:20: warning: unused variable 'chip' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
