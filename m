From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 19:26:57 +0100
Message-ID: <20150831192657.557e45cc@why.wild-wind.fr.eu.org>
References: <20150831195420.371e8849@canb.auug.org.au>
	<20150831141736.GA19616@roeck-us.net>
	<20150831163103.2e13b301@arm.com>
	<55E476FB.2040208@roeck-us.net>
	<20150831171807.27d78ff0@arm.com>
	<55E4838B.5000500@roeck-us.net>
	<20150831180922.4392875e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58014 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753718AbbHaSXK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 14:23:10 -0400
In-Reply-To: <20150831180922.4392875e@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>, Mark Brown <broonie@kernel.org>, Markus Pargmann <mpa@pengutronix.de>

On Mon, 31 Aug 2015 18:09:22 +0100
Marc Zyngier <marc.zyngier@arm.com> wrote:

Hi Guenter,

> On Mon, 31 Aug 2015 09:40:43 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > Hi Marc,
> > 
> > On 08/31/2015 09:18 AM, Marc Zyngier wrote:
> > > On Mon, 31 Aug 2015 08:47:07 -0700
> > > Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > >> Hi Marc,
> > >>
> > >> On 08/31/2015 08:31 AM, Marc Zyngier wrote:
> > >>> On Mon, 31 Aug 2015 07:17:36 -0700
> > >>> Guenter Roeck <linux@roeck-us.net> wrote:
> > >>>
> > >>> Hi Guenter,
> > >>>
> > >>>> Qemu test results:
> > >>>> 	total: 85 pass: 74 fail: 11
> > >>>> Failed tests:
> > >>>> 	arm:vexpress-a9:arm_vexpress_defconfig:vexpress-v2p-ca9
> > >>>> 	arm:vexpress-a15:arm_vexpress_defconfig:vexpress-v2p-ca15-tc1
> > >>>> 	arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
> > >>>> 	arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
> > >>>> 	arm:realview-pb-a8:arm_realview_pb_defconfig
> > >>>> 	arm:realview-eb:arm_realview_eb_defconfig
> > >>>> 	mips:fuloong2e_defconfig
> > >>>> 	xtensa:dc232b:lx60:xtensa_defconfig
> > >>>> 	xtensa:dc232b:kc705:xtensa_defconfig
> > >>>> 	xtensa:dc233c:ml605:generic_kc705_defconfig
> > >>>> 	xtensa:dc233c:kc705:generic_kc705_defconfi
> > >>>>
> > >>>> Notable new failures (since next-20150828) are the s390 build failures,
> > >>>> the arm64 build failure, and the arm qemu test failures.
> > >>>>
> > >>>
> > >>> [...]
> > >>>
> > >>>> The qemu arm tests all fail silently, meaning there is no console
> > >>>> output. Bisect points to 'irqchip/GIC: Convert to EOImode == 1'.
> > >>>> Bisect log attached.
> > >>>
> > >>> Could you give me a qemu command-line I can use to track this down?
> > >>> Real HW seems happy enough, from what I can see...
> > >>>
> > >>
> > >> That is what I was most concerned about :-(. Unfortunately, it
> > >> affects many of the most widely used arm qemu emulations, so it
> > >> would be very desirable to get this fixed, either in the kernel
> > >> or in qemu.
> > >>
> > >> See https://github.com/groeck/linux-build-test, specifically
> > >> https://github.com/groeck/linux-build-test/tree/master/rootfs/arm/.
> > >> run-qemu-arm.sh includes the various command lines and configurations.
> > >>
> > >> Note that some of the tests require a patched version of qemu.
> > >> The tests failing above should all work with the latest published
> > >> version of qemu (2.4), though.
> > >>
> > >> Please let me know if there is anything I can do to help tracking
> > >> this down.
> > >
> > > I give it a quick go with qemu 2.1.2 as installed on my laptop, and the
> > > results are interesting:
> > >
> > > - With -next as of today, qemu segfaults. Humpffff.
> > >
> > > - If I use my branch that contains the EOImode==1 patch, the system
> > >    boots normally.
> > >
> > > So there is an interaction between this patch and whatever is in -next
> > > at the moment, but that patch on its own is not what triggers the issue.
> > >
> > Looks like it.
> > 
> > I did a couple of tests.
> > - Revert 'irqchip/GIC: Don't deactivate interrupts forwarded to a guest'.
> >    Same problem.
> > - Revert both 'irqchip/GIC: Don't deactivate interrupts forwarded to a guest'
> >    and 'irqchip/GIC: Convert to EOImode == 1'.
> >    Problem is no longer seen.
> 
> This is getting even more weird. I've upgraded my qemu to 2.3 (the
> latest Debian seems to be carrying). I'm booting a A15-TC1 model with
> the following:
> 
> emu-system-arm -machine vexpress-a15 -cpu cortex-a15 -m 512M
> -kernel arch/arm/boot/zImage -append "console=ttyAMA0 earlyprintk"
> -serial stdio -dtb arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dtb -display
> none
> 
> The model dies with:
> 
> [...]
> NET: Registered protocol family 16
> DMA: preallocated 256 KiB pool for atomic coherent allocations
> Unable to handle kernel NULL pointer dereference at virtual address 00000030
> pgd = 80004000
> [00000030] *pgd=00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.2.0-next-20150831+ #18
> Hardware name: ARM-Versatile Express
> task: 9f458000 ti: 9f446000 task.ti: 9f446000
> PC is at __regmap_init+0x15c/0xb18
> LR is at 0x0
> pc : [<802c3e50>]    lr : [<00000000>]    psr: 40000153
> sp : 9f447d00  ip : 00000000  fp : 00000000
> r10: 00000000  r9 : 00000001  r8 : 9f49f280
> r7 : 00000000  r6 : 80697990  r5 : 80678034  r4 : 9f4ce400
> r3 : 00000000  r2 : 00000000  r1 : 0000a4f4  r0 : 9f4ce400
> Flags: nZcv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
> Control: 10c5387d  Table: 8000406a  DAC: 00000055
> Process swapper/0 (pid: 1, stack limit = 0x9f446210)
> Stack: (0x9f447d00 to 0x9f448000)
> 7d00: 806aa2b4 8059aa5c 9f4ce210 00000001 9f4ce210 00000000 9f4ce210 9f49a610
> 7d20: 9f49f280 88000b18 00000000 00000000 00000000 802cb6a0 00000000 00000000
> 7d40: 802663ec 00000001 00000000 00000000 9f49f210 fffffdfb 00000000 00000000
> 7d60: 9f49aa50 9f4ce210 9f49f250 fffffdfb 00000000 802664cc 9f4ce210 9f4ce200
> 7d80: 9f49f210 803a20bc 9f49be10 9f49bc30 9f4a0280 80597704 9f49be10 9f4ce210
> 7da0: 9f4ce210 806826d0 00000001 9f4ce210 9f4ce210 806826d0 fffffdfb 802b47f0
> 7dc0: 802b47ac 9f4ce210 806a805c 806826d0 00000001 802b2f80 00000000 9f447e08
> 7de0: 802b30e8 00000001 806a8038 802b1478 9f422970 9f49c0b8 9f4ce210 9f4ce210
> 7e00: 9f4ce244 802b2cb0 9f4ce210 00000001 9f4ce218 9f4ce218 9f4ce210 80677728
> 7e20: 00000000 802b23bc 9f4ce218 9f4ba000 9f4ce210 802b0784 00000000 00000001
> 7e40: 60000153 9f4ce200 9f4ce200 9f4ce210 00000000 9fbf02c4 00000000 9f4ba000
> 7e60: 00000000 80399190 00000000 9fbf0274 00000000 00000001 00000000 803992a8
> 7e80: 806a4e60 9f49f0c0 80631a84 00000000 000000a5 8064d83c 00000000 80397ca8
> 7ea0: 00000000 9f447ea8 00000002 9fbf0274 9fbf0174 00000000 00000000 9f4ba000
> 7ec0: 00000001 8064d83c 00000000 803995f4 00000001 000000a5 8064d83c 9fbf0174
> 7ee0: 806a4e60 9f49f0c0 80631a84 00000000 000000a5 80631b20 00000000 80666620
> 7f00: 80666620 80009770 8049a3ac 00000014 00000000 0000c000 cccccc00 801392ec
> 7f20: 00000000 8066924c 60000153 00000000 00000334 00000000 9fffce50 8003be10
> 7f40: 8056a05c 9fffce5b 00000002 00000002 80669234 00000000 8065b1c8 00000002
> 7f60: 8064d824 8068c000 8068c000 8064d83c 00000000 8061ae5c 00000002 00000002
> 7f80: 00000000 8061a598 00000000 80491d30 00000000 00000000 00000000 00000000
> 7fa0: 00000000 80491d38 00000000 8000f3e8 00000000 00000000 00000000 00000000
> 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [<802c3e50>] (__regmap_init) from [<802cb6a0>] (vexpress_syscfg_regmap_init+0x11c/0x1d0)
> [<802cb6a0>] (vexpress_syscfg_regmap_init) from [<802664cc>] (devm_regmap_init_vexpress_config+0x60/0xcc)
> [<802664cc>] (devm_regmap_init_vexpress_config) from [<803a20bc>] (vexpress_osc_probe+0x30/0xf4)
> [<803a20bc>] (vexpress_osc_probe) from [<802b47f0>] (platform_drv_probe+0x44/0xa4)
> [<802b47f0>] (platform_drv_probe) from [<802b2f80>] (driver_probe_device+0x24c/0x2f0)
> [<802b2f80>] (driver_probe_device) from [<802b1478>] (bus_for_each_drv+0x64/0x98)
> [<802b1478>] (bus_for_each_drv) from [<802b2cb0>] (__device_attach+0xa4/0x104)
> [<802b2cb0>] (__device_attach) from [<802b23bc>] (bus_probe_device+0x84/0x8c)
> [<802b23bc>] (bus_probe_device) from [<802b0784>] (device_add+0x3e4/0x56c)
> [<802b0784>] (device_add) from [<80399190>] (of_platform_device_create_pdata+0x84/0xb8)
> [<80399190>] (of_platform_device_create_pdata) from [<803992a8>] (of_platform_bus_create+0xd8/0x2f8)
> [<803992a8>] (of_platform_bus_create) from [<803995f4>] (of_platform_populate+0x5c/0xac)
> [<803995f4>] (of_platform_populate) from [<80631b20>] (vexpress_config_init+0x9c/0xc8)
> [<80631b20>] (vexpress_config_init) from [<80009770>] (do_one_initcall+0x8c/0x1d4)
> [<80009770>] (do_one_initcall) from [<8061ae5c>] (kernel_init_freeable+0x1d8/0x278)
> [<8061ae5c>] (kernel_init_freeable) from [<80491d38>] (kernel_init+0x8/0xe8)
> [<80491d38>] (kernel_init) from [<8000f3e8>] (ret_from_fork+0x14/0x2c)
> Code: e2933000 13a03001 e5c43132 e30a14f4 (e5973030) 
> ---[ end trace 5ab4f97e42f4e880 ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> And it dies the same way whether I have these GIC patches in or not.
> Talk about consistency...
> 
> > There are several other patches in drivers/irqchip/irq-gic.c since 4.2.
> > 
> > 4c2880b31c70 irqchip/gic: Ensure gic_cpu_if_up/down() programs correct GIC instance
> > 567e5a014848 irqchip/gic: Only allow the primary GIC to set the CPU map
> > 4b979e4c611c Merge branch 'linus' into irq/core
> > 0d3f2c92e004 irqchip/gic: Remove redundant gic_set_irqchip_flags
> > aec89ef72ba6 irqchip/gic: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
> > 5b29264c659c irqchip: Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc
> > 4d83fcf8d615 irqchip/gic: Consolidate chained IRQ handler install/remove
> > 41a83e06e2bb irqchip: Prepare for local stub header removal
> > 
> > Maybe there is an interaction between those and your patch ?
> >
> 
> I had a quick look, and there is nothing I can immediately spot.
>  
> > > I need to build a more recent version of qemu, but the above doesn't
> > > fill be with confidence...
> > >
> > My patched version of qemu 2.4 doesn't crash for me, it simply hangs.
> > Not that this is much better.
> 
> So this seems to be specific to qemu 2.4 then. Time to build the sucker.

[+Broonie, Markus]

I've now built qemu 2.4, and reverting these two patches doesn't fix a
single thing (the behaviour is the same as the one I described above).

Actually, the kernel dies because of this:

commit adaac459759db4a1fd35baddbe47bac700095496
Author: Markus Pargmann <mpa@pengutronix.de>
Date:   Sun Aug 30 09:33:53 2015 +0200

    regmap: Introduce max_raw_read/write for regmap_bulk_read/write
    
    There are some buses which have a limit on the maximum number of
    bytes that can be send/received. An example for this is
    I2C_FUNC_SMBUS_I2C_BLOCK which does not support any reads/writes of
    more than 32 bytes. The regmap_bulk operations should still be able
    to utilize the full 32 bytes in this case.
    
    Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
    Signed-off-by: Mark Brown <broonie@kernel.org>

which never considers bus to be NULL in __regmap_init. With the
following patch applied, I can boot to a prompt:

>From 031eae5a1b34f952ba3dcaecb4eb4ec9d3bda352 Mon Sep 17 00:00:00 2001
From: Marc Zyngier <marc.zyngier@arm.com>
Date: Mon, 31 Aug 2015 19:16:16 +0100
Subject: [PATCH] regmap: Fix max_raw_read/write handling when bus is NULL

Commit adaac459759d ("regmap: Introduce max_raw_read/write
for regmap_bulk_read/write") added new fields to regmap_bus
and started using them in __regmap_init, but failed to
consider the case where bus would be NULL, like in the
vexpress-syscgf case. The box (actually its qemu version)
ends up dying painfully.

Fix it by testing bus before doing anything else.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/base/regmap/regmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 650d3b1..0fdde9d 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -574,8 +574,8 @@ struct regmap *__regmap_init(struct device *dev,
 	map->use_single_read = config->use_single_rw || !bus || !bus->read;
 	map->use_single_write = config->use_single_rw || !bus || !bus->write;
 	map->can_multi_write = config->can_multi_write && bus && bus->write;
-	map->max_raw_read = bus->max_raw_read;
-	map->max_raw_write = bus->max_raw_write;
+	map->max_raw_read = bus ? bus->max_raw_read : 0;
+	map->max_raw_write = bus ? bus->max_raw_write : 0;
 	map->dev = dev;
 	map->bus = bus;
 	map->bus_context = bus_context;
-- 
2.1.4

I'd really like to understand why you observe failures with your
version of qemu, while I cannot reproduce them. What patches do you
have on top of qemu? Is your tree available somewhere?

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
