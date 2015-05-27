From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150527 build: 1 failures 182 warnings (next-20150527)
Date: Wed, 27 May 2015 13:31:34 +0100
Message-ID: <E1YxaUg-0006Ob-Kd@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58493 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159AbbE0Mbq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2015 08:31:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150527
Git describe: next-20150527
Commit: 8a383d3e66 Add linux-next specific files for 20150527

Build Time: 64 min 53 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 182
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/staging/wilc1000/linux_wlan.c:18:22: fatal error: asm/gpio.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
    133 warnings    1 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
     52 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/staging/wilc1000/linux_wlan.c:18:22: fatal error: asm/gpio.h: No such file or directory

Warnings Summary: 182
	 11 <stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	  2 ../drivers/staging/wilc1000/wilc_wlan.c:897:11: warning: unused variable 'val32' [-Wunused-variable]
	  2 ../drivers/staging/wilc1000/wilc_spi.c:1200:4: warning: too many arguments for format [-Wformat-extra-args]
	  2 ../drivers/staging/wilc1000/wilc_spi.c:1197:3: warning: too many arguments for format [-Wformat-extra-args]
	  2 ../drivers/staging/lustre/lustre/obdclass/acl.c:123:6: warning: unused variable 'old_size' [-Wunused-variable]
	  2 ../drivers/staging/lustre/lustre/lov/lov_request.c:78:7: warning: unused variable 'len' [-Wunused-variable]
	  2 ../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	  1 arch/arm/configs/multi_v7_defconfig:601:warning: override: reassigning to symbol COMMON_CLK_QCOM
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/acct.c:174:2: warning: value computed is not used [-Wunused-value]
	  1 ../include/trace/trace_events.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../drivers/usb/renesas_usbhs/common.c:492:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wlan.c:2322:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat]
	  1 ../drivers/staging/wilc1000/wilc_wlan.c:2322:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat=]
	  1 ../drivers/staging/wilc1000/wilc_wlan.c:2305:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat]
	  1 ../drivers/staging/wilc1000/wilc_wlan.c:2305:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat=]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:938:97: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:935:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:853:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'size_t' [-Wformat=]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:839:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:672:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'size_t' [-Wformat=]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:2: warning: initialization from incompatible pointer type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:2: warning: (near initialization for 'WILC_WFI_cfg80211_ops.get_station') [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:17: warning: initialization from incompatible pointer type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:17: warning: (near initialization for 'WILC_WFI_cfg80211_ops.get_station')
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:2: warning: initialization from incompatible pointer type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:2: warning: (near initialization for 'WILC_WFI_cfg80211_ops.change_station') [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:20: warning: initialization from incompatible pointer type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:20: warning: (near initialization for 'WILC_WFI_cfg80211_ops.change_station')
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:2: warning: initialization from incompatible pointer type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:2: warning: (near initialization for 'WILC_WFI_cfg80211_ops.add_station') [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:17: warning: initialization from incompatible pointer type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:17: warning: (near initialization for 'WILC_WFI_cfg80211_ops.add_station')
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4100:41: warning: passing argument 1 of 'WILC_WFI_init_mon_interface' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4100:3: warning: passing argument 1 of 'WILC_WFI_init_mon_interface' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4001:25: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4001:25: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3933:12: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3933:12: warning: initialization discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3861:25: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3861:25: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3614:2: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat=]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3614:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3510:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3508:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3502:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3475:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3421:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3354:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3352:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3346:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3261:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3259:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3253:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1505:8: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1504:41: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1471:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1471:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1470:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1470:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1465:39: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1465:11: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1465:11: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1464:44: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1431:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1431:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1430:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1430:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1414:8: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1413:41: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1381:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1381:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1380:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1380:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1367:39: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1367:11: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1367:11: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1366:44: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1335:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1335:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1334:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1334:15: warning: assignment discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1250:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1250:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1156:7: warning: passing argument 3 of 'host_int_set_join_req' discards 'const' qualifier from pointer target type [enabled by default]
	  1 ../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1152:81: warning: passing argument 3 of 'host_int_set_join_req' discards 'const' qualifier from pointer target type
	  1 ../drivers/staging/wilc1000/wilc_spi.c:407:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
	  1 ../drivers/staging/wilc1000/linux_wlan.c:2612:16: warning: unused variable 'ih' [-Wunused-variable]
	  1 ../drivers/staging/wilc1000/linux_wlan.c:2611:8: warning: unused variable 'pu8UdpBuffer' [-Wunused-variable]
	  1 ../drivers/staging/wilc1000/linux_wlan.c:2039:1: warning: label '_fail_irq_init_' defined but not used [-Wunused-label]
	  1 ../drivers/staging/wilc1000/linux_wlan.c:1714:1: warning: label '_fail_1' defined but not used [-Wunused-label]
	  1 ../drivers/staging/wilc1000/host_interface.c:900:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:862:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:802:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:758:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:711:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:708:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:7073:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:7070:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:706:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:7011:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:6964:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:6958:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:6859:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:665:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:6643:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:662:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:651:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:625:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:6160:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:6068:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:5817:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4349:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4298:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4280:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4230:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4206:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4138:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4086:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:4000:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3948:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3890:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3813:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3769:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3721:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3665:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3568:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3523:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3442:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3428:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3380:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3330:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3299:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3255:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3211:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3166:72: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3162:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3098:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3049:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:3010:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2969:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2912:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2865:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2819:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2810:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2798:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2770:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2664:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2660:68: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2239:71: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2235:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:2209:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:1993:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:1981:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:1453:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:1375:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/wilc1000/host_interface.c:1208:70: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11880:6: warning: 'crtc' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11856:14: warning: 'crtc_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/i2c/tda998x_drv.c:647:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat=]
	  1 ../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/block/nvme-core.c:1832:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1793:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1789:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1767:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
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
arm64-allmodconfig : FAIL, 1 errors, 133 warnings, 1 section mismatches

Errors:
	../drivers/staging/wilc1000/linux_wlan.c:18:22: fatal error: asm/gpio.h: No such file or directory

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/i2c/tda998x_drv.c:647:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat=]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	../drivers/staging/lustre/lustre/lov/lov_request.c:78:7: warning: unused variable 'len' [-Wunused-variable]
	../drivers/usb/renesas_usbhs/common.c:492:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/lustre/lustre/obdclass/acl.c:123:6: warning: unused variable 'old_size' [-Wunused-variable]
	../drivers/staging/wilc1000/wilc_wlan.c:897:11: warning: unused variable 'val32' [-Wunused-variable]
	../drivers/staging/wilc1000/wilc_wlan.c:2305:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat=]
	../drivers/staging/wilc1000/wilc_wlan.c:2322:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat=]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:672:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'size_t' [-Wformat=]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:839:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:853:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'size_t' [-Wformat=]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:935:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:938:97: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1152:81: warning: passing argument 3 of 'host_int_set_join_req' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1250:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1250:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1334:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1335:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1366:44: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1367:39: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1380:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1381:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1413:41: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1430:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1431:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1464:44: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1465:39: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1470:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1471:15: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1504:41: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3253:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3259:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3261:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3346:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3352:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3354:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3421:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3475:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3502:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3508:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3510:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3614:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3614:2: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat=]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3861:25: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3933:12: warning: initialization discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4001:25: warning: assignment discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4100:41: warning: passing argument 1 of 'WILC_WFI_init_mon_interface' discards 'const' qualifier from pointer target type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:17: warning: initialization from incompatible pointer type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:17: warning: (near initialization for 'WILC_WFI_cfg80211_ops.add_station')
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:20: warning: initialization from incompatible pointer type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:20: warning: (near initialization for 'WILC_WFI_cfg80211_ops.change_station')
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:17: warning: initialization from incompatible pointer type
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:17: warning: (near initialization for 'WILC_WFI_cfg80211_ops.get_station')
	../drivers/staging/wilc1000/host_interface.c:625:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:651:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/host_interface.c:662:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:665:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:706:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:708:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:711:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:758:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:802:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:862:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:900:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:1208:70: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:1375:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:1453:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:1981:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:1993:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2209:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2235:66: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2239:71: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2660:68: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2664:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2770:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2798:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2810:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2819:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2865:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2912:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:2969:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3010:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3049:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3098:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3162:67: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3166:72: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3211:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3255:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3299:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3330:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3380:74: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3428:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3442:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3523:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3568:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3665:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3721:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3769:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3813:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3890:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:3948:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4000:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4086:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4138:60: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4206:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4230:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4280:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4298:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:4349:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:5817:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:6068:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:6160:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:6643:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:6859:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:6958:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/host_interface.c:6964:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/host_interface.c:7011:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/host_interface.c:7070:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/wilc1000/host_interface.c:7073:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/wilc1000/wilc_spi.c:407:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
	../drivers/staging/wilc1000/wilc_spi.c:1197:3: warning: too many arguments for format [-Wformat-extra-args]
	../drivers/staging/wilc1000/wilc_spi.c:1200:4: warning: too many arguments for format [-Wformat-extra-args]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:601:warning: override: reassigning to symbol COMMON_CLK_QCOM
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/i915/intel_display.c:11856:14: warning: 'crtc_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/i915/intel_display.c:11880:6: warning: 'crtc' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 52 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../kernel/acct.c:174:2: warning: value computed is not used [-Wunused-value]
	../drivers/block/nvme-core.c:1767:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1789:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1793:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1832:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	../include/trace/trace_events.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/staging/lustre/lustre/lov/lov_request.c:78:7: warning: unused variable 'len' [-Wunused-variable]
	../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	../drivers/staging/lustre/lustre/obdclass/acl.c:123:6: warning: unused variable 'old_size' [-Wunused-variable]
	../drivers/staging/wilc1000/wilc_wlan.c:897:11: warning: unused variable 'val32' [-Wunused-variable]
	../drivers/staging/wilc1000/wilc_wlan.c:2305:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat]
	../drivers/staging/wilc1000/wilc_wlan.c:2322:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint8_t *' [-Wformat]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1156:7: warning: passing argument 3 of 'host_int_set_join_req' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1334:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1335:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1367:11: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1367:11: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1380:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1381:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1414:8: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1430:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1431:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1465:11: warning: passing argument 2 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1465:11: warning: passing argument 6 of 'host_int_add_rx_gtk' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1470:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1471:15: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:1505:8: warning: passing argument 2 of 'host_int_add_ptk' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3861:25: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:3933:12: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4001:25: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4100:3: warning: passing argument 1 of 'WILC_WFI_init_mon_interface' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:2: warning: initialization from incompatible pointer type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:2: warning: (near initialization for 'WILC_WFI_cfg80211_ops.add_station') [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:2: warning: initialization from incompatible pointer type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4186:2: warning: (near initialization for 'WILC_WFI_cfg80211_ops.change_station') [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:2: warning: initialization from incompatible pointer type [enabled by default]
	../drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4189:2: warning: (near initialization for 'WILC_WFI_cfg80211_ops.get_station') [enabled by default]
	../drivers/staging/wilc1000/linux_wlan.c:1714:1: warning: label '_fail_1' defined but not used [-Wunused-label]
	../drivers/staging/wilc1000/linux_wlan.c:2039:1: warning: label '_fail_irq_init_' defined but not used [-Wunused-label]
	../drivers/staging/wilc1000/linux_wlan.c:2612:16: warning: unused variable 'ih' [-Wunused-variable]
	../drivers/staging/wilc1000/linux_wlan.c:2611:8: warning: unused variable 'pu8UdpBuffer' [-Wunused-variable]
	../drivers/staging/wilc1000/wilc_spi.c:1197:3: warning: too many arguments for format [-Wformat-extra-args]
	../drivers/staging/wilc1000/wilc_spi.c:1200:4: warning: too many arguments for format [-Wformat-extra-args]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
