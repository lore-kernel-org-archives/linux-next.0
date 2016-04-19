From: Guenter Roeck <linux@roeck-us.net>
Subject: Runtime warning due to commit 'ARM: OMAP: Catch callers of revision
 information prior to it being populated' in -next
Date: Mon, 18 Apr 2016 21:37:00 -0700
Message-ID: <5715B5EC.2040000@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45390 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbcDSEg4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2016 00:36:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>

Hi,

commit 'ARM: OMAP: Catch callers of revision information prior to it
being populated' results in a runtime warning on various non-OMAP
architectures. I have seen it with the following qemu tests.

arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zc702
arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zc706
arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zed
arm:midway:multi_v7_defconfig:ecx-2000
arm:smdkc210:multi_v7_defconfig:exynos4210-smdkv310

It is also reported by kernelci.org in at least one boot test for imx6q-cm-fx6.

The warning is as follows.

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/id.c:49 omap_rev+0x3c/0x50
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc2-next-20160411 #1
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[<c030f970>] (unwind_backtrace) from [<c030b094>] (show_stack+0x10/0x14)
[<c030b094>] (show_stack) from [<c0585424>] (dump_stack+0x84/0xa4)
[<c0585424>] (dump_stack) from [<c0341774>] (__warn+0xd4/0x100)
[<c0341774>] (__warn) from [<c03417c0>] (warn_slowpath_null+0x20/0x28)
[<c03417c0>] (warn_slowpath_null) from [<c0324024>] (omap_rev+0x3c/0x50)
[<c0324024>] (omap_rev) from [<c1114a18>] (__omap4_sar_ram_init+0x8/0x88)
[<c1114a18>] (__omap4_sar_ram_init) from [<c0301e5c>] (do_one_initcall+0x3c/0x16c)
[<c0301e5c>] (do_one_initcall) from [<c1100ccc>] (kernel_init_freeable+0x70/0x1ec)
[<c1100ccc>] (kernel_init_freeable) from [<c0b495e4>] (kernel_init+0x8/0x110)
[<c0b495e4>] (kernel_init) from [<c0307f78>] (ret_from_fork+0x14/0x3c)
---[ end trace cb88537fdc8fa200 ]---

Please have a look.

Thanks,
Guenter
