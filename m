From: Guenter Roeck <private@roeck-us.net>
Subject: linux-next: Crash in arm_pmu_device_probe() due to 'drivers/perf:
 arm_pmu: make info messages more verbose'
Date: Thu, 17 Mar 2016 23:44:19 -0700
Message-ID: <56EBA3C3.10907@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

Hi,

I am seeing the attached crash when running a realview-pb-a8 image with realview_defconfig in qemu.
bisect wasn't successful, but a commit analysis identified commit 'drivers/perf: arm_pmu: make info
messages more verbose' as the culprit. Reverting this commit fixes the problem.

The code roughly looks as follows.

int arm_pmu_device_probe()
{
     ...
     if (node && ..) {
     } else {
     }

     if (ret) {
                 pr_info("%s: failed to probe PMU! Error %i\n",
                         node->full_name, ret);
                 goto out_free;
     }
     ....
out_free:
     pr_info("%s: failed to register PMU devices! Error %i\n",
                 node->full_name, ret);
     ....
}

Note that 'node' is dereferenced even though it was previously checked if it is NULL.
The configuration I am testing does not use devicetree.

Can you use dev_info() instead ?

Thanks,
Guenter

---
Crash log:

Unable to handle kernel NULL pointer dereference at virtual address 0000000c
pgd = c0004000
[0000000c] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.5.0-next-20160317 #1
Hardware name: ARM-RealView PB-A8
task: df427600 ti: df428000 task.ti: df428000
PC is at arm_pmu_device_probe+0x11c/0x6ec
LR is at smp_call_function_single+0xe8/0x164
pc : [<c03bc2d0>]    lr : [<c0180260>]    psr: a0000053
sp : df429e40  ip : df428000  fp : 00000000
r10: df4aa200  r9 : 00000090  r8 : c0500d5c
r7 : c05015c8  r6 : fffffffa  r5 : c08457f8  r4 : c080a5d8
r3 : 00000000  r2 : fffffffa  r1 : df429df8  r0 : c05e6214
Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 70004059  DAC: 00000051
Process swapper/0 (pid: 1, stack limit = 0xdf428210)
Stack: (0xdf429e40 to 0xdf42a000)
9e40: 00000000 c05ce464 00000000 00000001 00000090 ffffffed c080a5e8 fffffdfb
9e60: c0806a1c c0806a1c 00000090 00000000 00000000 c02f95b4 c02f9564 c080a5e8
9e80: c0844630 c0844638 00000000 c02f7f04 00000000 c080a5e8 c0806a1c c080a61c
9ea0: 00000000 c0704714 00000000 c02f8040 00000000 c0806a1c c02f7f94 c02f6504
9ec0: df41785c df47bcb4 c0806a1c df4ec300 c081afc8 c02f74d0 c05b859c a0000053
9ee0: c0806a1c c0806a1c c080514c df58e780 c082b400 c02f885c c02f915c c080514c
9f00: c080514c c0101744 0000005f 00000000 00000000 00000000 00000000 c022645c
9f20: 00000000 c0810320 c061bb48 c0512b18 00000090 c0136c3c 00000000 c05db800
9f40: c061b008 00000000 00000006 00000006 c08102e8 dfffc1c0 c0733bb8 00000006
9f60: c0728830 c082b400 c07005a4 00000090 c072883c c0700d70 00000006 00000006
9f80: 00000000 c07005a4 00000000 c04ad914 00000000 00000000 00000000 00000000
9fa0: 00000000 c04ad91c 00000000 c0107830 00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[<c03bc2d0>] (arm_pmu_device_probe) from [<c02f95b4>] (platform_drv_probe+0x50/0xb0)
[<c02f95b4>] (platform_drv_probe) from [<c02f7f04>] (driver_probe_device+0x218/0x2a8)
[<c02f7f04>] (driver_probe_device) from [<c02f8040>] (__driver_attach+0xac/0xb0)
[<c02f8040>] (__driver_attach) from [<c02f6504>] (bus_for_each_dev+0x54/0x88)
[<c02f6504>] (bus_for_each_dev) from [<c02f74d0>] (bus_add_driver+0xe4/0x1f4)
[<c02f74d0>] (bus_add_driver) from [<c02f885c>] (driver_register+0x78/0xf4)
[<c02f885c>] (driver_register) from [<c0101744>] (do_one_initcall+0x80/0x1d8)
[<c0101744>] (do_one_initcall) from [<c0700d70>] (kernel_init_freeable+0x118/0x1ec)
[<c0700d70>] (kernel_init_freeable) from [<c04ad91c>] (kernel_init+0x8/0x110)
[<c04ad91c>] (kernel_init) from [<c0107830>] (ret_from_fork+0x14/0x24)
Code: e3e0600b e59d3008 e1a02006 e59f03cc (e593100c)
---[ end trace bfac761a54ea927f ]---
