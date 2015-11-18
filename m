From: Guenter Roeck <linux@roeck-us.net>
Subject: Runtime warning in next-20151117 due to 'leds: gpio: Remove work
 queue'
Date: Tue, 17 Nov 2015 18:37:48 -0800
Message-ID: <564BE47C.7050006@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55037 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746AbbKRChw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2015 21:37:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Hi,

I see the following runtime warning in next-20151117.

Building arm:beagle:multi_v7_defconfig:omap3-beagle:
...
[    1.590000] usb 1-2: new full-speed USB device number 3 using ohci-omap3
[    1.805000] input: QEMU QEMU USB Keyboard as /devices/platform/68000000.ocp/48064000.usbhshost/48064400.ohci/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input2
[    1.860000] hid-generic 0003:0627:0001.0002: input: USB HID v1.11 Keyboard [QEMU QEMU USB Keyboard] on usb-48064400.ohci-2/input0
[    3.565000] ------------[ cut here ]------------
[    3.565000] WARNING: CPU: 0 PID: 84 at drivers/gpio/gpiolib.c:1520 gpiod_set_value+0x54/0x5c()
[    3.565000] Modules linked in:
[    3.565000] CPU: 0 PID: 84 Comm: reboot Not tainted 4.4.0-rc1-next-20151117 #1
[    3.565000] Hardware name: Generic OMAP3-GP (Flattened Device Tree)
[    3.565000] [<c02187b0>] (unwind_backtrace) from [<c0213e8c>] (show_stack+0x10/0x14)
[    3.565000] [<c0213e8c>] (show_stack) from [<c0487708>] (dump_stack+0x78/0x94)
[    3.565000] [<c0487708>] (dump_stack) from [<c024ab5c>] (warn_slowpath_common+0x74/0xb0)
[    3.565000] [<c024ab5c>] (warn_slowpath_common) from [<c024abb4>] (warn_slowpath_null+0x1c/0x24)
[    3.565000] [<c024abb4>] (warn_slowpath_null) from [<c04e8744>] (gpiod_set_value+0x54/0x5c)
[    3.565000] [<c04e8744>] (gpiod_set_value) from [<c086c620>] (gpio_led_shutdown+0x30/0x40)
[    3.565000] [<c086c620>] (gpio_led_shutdown) from [<c0642554>] (platform_drv_shutdown+0x20/0x30)
[    3.565000] [<c0642554>] (platform_drv_shutdown) from [<c063f20c>] (device_shutdown+0x34/0x1a4)
[    3.565000] [<c063f20c>] (device_shutdown) from [<c0266248>] (kernel_restart+0xc/0x50)
[    3.570000] [<c0266248>] (kernel_restart) from [<c0266470>] (SyS_reboot+0x1a8/0x1d4)
[    3.570000] [<c0266470>] (SyS_reboot) from [<c0210c80>] (ret_fast_syscall+0x0/0x3c)
[    3.570000] ---[ end trace 4270a2eb0aad5079 ]---
[    3.570000] reboot: Restarting system

Bisect points to 'leds: gpio: Remove work queue'.

A complete log is available at
http://server.roeck-us.net:8010/builders/qemu-arm-next/builds/321/steps/qemubuildcommand/logs/stdio

Guenter


---
Bisect log:

# bad: [e483c0d725bc7f806f96231a0d5ac894c70fd3aa] Add linux-next specific files for 20151117
# good: [8005c49d9aea74d382f474ce11afbbc7d7130bec] Linux 4.4-rc1
git bisect start 'HEAD' 'v4.4-rc1'
# good: [96c7c9e458879b621ff8b6c54e188dc5403a2beb] Merge remote-tracking branch 'drm-misc/topic/drm-misc'
git bisect good 96c7c9e458879b621ff8b6c54e188dc5403a2beb
# good: [4811789503d16510a8a6610fb6c4097e1efa6312] staging: unisys: visorbus: visorbus_main.c: made checkpatch warning-f
ree
git bisect good 4811789503d16510a8a6610fb6c4097e1efa6312
# good: [552db025f5d9966a49b332eaf6eeb9e385db5bb1] Merge remote-tracking branch 'rcu/rcu/next'
git bisect good 552db025f5d9966a49b332eaf6eeb9e385db5bb1
# good: [35c3cb10f6e1e9739c8ae430a944670275195dfb] mm: increase SWAP_CLUSTER_MAX to batch TLB flushes
git bisect good 35c3cb10f6e1e9739c8ae430a944670275195dfb
# bad: [127d113cacba40b537916d397cd601789f0e7078] Merge remote-tracking branch 'staging/staging-next'
git bisect bad 127d113cacba40b537916d397cd601789f0e7078
# good: [8d66e9f1d85155b70791cc356fb1c11b347c5f95] leds: regulator: Remove work queue
git bisect good 8d66e9f1d85155b70791cc356fb1c11b347c5f95
# bad: [650c0ccc5fd643bbfe6a5efa4bacbf088efbbab7] Merge remote-tracking branch 'leds/for-next'
git bisect bad 650c0ccc5fd643bbfe6a5efa4bacbf088efbbab7
# good: [e637f7ab5e70d7705c8c5ee5c3a4a6a714a05556] Merge remote-tracking branch 'regmap/for-next'
git bisect good e637f7ab5e70d7705c8c5ee5c3a4a6a714a05556
# bad: [5c084d38025f04a1689cca0645d2481811194e7d] leds: lm355x: Remove work queue
git bisect bad 5c084d38025f04a1689cca0645d2481811194e7d
# bad: [c0e1a1fb0287f4f06a8c1b3b82736a191a14f974] leds: gpio: Remove work queue
git bisect bad c0e1a1fb0287f4f06a8c1b3b82736a191a14f974
# good: [90830ae406578803e45bff88596915d21e5d253a] leds: wm8350: Remove work queue
git bisect good 90830ae406578803e45bff88596915d21e5d253a
# first bad commit: [c0e1a1fb0287f4f06a8c1b3b82736a191a14f974] leds: gpio: Remove work queue
