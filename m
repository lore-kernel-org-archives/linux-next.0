From: Guenter Roeck <linux@roeck-us.net>
Subject: Commit 'sched/cpuacct: Split usage accounting into user_usage and
 sys_usage' causing crashes
Date: Sun, 10 Apr 2016 09:14:30 -0700
Message-ID: <20160410161430.GA32253@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57332 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754204AbcDJQO2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 10 Apr 2016 12:14:28 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: linux-kernel@vger.kernel.org, Zhao Lei <zhaolei@cn.fujitsu.com>, Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@kernel.org>, linux-next@vger.kernel.org

Hi,

your commit 'sched/cpuacct: Split usage accounting into user_usage and
sys_usage' in -next causes crashes with several of my qemu tests (mac99,
q3beige). Reverting the patch fixes the problem.

Details and complete logs are available at
	http://kerneltests.org/builders/qemu-ppc-next
The scripts are published at
	https://github.com/groeck/linux-build-test/tree/master/rootfs/ppc

Crash log and bisect log are attached.

Guenter

---
Crash log:

[ ... ]
ftrace: allocating 20986 entries in 62 pages
Unable to handle kernel paging request for data at address 0x00000084
Faulting instruction address: 0xc0067188
Oops: Kernel access of bad area, sig: 11 [#1]
PREEMPT PowerMac
Modules linked in:
CPU: 0 PID: 2 Comm: kthreadd Not tainted 4.6.0-rc2-next-20160408-yocto-standard #1
task: c78d0e00 ti: c78e8000 task.ti: c78e8000
NIP: c0067188 LR: c005c0d0 CTR: c005cf84
REGS: c78e9da0 TRAP: 0300   Not tainted
(4.6.0-rc2-next-20160408-yocto-standard)
MSR: 00001032 <ME,IR,DR,RI>  CR: 82040002  XER: 00000000
DAR: 00000084 DSISR: 40000000 
GPR00: c005c0d0 c78e9e50 c78d0e00 c78d0e00 00000000 00000000 000a25f0 0037ecae 
GPR08: ffffffff 00000000 00000000 0027ecae 22000008 00000000 c004decc 00000000 
GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
GPR24: 00000001 c78d0e00 c0918580 c78d0e30 00000000 c78d0e00 00000000 000a25f0 
NIP [c0067188] cpuacct_charge+0x2c/0x90
LR [c005c0d0] update_curr+0x110/0x250
Call Trace:
[c78e9e70] [c005c0d0] update_curr+0x110/0x250
[c78e9ea0] [c005d048] dequeue_task_fair+0xc4/0x27c
[c78e9ed0] [c06c67d4] __schedule+0x338/0x770
[c78e9f00] [c06c6c54] schedule+0x48/0xb8
[c78e9f10] [c004e070] kthreadd+0x1a4/0x1dc
[c78e9f40] [c0010540] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
4bffffd0 7c0802a6 90010004 60000000 9421ffe0 7c0802a6 bf810010 90010024 
81230cb4 7c7d1b78 7cdf3378 7cbe2b78 <83890084> 4800fbfd 813d047c 6b9c4000 
---[ end trace dc8fa200cb88537f ]---


---
bisect:

# bad: [6e5921edae25005c5c25a79bb2ff5335650c1b66] Add linux-next specific files
# for 20160408
# good: [9735a22799b9214d17d3c231fe377fc852f042e9] Linux 4.6-rc2
git bisect start 'HEAD' 'v4.6-rc2'
# good: [e61201ac50d9599aef64e8885d6bfa5b35d574d7] Merge remote-tracking branch
# 'mac80211-next/master'
git bisect good e61201ac50d9599aef64e8885d6bfa5b35d574d7
# bad: [5c4015574ec4d63b7d3a9efbd8b77f90bcac88be] Merge remote-tracking branch
# 'usb-chipidea-next/ci-for-usb-next'
git bisect bad 5c4015574ec4d63b7d3a9efbd8b77f90bcac88be
# good: [35fda07ad91c8d46253f6dd262800a747adcede9] Merge remote-tracking branch
# 'sound-asoc/for-next'
git bisect good 35fda07ad91c8d46253f6dd262800a747adcede9
# good: [a2089aa1dcd0a33b8eb67d8db0e07f859b986e04] Merge remote-tracking branch
# 'spi/for-next'
git bisect good a2089aa1dcd0a33b8eb67d8db0e07f859b986e04
# bad: [129f0d75057f9e78ad70e3e01f6c9edbc7de553c] Merge remote-tracking branch
# 'irqchip/irqchip/for-next'
git bisect bad 129f0d75057f9e78ad70e3e01f6c9edbc7de553c
# bad: [9338637e6e2256ac26ac75391dc1349fb492d7c6] Merge branch 'x86/asm'
git bisect bad 9338637e6e2256ac26ac75391dc1349fb492d7c6
# good: [66d219014a4ee47ad4ca2b9db5fe6547353e2a56] perf/x86/intel/pt: Move
# transaction start/stop to PMU start/stop callbacks
git bisect good 66d219014a4ee47ad4ca2b9db5fe6547353e2a56
# good: [5367d2a3279cd7aa40535efa526fe936ec24528d] Merge branch 'mm/urgent'
git bisect good 5367d2a3279cd7aa40535efa526fe936ec24528d
# bad: [2b8c41daba327c633228169e8bd8ec067ab443f8] sched/fair: Initiate a new
# task's util avg to a bounded value
git bisect bad 2b8c41daba327c633228169e8bd8ec067ab443f8
# bad: [d02c071183e1c01a76811c878c8a52322201f81f] sched/fair: Reset
# nr_balance_failed after active balancing
git bisect bad d02c071183e1c01a76811c878c8a52322201f81f
# bad: [d740037fac7052e49450f6fa1454f1144a103b55] sched/cpuacct: Split usage
# accounting into user_usage and sys_usage
git bisect bad d740037fac7052e49450f6fa1454f1144a103b55
# good: [5ca3726af7f66a8cc71ce4414cfeb86deb784491] sched/cpuacct: Show all
# possible CPUs in cpuacct output
git bisect good 5ca3726af7f66a8cc71ce4414cfeb86deb784491
# first bad commit: [d740037fac7052e49450f6fa1454f1144a103b55] sched/cpuacct:
# Split usage accounting into user_usage and sys_usage
