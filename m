From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 07:17:36 -0700
Message-ID: <20150831141736.GA19616@roeck-us.net>
References: <20150831195420.371e8849@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150831195420.371e8849@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 31, 2015 at 07:54:20PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150828:
> 
> I used the h8300 tree from next-20150828 since the current tree has been
> rebased onto linux-next :-(
> 
> The sound-asoc tree lost its build failure.
> 
> The trivial tree gained a conflict against the drm tree.
> 
> The tty tree still had its build failure for which I reverted part of
> a commit.
> 
> The gpio tree gained a build failure so I used the version form
> next-20150828.
> 
> Non-merge commits (relative to Linus' tree): 10761
>  9636 files changed, 583138 insertions(+), 252790 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Build results:
	total: 145 pass: 135 fail: 10
Failed builds:
	alpha:allmodconfig
	arm:rpc_defconfig
	arm64:allmodconfig
	mips:allmodconfig
	mips:nlm_xlp_defconfig
	s390:defconfig
	s390:allmodconfig
	xtensa:defconfig
	xtensa:allmodconfig
	xtensa:allnoconfig

Qemu test results:
	total: 85 pass: 74 fail: 11
Failed tests:
	arm:vexpress-a9:arm_vexpress_defconfig:vexpress-v2p-ca9
	arm:vexpress-a15:arm_vexpress_defconfig:vexpress-v2p-ca15-tc1
	arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
	arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
	arm:realview-pb-a8:arm_realview_pb_defconfig
	arm:realview-eb:arm_realview_eb_defconfig
	mips:fuloong2e_defconfig
	xtensa:dc232b:lx60:xtensa_defconfig
	xtensa:dc232b:kc705:xtensa_defconfig
	xtensa:dc233c:ml605:generic_kc705_defconfig
	xtensa:dc233c:kc705:generic_kc705_defconfi

Notable new failures (since next-20150828) are the s390 build failures,
the arm64 build failure, and the arm qemu test failures.

arm64:

drivers/built-in.o: In function `mtk_cpufreq_ready':
:(.text+0x27e124): undefined reference to `of_cpufreq_cooling_register'
drivers/built-in.o: In function `mtk_cpufreq_exit':
:(.text+0x27e31c): undefined reference to `cpufreq_cooling_unregister'

Most likely caused by 'cpufreq: mediatek: Add MT8173 cpufreq driver", but
I did not bisect.

s390:

kernel/built-in.o: In function `bpf_trace_printk':
bpf_trace.c:(.text+0x116a5c): undefined reference to `strncpy_from_unsafe'
kernel/built-in.o: In function `fetch_memory_string':
trace_kprobe.c:(.text+0x118ee0): undefined reference to `strncpy_from_unsafe'

Appears to be due to 'bpf: add support for %s specifier to bpf_trace_printk()'.
Not bisected.

The qemu arm tests all fail silently, meaning there is no console output.
Bisect points to 'irqchip/GIC: Convert to EOImode == 1'. Bisect log attached.

Guenter

---
qemu arm bisect log:

# bad: [4da7932545f1474564af3b2558b738c7a15ed853] Add linux-next specific files for 20150831
# good: [64291f7db5bd8150a74ad2036f1037e6a0428df2] Linux 4.2
git bisect start 'HEAD' 'v4.2'
# good: [0b82dd97c3ae2056d3b5b7db156923f77e3cb675] Merge remote-tracking branch 'drm/drm-next'
git bisect good 0b82dd97c3ae2056d3b5b7db156923f77e3cb675
# bad: [b7299a186f496145dfe87a59054b876fe1677309] Merge remote-tracking branch 'tty/tty-next'
git bisect bad b7299a186f496145dfe87a59054b876fe1677309
# good: [71247c5f3351adb3c69321f9f2ba3e16ccee589e] Merge remote-tracking branch 'mailbox/mailbox-for-next'
git bisect good 71247c5f3351adb3c69321f9f2ba3e16ccee589e
# bad: [99df9788ac9bc648e78b3b2a3c641e750e184c01] manual merge of sched/core
git bisect bad 99df9788ac9bc648e78b3b2a3c641e750e184c01
# bad: [b8ad55972c02c9ca6049d1bf7764e1650c1c8e56] Merge branch 'locking/core'
git bisect bad b8ad55972c02c9ca6049d1bf7764e1650c1c8e56
# good: [27baa4737cb762851e4c6f085e45f087d26bab2d] Merge branch 'core/types'
git bisect good 27baa4737cb762851e4c6f085e45f087d26bab2d
# good: [8505a81bb036253213b109baf4178ea6861e2888] genirq: Use the proper parameter name in kernel doc
git bisect good 8505a81bb036253213b109baf4178ea6861e2888
# good: [0b6a3da9617a08e13afc09cb7e148470ed0eb280] irqchip/GICv3: Convert to EOImode == 1
git bisect good 0b6a3da9617a08e13afc09cb7e148470ed0eb280
# good: [3bbfafb77a06327fa1bc9f19bc55b5c558475091] x86, tsc, locking/static_keys: Employ static_branch_likely()
git bisect good 3bbfafb77a06327fa1bc9f19bc55b5c558475091
# good: [f5468ffde13fc991bd4d6bdec507ffd5777865bd] locking/lockref: Remove homebrew cmpxchg64_relaxed() macro definition
git bisect good f5468ffde13fc991bd4d6bdec507ffd5777865bd
# good: [d420acd816c07c7be31bd19d09cbcb16e5572fa6] jump_label/x86: Work around asm build bug on older/backported GCCs
git bisect good d420acd816c07c7be31bd19d09cbcb16e5572fa6
# bad: [01f779f4862b53810ba4eb247f57bd1ad31d1c18] irqchip/GIC: Don't deactivate interrupts forwarded to a guest
git bisect bad 01f779f4862b53810ba4eb247f57bd1ad31d1c18
# bad: [0b996fd35957a30568cddbce05b917c1897966e0] irqchip/GIC: Convert to EOImode == 1
git bisect bad 0b996fd35957a30568cddbce05b917c1897966e0
# good: [530bf353e4eb06bcba5078390c949650cd26a7c7] irqchip/GICv3: Don't deactivate interrupts forwarded to a guest
git bisect good 530bf353e4eb06bcba5078390c949650cd26a7c7
# first bad commit: [0b996fd35957a30568cddbce05b917c1897966e0] irqchip/GIC: Convert to EOImode == 1
