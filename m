From: Guenter Roeck <linux@roeck-us.net>
Subject: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Sun, 14 Feb 2016 08:50:10 -0800
Message-ID: <20160214165010.GA3189@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Uwe,

Your patch 'driver-core: platform: probe of-devices only using list of
compatibles' causes the following qemu tests to crash in -next.

arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1

Crash log:

VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -6
Please append a correct "root=" boot option; here are the available partitions:
1f00          131072 mtdblock0  (driver?)
1f01           32768 mtdblock1  (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

ie the mmc driver no longer instantiates. Reverting the patch fixes the problem.

Bisect log is attached.

Guenter

---
# bad: [64d9a3617b3b8bc0734ba97caeb433b7019c6187] Add linux-next specific files for 20160212
# good: [388f7b1d6e8ca06762e2454d28d6c3c55ad0fe95] Linux 4.5-rc3
git bisect start 'HEAD' 'v4.5-rc3'
# good: [597dc9d36e8bc04941b61b26ac7aa3f8a33aba53] Merge remote-tracking branch 'sound-asoc/for-next'
git bisect good 597dc9d36e8bc04941b61b26ac7aa3f8a33aba53
# bad: [91fe8ea815243ec595753ccf7e14126b6f87f2bf] Merge remote-tracking branch 'usb-chipidea-next/ci-for-usb-next'
git bisect bad 91fe8ea815243ec595753ccf7e14126b6f87f2bf
# good: [1d6796e67f265e835bcb1a19d27ba0433dbd75e4] Merge remote-tracking branch 'tip/auto-latest'
git bisect good 1d6796e67f265e835bcb1a19d27ba0433dbd75e4
# bad: [858163465b53ab87c3939cae9e6fd0ecbeb60bfa] Merge remote-tracking branch 'driver-core/driver-core-next'
git bisect bad 858163465b53ab87c3939cae9e6fd0ecbeb60bfa
# good: [5acd4c7ca23549bf4e480a92efb7d87d988be432] Merge remote-tracking branch 'kvm-arm/next'
git bisect good 5acd4c7ca23549bf4e480a92efb7d87d988be432
# good: [d28003ab55e09323bf1a026e804165c6d371ae6b] Merge remote-tracking branch 'drivers-x86/for-next'
git bisect good d28003ab55e09323bf1a026e804165c6d371ae6b
# good: [f28a8693f4b1eb8b4035167825f2bcd44bd95546] Merge remote-tracking branch 'hsi/for-next'
git bisect good f28a8693f4b1eb8b4035167825f2bcd44bd95546
# good: [d3a7387f8aae81ba0f3687518a9ad7a14bfb165d] Merge remote-tracking branch 'ipmi/for-next'
git bisect good d3a7387f8aae81ba0f3687518a9ad7a14bfb165d
# good: [75f3e8e47f381074801d0034874d20c638d9e3d9] firmware: introduce sysfs driver for QEMU's fw_cfg device
git bisect good 75f3e8e47f381074801d0034874d20c638d9e3d9
# good: [9e5b3d6f7f946a3fb4d83ac2ab6d2bfefcdafffb] drivers: dma-coherent: simplify dma_init_coherent_memory return value
git bisect good 9e5b3d6f7f946a3fb4d83ac2ab6d2bfefcdafffb
# good: [cf68d85529f7dccc24412887d46e364f4b422a5d] driver-core: platform: fix typo in documentation for multi-driver helper
git bisect good cf68d85529f7dccc24412887d46e364f4b422a5d
# bad: [67d02a1bbb334558e9380409a3cd426b36d4578b] driver-core: platform: probe of-devices only using list of compatibles
git bisect bad 67d02a1bbb334558e9380409a3cd426b36d4578b
# first bad commit: [67d02a1bbb334558e9380409a3cd426b36d4578b] driver-core: platform: probe of-devices only using list of compatibles
