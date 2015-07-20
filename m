From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150720 build: 1 failures 21 warnings (next-20150720)
Date: Mon, 20 Jul 2015 08:49:38 +0100
Message-ID: <E1ZH5pS-0005rv-Dg@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59746 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755503AbbGTHtp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2015 03:49:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150720
Git describe: next-20150720
Commit: 708e764f20 Add linux-next specific files for 20150720

Build Time: 0 min 9 sec

Passed:    5 / 6   ( 83.33 %)
Failed:    1 / 6   ( 16.67 %)

Errors: 4
Warnings: 21
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/sched.h:1899:21: error: static declaration of 'task_pid_nr' follows non-static declaration
../include/linux/sched.h:2427:28: error: conflicting types for 'find_task_by_vpid'
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     10 warnings    0 mismatches  : arm-multi_v7_defconfig
     25 warnings    0 mismatches  : arm-allmodconfig
      4 warnings    0 mismatches  : arm-allnoconfig
      9 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  8 ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	  8 ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	  1 ../include/linux/sched.h:2427:28: error: conflicting types for 'find_task_by_vpid'
	  1 ../include/linux/sched.h:1899:21: error: static declaration of 'task_pid_nr' follows non-static declaration

Warnings Summary: 21
	  8 ../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	  6 <stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	  6 <stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	  6 <stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  6 <stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	  1 ../sound/soc/codecs/rt5645.c:2931:3: warning: 'return' with a value, in function returning void [enabled by default]
	  1 ../net/ipv4/inet_hashtables.c:617:13: warning: division by zero [-Wdiv-by-zero]
	  1 ../net/bluetooth/mgmt.c:6613:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6613:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/ntb/ntb_transport.c:778:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/block/nvme-core.c:1849:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1807:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6613:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6613:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 18 errors, 25 warnings, 0 section mismatches

Errors:
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/sched.h:1899:21: error: static declaration of 'task_pid_nr' follows non-static declaration
	../include/linux/sched.h:2427:28: error: conflicting types for 'find_task_by_vpid'
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
	../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/block/nvme-core.c:1807:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1849:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/codecs/rt5645.c:2931:3: warning: 'return' with a value, in function returning void [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../include/linux/coresight.h:259:7: warning: assignment makes pointer from integer without a cast [enabled by default]
	../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/ntb/ntb_transport.c:778:3: warning: right shift count >= width of type [enabled by default]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../net/ipv4/inet_hashtables.c:617:13: warning: division by zero [-Wdiv-by-zero]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
