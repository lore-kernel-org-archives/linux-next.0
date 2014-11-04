From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 4
Date: Tue, 4 Nov 2014 12:57:34 -0800
Message-ID: <20141104205734.GA13088@roeck-us.net>
References: <20141104173624.67dd3286@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60463 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502AbaKDU5q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Nov 2014 15:57:46 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XllAe-004K0N-VJ
	for linux-next@vger.kernel.org; Tue, 04 Nov 2014 20:57:45 +0000
Content-Disposition: inline
In-Reply-To: <20141104173624.67dd3286@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 04, 2014 at 05:36:24PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141103:
> 
> The mfd tree gained a build failure for which I reverted a commit.
> 
> The scsi tree lost its build failure, but gained another so I used the
> version from next-20141031.
> 
> Non-merge commits (relative to Linus' tree): 3170
>  2579 files changed, 83652 insertions(+), 106096 deletions(-)
> 

Build results:
	total: 133 pass: 113 fail: 20
Failed builds:
	arm:omap2plus_defconfig
	arm:axm55xx_defconfig
	arm64:defconfig
	avr32:defconfig
	i386:allmodconfig
	m68k:allmodconfig
	microblaze:mmu_defconfig
	microblaze:nommu_defconfig
	mips:allmodconfig
	mips:nlm_xlp_defconfig
	powerpc:allmodconfig (binutils 2.23)
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	powerpc:allmodconfig (binutils 2.24)
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	s390:defconfig
	sparc64:allmodconfig
	tile:tilegx_defconfig
	xtensa:allmodconfig

Qemu test results:
	total: 30 pass: 28 fail: 2
Failed tests:
	arm64:arm64_smp_defconfig
	arm64:arm64_nosmp_defconfig

Most of the failures are due to missing declarations of 'audit_file'.

Also:

drivers/video/backlight/backlight.c:556:26: error: redefinition of
'of_find_backlight_by_node'
include/linux/backlight.h:164:1: note: previous definition of
'of_find_backlight_by_node' was here

There are also several tracebacks in the powerpc test.

WARNING: at kernel/workqueue.c:1360
Modules linked in:
CPU: 0 PID: 32 Comm: kadbprobe Not tainted
3.18.0-rc3-next-20141104-yocto-standard #1
task: c7a0a9a0 ti: c7ade000 task.ti: c7ade000
NIP: c0044e38 LR: c0044f00 CTR: c04ad3ac
REGS: c7adfae0 TRAP: 0700   Not tainted
(3.18.0-rc3-next-20141104-yocto-standard)
MSR: 00021032 <ME,IR,DR,RI>  CR: 82008082  XER: 00000000

GPR00: c0044f00 c7adfb90 c7a0a9a0 00000001 00000000 c0999940 00000000 c0900000 
GPR08: 00000000 00000001 00000002 00000000 82008082 00000000 c004b99c c7ab66c0 
GPR16: 00000000 00000000 00000000 00000003 00000000 c7ad035c 00000001 c08e7984 
GPR24: c08e6f44 00000000 c08f68ac c7ade000 c0999944 c781cc00 c0aa9500 c0999940 
NIP [c0044e38] __queue_work+0xf8/0x3e8
LR [c0044f00] __queue_work+0x1c0/0x3e8
Call Trace:
[c7adfb90] [c0044f00] __queue_work+0x1c0/0x3e8 (unreliable)
[c7adfbc0] [c0045190] queue_work_on+0x68/0x88
[c7adfbd0] [c050ed90] led_trigger_event+0x4c/0xa8
[c7adfbf0] [c0431c38] kbd_ledstate_trigger_activate+0x7c/0xa4
[c7adfc00] [c050ef48] led_trigger_set+0x15c/0x1dc
[c7adfc30] [c050f1f4] led_trigger_set_default+0x90/0xd4
[c7adfc50] [c050e9b8] led_classdev_register+0x108/0x12c
[c7adfc60] [c04ad650] input_led_connect+0xd4/0x250
[c7adfca0] [c04aa08c] input_register_device+0x42c/0x4b4
[c7adfcc0] [c045c9dc] adbhid_input_register+0x4e0/0x62c
[c7adfd00] [c045cbd0] adbhid_input_reregister+0xa8/0xac
[c7adfd20] [c045cd0c] adbhid_probe+0x138/0x4fc
[c7adfde0] [c045d590] adb_message_handler+0x30/0xec
[c7adfe00] [c004ca7c] notifier_call_chain+0x78/0xc0
[c7adfe20] [c004cfe8] __blocking_notifier_call_chain+0x5c/0x80
[c7adfe40] [c045ebe0] do_adb_reset_bus+0x11c/0x3c4
[c7adfee0] [c045eeb0] adb_probe_task+0x28/0x58
[c7adfef0] [c004ba64] kthread+0xc8/0xdc
[c7adff40] [c001065c] ret_from_kernel_thread+0x5c/0x64

Details at http://server.roeck-us.net:8010/builders.

Guenter
