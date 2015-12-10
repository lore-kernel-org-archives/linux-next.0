From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151210 build: 4 failures 43 warnings (next-20151210)
Date: Thu, 10 Dec 2015 08:06:07 +0000
Message-ID: <E1a6wEp-0000hU-7o@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40430 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753962AbbLJIGP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2015 03:06:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151210
Git describe: next-20151210
Commit: 8225f4e85c Add linux-next specific files for 20151210

Build Time: 0 min 24 sec

Passed:    5 / 9   ( 55.56 %)
Failed:    4 / 9   ( 44.44 %)

Errors: 56
Warnings: 43
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allmodconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../include/linux/wait.h:1217:2: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
../include/linux/jiffies.h:61:39: error: division by zero in #if
../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/jiffies.h:303:33: error: division by zero in #if
../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (first use in this function)
../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (first use in this function)
../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer but incomplete type
../include/linux/jiffies.h:417:9: error: implicit declaration of function 'timespec_to_timespec64' [-Werror=implicit-function-declaration]
../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomplete type
../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
../include/linux/jiffies.h:428:2: error: dereferencing pointer to incomplete type
../include/linux/jiffies.h:428:2: error: implicit declaration of function 'timespec64_to_timespec' [-Werror=implicit-function-declaration]
../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first use in this function)
../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use in this function)
../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first use in this function)
../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete type
../include/linux/ktime.h:81:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete type
../include/linux/ktime.h:87:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete type
../include/linux/ktime.h:93:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplete type
../include/linux/ktime.h:248:3: error: implicit declaration of function 'ns_to_timespec' [-Werror=implicit-function-declaration]
../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplete type
../include/linux/ktime.h:267:3: error: implicit declaration of function 'ns_to_timespec64' [-Werror=implicit-function-declaration]
../include/linux/timekeeping.h:25:31: error: return type is an incomplete type
../include/linux/timekeeping.h:27:9: error: variable 'now' has initializer but incomplete type
../include/linux/timekeeping.h:27:9: error: invalid use of undefined type 'struct timespec64'
../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't known
../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
../include/linux/timekeeping.h:79:31: error: return type is an incomplete type
../include/linux/timekeeping.h:81:2: error: invalid use of undefined type 'struct timespec64'
../include/linux/timekeeping.h:242:2: error: dereferencing pointer to incomplete type
../include/linux/timekeeping.h:247:2: error: dereferencing pointer to incomplete type
../include/linux/timekeeping.h:252:2: error: dereferencing pointer to incomplete type
../include/linux/jump_label.h:187:2: error: implicit declaration of function 'atomic_inc' [-Werror=implicit-function-declaration]
../include/linux/jump_label.h:193:2: error: implicit declaration of function 'atomic_dec' [-Werror=implicit-function-declaration]
../include/linux/time64.h:45:31: error: conflicting types for 'timespec64_to_timespec'
../include/linux/time64.h:50:33: error: conflicting types for 'timespec_to_timespec64'
../include/linux/time.h:215:24: error: conflicting types for 'ns_to_timespec'

	arm64-allmodconfig
../include/linux/wait.h:40:2: error: unknown type name 'spinlock_t'
../include/linux/wait.h:1217:2: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
../include/linux/wait.h:76:32: error: storage size of '__key' isn't known
../include/linux/jiffies.h:61:39: error: division by zero in #if
../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/jiffies.h:303:33: error: division by zero in #if
../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (first use in this function)
../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (first use in this function)
../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer but incomplete type
../include/linux/jiffies.h:417:9: error: implicit declaration of function 'timespec_to_timespec64' [-Werror=implicit-function-declaration]
../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomplete type
../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
../include/linux/jiffies.h:428:2: error: dereferencing pointer to incomplete type
../include/linux/jiffies.h:428:2: error: implicit declaration of function 'timespec64_to_timespec' [-Werror=implicit-function-declaration]
../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first use in this function)
../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use in this function)
../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first use in this function)
../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete type
../include/linux/ktime.h:81:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete type
../include/linux/ktime.h:87:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete type
../include/linux/ktime.h:93:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplete type
../include/linux/ktime.h:248:3: error: implicit declaration of function 'ns_to_timespec' [-Werror=implicit-function-declaration]
../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplete type
../include/linux/ktime.h:267:3: error: implicit declaration of function 'ns_to_timespec64' [-Werror=implicit-function-declaration]
../include/linux/timekeeping.h:25:31: error: return type is an incomplete type
../include/linux/timekeeping.h:27:9: error: variable 'now' has initializer but incomplete type
../include/linux/timekeeping.h:27:9: error: invalid use of undefined type 'struct timespec64'
../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't known
../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
../include/linux/timekeeping.h:79:31: error: return type is an incomplete type
../include/linux/timekeeping.h:81:2: error: invalid use of undefined type 'struct timespec64'
../include/linux/timekeeping.h:242:2: error: dereferencing pointer to incomplete type
../include/linux/timekeeping.h:247:2: error: dereferencing pointer to incomplete type
../include/linux/timekeeping.h:252:2: error: dereferencing pointer to incomplete type
../include/linux/rcupdate.h:490:2: error: implicit declaration of function 'lock_acquire' [-Werror=implicit-function-declaration]
../include/linux/rcupdate.h:495:2: error: implicit declaration of function 'lock_release' [-Werror=implicit-function-declaration]
../include/linux/rcupdate.h:572:2: error: implicit declaration of function 'lock_is_held' [-Werror=implicit-function-declaration]
../include/linux/rcupdate.h:572:2: error: implicit declaration of function 'lockdep_rcu_suspicious' [-Werror=implicit-function-declaration]
../include/linux/time64.h:45:31: error: conflicting types for 'timespec64_to_timespec'
../include/linux/time64.h:50:33: error: conflicting types for 'timespec_to_timespec64'
../include/linux/time.h:215:24: error: conflicting types for 'ns_to_timespec'

	arm-allmodconfig
../fs/overlayfs/super.c:939:19: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)

	arm64-defconfig
../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     29 warnings    0 mismatches  : arm64-allnoconfig
     34 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 56
	  2 ../include/linux/wait.h:1217:2: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
	  2 ../include/linux/timekeeping.h:81:2: error: invalid use of undefined type 'struct timespec64'
	  2 ../include/linux/timekeeping.h:79:31: error: return type is an incomplete type
	  2 ../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
	  2 ../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
	  2 ../include/linux/timekeeping.h:27:9: error: variable 'now' has initializer but incomplete type
	  2 ../include/linux/timekeeping.h:27:9: error: invalid use of undefined type 'struct timespec64'
	  2 ../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't known
	  2 ../include/linux/timekeeping.h:25:31: error: return type is an incomplete type
	  2 ../include/linux/timekeeping.h:252:2: error: dereferencing pointer to incomplete type
	  2 ../include/linux/timekeeping.h:247:2: error: dereferencing pointer to incomplete type
	  2 ../include/linux/timekeeping.h:242:2: error: dereferencing pointer to incomplete type
	  2 ../include/linux/time64.h:50:33: error: conflicting types for 'timespec_to_timespec64'
	  2 ../include/linux/time64.h:45:31: error: conflicting types for 'timespec64_to_timespec'
	  2 ../include/linux/time.h:215:24: error: conflicting types for 'ns_to_timespec'
	  2 ../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete type
	  2 ../include/linux/ktime.h:93:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	  2 ../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete type
	  2 ../include/linux/ktime.h:87:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	  2 ../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete type
	  2 ../include/linux/ktime.h:81:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	  2 ../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:267:3: error: implicit declaration of function 'ns_to_timespec64' [-Werror=implicit-function-declaration]
	  2 ../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplete type
	  2 ../include/linux/ktime.h:248:3: error: implicit declaration of function 'ns_to_timespec' [-Werror=implicit-function-declaration]
	  2 ../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplete type
	  2 ../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
	  2 ../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	  2 ../include/linux/jiffies.h:61:39: error: division by zero in #if
	  2 ../include/linux/jiffies.h:428:2: error: implicit declaration of function 'timespec64_to_timespec' [-Werror=implicit-function-declaration]
	  2 ../include/linux/jiffies.h:428:2: error: dereferencing pointer to incomplete type
	  2 ../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
	  2 ../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer but incomplete type
	  2 ../include/linux/jiffies.h:417:9: error: implicit declaration of function 'timespec_to_timespec64' [-Werror=implicit-function-declaration]
	  2 ../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomplete type
	  2 ../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
	  2 ../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (first use in this function)
	  2 ../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (first use in this function)
	  2 ../include/linux/jiffies.h:303:33: error: division by zero in #if
	  2 ../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	  1 ../include/linux/wait.h:76:32: error: storage size of '__key' isn't known
	  1 ../include/linux/wait.h:40:2: error: unknown type name 'spinlock_t'
	  1 ../include/linux/rcupdate.h:572:2: error: implicit declaration of function 'lockdep_rcu_suspicious' [-Werror=implicit-function-declaration]
	  1 ../include/linux/rcupdate.h:572:2: error: implicit declaration of function 'lock_is_held' [-Werror=implicit-function-declaration]
	  1 ../include/linux/rcupdate.h:495:2: error: implicit declaration of function 'lock_release' [-Werror=implicit-function-declaration]
	  1 ../include/linux/rcupdate.h:490:2: error: implicit declaration of function 'lock_acquire' [-Werror=implicit-function-declaration]
	  1 ../include/linux/jump_label.h:193:2: error: implicit declaration of function 'atomic_dec' [-Werror=implicit-function-declaration]
	  1 ../include/linux/jump_label.h:187:2: error: implicit declaration of function 'atomic_inc' [-Werror=implicit-function-declaration]
	  1 ../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory
	  1 ../fs/overlayfs/super.c:939:19: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)

Warnings Summary: 43
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  2 ../include/linux/timekeeping.h:86:23: warning: passing argument 1 of 'getboottime64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:81:2: warning: 'return' with a value, in function returning void
	  2 ../include/linux/timekeeping.h:76:20: warning: passing argument 1 of 'getrawmonotonic64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:71:19: warning: passing argument 1 of 'getnstimeofday64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:66:17: warning: passing argument 1 of 'ktime_get_ts64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:61:19: warning: passing argument 1 of 'getnstimeofday64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:56:28: warning: passing argument 1 of '__getnstimeofday64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:51:27: warning: passing argument 1 of 'do_settimeofday64' from incompatible pointer type
	  2 ../include/linux/timekeeping.h:29:2: warning: 'return' with a value, in function returning void
	  2 ../include/linux/timekeeping.h:27:20: warning: unused variable 'now' [-Wunused-variable]
	  2 ../include/linux/timekeeping.h:15:24: warning: 'struct timezone' declared inside parameter list
	  2 ../include/linux/timekeeping.h:13:43: warning: 'struct timespec64' declared inside parameter list
	  2 ../include/linux/timekeeping.h:12:36: warning: 'struct timeval' declared inside parameter list
	  2 ../include/linux/ktime.h:93:47: warning: 'struct timeval' declared inside parameter list
	  2 ../include/linux/ktime.h:87:50: warning: 'struct timespec64' declared inside parameter list
	  2 ../include/linux/ktime.h:264:21: warning: 'struct timespec64' declared inside parameter list
	  2 ../include/linux/jiffies.h:61:21: warning: "NSEC_PER_SEC" is not defined [-Wundef]
	  2 ../include/linux/jiffies.h:433:18: warning: 'struct timeval' declared inside parameter list
	  2 ../include/linux/jiffies.h:431:54: warning: 'struct timeval' declared inside parameter list
	  2 ../include/linux/jiffies.h:425:20: warning: unused variable 'ts' [-Wunused-variable]
	  2 ../include/linux/jiffies.h:417:20: warning: unused variable 'ts' [-Wunused-variable]
	  2 ../include/linux/jiffies.h:414:14: warning: 'struct timespec64' declared inside parameter list
	  2 ../include/linux/jiffies.h:412:57: warning: 'struct timespec64' declared inside parameter list
	  2 ../include/linux/jiffies.h:366:7: warning: "USEC_PER_SEC" is not defined [-Wundef]
	  2 ../include/linux/jiffies.h:303:35: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	  2 ../include/linux/jiffies.h:303:12: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	  2 ../include/linux/jiffies.h:293:11: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	  2 ../include/linux/jiffies.h:257:10: warning: "NSEC_PER_SEC" is not defined [-Wundef]
	  2 ../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/mix.c:135:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/dvc.c:337:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/wait.h:76:32: warning: unused variable '__key' [-Wunused-variable]
	  1 ../include/linux/wait.h:72:82: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../include/linux/wait.h:72:82: warning: 'struct lock_class_key' declared inside parameter list
	  1 ../include/linux/lockdep.h:545:6: warning: conflicting types for 'lockdep_rcu_suspicious'
	  1 ../include/linux/lockdep.h:337:13: warning: conflicting types for 'lock_release'
	  1 ../include/linux/lockdep.h:333:13: warning: conflicting types for 'lock_acquire'
	  1 ../include/linux/jiffies.h:412:57: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 48 errors, 29 warnings, 0 section mismatches

Errors:
	../include/linux/wait.h:1217:2: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
	../include/linux/jiffies.h:61:39: error: division by zero in #if
	../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/jiffies.h:303:33: error: division by zero in #if
	../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (first use in this function)
	../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (first use in this function)
	../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer but incomplete type
	../include/linux/jiffies.h:417:9: error: implicit declaration of function 'timespec_to_timespec64' [-Werror=implicit-function-declaration]
	../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomplete type
	../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
	../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
	../include/linux/jiffies.h:428:2: error: dereferencing pointer to incomplete type
	../include/linux/jiffies.h:428:2: error: implicit declaration of function 'timespec64_to_timespec' [-Werror=implicit-function-declaration]
	../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first use in this function)
	../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use in this function)
	../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first use in this function)
	../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete type
	../include/linux/ktime.h:81:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete type
	../include/linux/ktime.h:87:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete type
	../include/linux/ktime.h:93:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
	../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
	../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplete type
	../include/linux/ktime.h:248:3: error: implicit declaration of function 'ns_to_timespec' [-Werror=implicit-function-declaration]
	../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplete type
	../include/linux/ktime.h:267:3: error: implicit declaration of function 'ns_to_timespec64' [-Werror=implicit-function-declaration]
	../include/linux/timekeeping.h:25:31: error: return type is an incomplete type
	../include/linux/timekeeping.h:27:9: error: variable 'now' has initializer but incomplete type
	../include/linux/timekeeping.h:27:9: error: invalid use of undefined type 'struct timespec64'
	../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't known
	../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
	../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
	../include/linux/timekeeping.h:79:31: error: return type is an incomplete type
	../include/linux/timekeeping.h:81:2: error: invalid use of undefined type 'struct timespec64'
	../include/linux/timekeeping.h:242:2: error: dereferencing pointer to incomplete type
	../include/linux/timekeeping.h:247:2: error: dereferencing pointer to incomplete type
	../include/linux/timekeeping.h:252:2: error: dereferencing pointer to incomplete type
	../include/linux/jump_label.h:187:2: error: implicit declaration of function 'atomic_inc' [-Werror=implicit-function-declaration]
	../include/linux/jump_label.h:193:2: error: implicit declaration of function 'atomic_dec' [-Werror=implicit-function-declaration]
	../include/linux/time64.h:45:31: error: conflicting types for 'timespec64_to_timespec'
	../include/linux/time64.h:50:33: error: conflicting types for 'timespec_to_timespec64'
	../include/linux/time.h:215:24: error: conflicting types for 'ns_to_timespec'

Warnings:
	../include/linux/jiffies.h:257:10: warning: "NSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:61:21: warning: "NSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:293:11: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:303:12: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:303:35: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:366:7: warning: "USEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:412:57: warning: 'struct timespec64' declared inside parameter list
	../include/linux/jiffies.h:412:57: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/jiffies.h:414:14: warning: 'struct timespec64' declared inside parameter list
	../include/linux/jiffies.h:417:20: warning: unused variable 'ts' [-Wunused-variable]
	../include/linux/jiffies.h:425:20: warning: unused variable 'ts' [-Wunused-variable]
	../include/linux/jiffies.h:431:54: warning: 'struct timeval' declared inside parameter list
	../include/linux/jiffies.h:433:18: warning: 'struct timeval' declared inside parameter list
	../include/linux/ktime.h:87:50: warning: 'struct timespec64' declared inside parameter list
	../include/linux/ktime.h:93:47: warning: 'struct timeval' declared inside parameter list
	../include/linux/ktime.h:264:21: warning: 'struct timespec64' declared inside parameter list
	../include/linux/timekeeping.h:12:36: warning: 'struct timeval' declared inside parameter list
	../include/linux/timekeeping.h:13:43: warning: 'struct timespec64' declared inside parameter list
	../include/linux/timekeeping.h:15:24: warning: 'struct timezone' declared inside parameter list
	../include/linux/timekeeping.h:29:2: warning: 'return' with a value, in function returning void
	../include/linux/timekeeping.h:27:20: warning: unused variable 'now' [-Wunused-variable]
	../include/linux/timekeeping.h:51:27: warning: passing argument 1 of 'do_settimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:56:28: warning: passing argument 1 of '__getnstimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:61:19: warning: passing argument 1 of 'getnstimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:66:17: warning: passing argument 1 of 'ktime_get_ts64' from incompatible pointer type
	../include/linux/timekeeping.h:71:19: warning: passing argument 1 of 'getnstimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:76:20: warning: passing argument 1 of 'getrawmonotonic64' from incompatible pointer type
	../include/linux/timekeeping.h:81:2: warning: 'return' with a value, in function returning void
	../include/linux/timekeeping.h:86:23: warning: passing argument 1 of 'getboottime64' from incompatible pointer type

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 52 errors, 34 warnings, 0 section mismatches

Errors:
	../include/linux/wait.h:40:2: error: unknown type name 'spinlock_t'
	../include/linux/wait.h:1217:2: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
	../include/linux/wait.h:76:32: error: storage size of '__key' isn't known
	../include/linux/jiffies.h:61:39: error: division by zero in #if
	../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/jiffies.h:303:33: error: division by zero in #if
	../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (first use in this function)
	../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (first use in this function)
	../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer but incomplete type
	../include/linux/jiffies.h:417:9: error: implicit declaration of function 'timespec_to_timespec64' [-Werror=implicit-function-declaration]
	../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomplete type
	../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
	../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
	../include/linux/jiffies.h:428:2: error: dereferencing pointer to incomplete type
	../include/linux/jiffies.h:428:2: error: implicit declaration of function 'timespec64_to_timespec' [-Werror=implicit-function-declaration]
	../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first use in this function)
	../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use in this function)
	../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first use in this function)
	../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete type
	../include/linux/ktime.h:81:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete type
	../include/linux/ktime.h:87:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete type
	../include/linux/ktime.h:93:23: error: function declaration isn't a prototype [-Werror=strict-prototypes]
	../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
	../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
	../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
	../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplete type
	../include/linux/ktime.h:248:3: error: implicit declaration of function 'ns_to_timespec' [-Werror=implicit-function-declaration]
	../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplete type
	../include/linux/ktime.h:267:3: error: implicit declaration of function 'ns_to_timespec64' [-Werror=implicit-function-declaration]
	../include/linux/timekeeping.h:25:31: error: return type is an incomplete type
	../include/linux/timekeeping.h:27:9: error: variable 'now' has initializer but incomplete type
	../include/linux/timekeeping.h:27:9: error: invalid use of undefined type 'struct timespec64'
	../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't known
	../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
	../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
	../include/linux/timekeeping.h:79:31: error: return type is an incomplete type
	../include/linux/timekeeping.h:81:2: error: invalid use of undefined type 'struct timespec64'
	../include/linux/timekeeping.h:242:2: error: dereferencing pointer to incomplete type
	../include/linux/timekeeping.h:247:2: error: dereferencing pointer to incomplete type
	../include/linux/timekeeping.h:252:2: error: dereferencing pointer to incomplete type
	../include/linux/rcupdate.h:490:2: error: implicit declaration of function 'lock_acquire' [-Werror=implicit-function-declaration]
	../include/linux/rcupdate.h:495:2: error: implicit declaration of function 'lock_release' [-Werror=implicit-function-declaration]
	../include/linux/rcupdate.h:572:2: error: implicit declaration of function 'lock_is_held' [-Werror=implicit-function-declaration]
	../include/linux/rcupdate.h:572:2: error: implicit declaration of function 'lockdep_rcu_suspicious' [-Werror=implicit-function-declaration]
	../include/linux/time64.h:45:31: error: conflicting types for 'timespec64_to_timespec'
	../include/linux/time64.h:50:33: error: conflicting types for 'timespec_to_timespec64'
	../include/linux/time.h:215:24: error: conflicting types for 'ns_to_timespec'

Warnings:
	../include/linux/wait.h:72:82: warning: 'struct lock_class_key' declared inside parameter list
	../include/linux/wait.h:72:82: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/wait.h:76:32: warning: unused variable '__key' [-Wunused-variable]
	../include/linux/jiffies.h:257:10: warning: "NSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:61:21: warning: "NSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:293:11: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:303:12: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:303:35: warning: "MSEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:366:7: warning: "USEC_PER_SEC" is not defined [-Wundef]
	../include/linux/jiffies.h:412:57: warning: 'struct timespec64' declared inside parameter list
	../include/linux/jiffies.h:414:14: warning: 'struct timespec64' declared inside parameter list
	../include/linux/jiffies.h:417:20: warning: unused variable 'ts' [-Wunused-variable]
	../include/linux/jiffies.h:425:20: warning: unused variable 'ts' [-Wunused-variable]
	../include/linux/jiffies.h:431:54: warning: 'struct timeval' declared inside parameter list
	../include/linux/jiffies.h:433:18: warning: 'struct timeval' declared inside parameter list
	../include/linux/ktime.h:87:50: warning: 'struct timespec64' declared inside parameter list
	../include/linux/ktime.h:93:47: warning: 'struct timeval' declared inside parameter list
	../include/linux/ktime.h:264:21: warning: 'struct timespec64' declared inside parameter list
	../include/linux/timekeeping.h:12:36: warning: 'struct timeval' declared inside parameter list
	../include/linux/timekeeping.h:13:43: warning: 'struct timespec64' declared inside parameter list
	../include/linux/timekeeping.h:15:24: warning: 'struct timezone' declared inside parameter list
	../include/linux/timekeeping.h:29:2: warning: 'return' with a value, in function returning void
	../include/linux/timekeeping.h:27:20: warning: unused variable 'now' [-Wunused-variable]
	../include/linux/timekeeping.h:51:27: warning: passing argument 1 of 'do_settimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:56:28: warning: passing argument 1 of '__getnstimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:61:19: warning: passing argument 1 of 'getnstimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:66:17: warning: passing argument 1 of 'ktime_get_ts64' from incompatible pointer type
	../include/linux/timekeeping.h:71:19: warning: passing argument 1 of 'getnstimeofday64' from incompatible pointer type
	../include/linux/timekeeping.h:76:20: warning: passing argument 1 of 'getrawmonotonic64' from incompatible pointer type
	../include/linux/timekeeping.h:81:2: warning: 'return' with a value, in function returning void
	../include/linux/timekeeping.h:86:23: warning: passing argument 1 of 'getboottime64' from incompatible pointer type
	../include/linux/lockdep.h:333:13: warning: conflicting types for 'lock_acquire'
	../include/linux/lockdep.h:337:13: warning: conflicting types for 'lock_release'
	../include/linux/lockdep.h:545:6: warning: conflicting types for 'lockdep_rcu_suspicious'

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/mix.c:135:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/dvc.c:337:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../fs/overlayfs/super.c:939:19: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
