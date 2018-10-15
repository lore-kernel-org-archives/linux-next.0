From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 15
Date: Mon, 15 Oct 2018 11:26:37 -0700
Message-ID: <20181015182637.GA16445@roeck-us.net>
References: <20181015192546.15faf3a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181015192546.15faf3a1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 15, 2018 at 07:25:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181012:
> 
> My qemu boots of a powerpc pseries_le_defconfig kernel failed today.
> 

Same here. Interestingly, this only affects little endian pseries
boots; big endian works fine. I'll try to bisect later.

ALl ppc qemu tests (including big endian pseries) also generate a warning.

WARNING: CPU: 0 PID: 0 at mm/memblock.c:1301 .memblock_alloc_range_nid+0x20/0x68
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 4.19.0-rc7-next-20181015 #1
NIP:  c000000000f99198 LR: c000000000f99490 CTR: c000000000bb8364
REGS: c000000001217a78 TRAP: 0700   Not tainted  (4.19.0-rc7-next-20181015)
MSR:  0000000080021000 <CE,ME>  CR: 24000422  XER: 20000000
IRQMASK: 1 
GPR00: c000000000f99490 c000000001217d00 c00000000121a500 00000000000000c0 
GPR04: 0000000000000000 0000000000000000 0000000000000000 ffffffffffffffff 
GPR08: 0000000000000000 00000000000000c0 0000000000000018 00000000000000b7 
GPR12: 0000000000000040 c000000000fe7840 0000000000000000 0000000000000000 
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR28: c000000000000304 c000000001262088 00000000000000c0 c000000000fea500 
NIP [c000000000f99198] .memblock_alloc_range_nid+0x20/0x68
LR [c000000000f99490] .memblock_alloc_base+0x18/0x48
Call Trace:
[c000000001217d00] [c000000002a00000] 0xc000000002a00000 (unreliable)
[c000000001217d80] [c000000000f99490] .memblock_alloc_base+0x18/0x48
[c000000001217df0] [c000000000f7a274] .allocate_paca_ptrs+0x3c/0x74
[c000000001217e70] [c000000000f78bf0] .early_init_devtree+0x288/0x320
[c000000001217f10] [c000000000f79b6c] .early_setup+0x80/0x130
[c000000001217f90] [c000000000000528] start_here_multiplatform+0x68/0x80


sparc images crash, starting with next-20181009. Bisect with
next-201810112 points to the merge of devicetree/for-next, though
devicetree/for-next itself does not have the problem (bisect log
attached below). The crash is in devicetree code.

Crash logs:
https://kerneltests.org/builders/qemu-sparc64-next/builds/981/steps/qemubuildcommand_1/logs/stdio
https://kerneltests.org/builders/qemu-sparc-next/builds/975/steps/qemubuildcommand_1/logs/stdio

Guenter

---
# bad: [774ea0551a2966c8fc29a6f675c3e28c5c6fa586] Add linux-next specific files for 20181012
# good: [0238df646e6224016a45505d2c111a24669ebe21] Linux 4.19-rc7
git bisect start 'HEAD' 'v4.19-rc7'
# good: [dfbf78faefa3c26d94208398e62bf25ea798e7f2] Merge remote-tracking branch 'spi-nor/spi-nor/next'
git bisect good dfbf78faefa3c26d94208398e62bf25ea798e7f2
# bad: [3f296bb430327676912966c56d2f078f74e6b4ab] Merge remote-tracking branch 'tip/auto-latest'
git bisect bad 3f296bb430327676912966c56d2f078f74e6b4ab
# good: [efad9cbc89fbef3c4b3905e1c01a8191eae4c772] Merge remote-tracking branch 'sound/for-next'
git bisect good efad9cbc89fbef3c4b3905e1c01a8191eae4c772
# good: [7d12a265b24001fbff1ff260c2f6bd802224a7c0] Merge remote-tracking branch 'iommu/next'
git bisect good 7d12a265b24001fbff1ff260c2f6bd802224a7c0
# good: [4fc72c0ef3c1e792caf06d25ef68c7c871730e31] Merge branch 'ras/core'
git bisect good 4fc72c0ef3c1e792caf06d25ef68c7c871730e31
# good: [d74865bd3996c7a6f3e8ce6e626c1fe474e39494] Merge branch 'x86/mm'
git bisect good d74865bd3996c7a6f3e8ce6e626c1fe474e39494
# bad: [1b1ab6a98adab8a0436024b369305a978e365a13] Merge remote-tracking branch 'mailbox/mailbox-for-next'
git bisect bad 1b1ab6a98adab8a0436024b369305a978e365a13
# good: [389d0a8a7af8ff8bb6301382333c7e8f748d7cd6] Merge branch 'dt/cpu-type-rework' into dt/next
git bisect good 389d0a8a7af8ff8bb6301382333c7e8f748d7cd6
# good: [4355151de47c2b4bc72c026ee743bd9ed7f71ba3] Merge branch 'all-dtbs' into dt/next
git bisect good 4355151de47c2b4bc72c026ee743bd9ed7f71ba3
# good: [60d744213fd9433b10b23afafb694a44c8e96cb8] Merge remote-tracking branch 'vfio/next'
git bisect good 60d744213fd9433b10b23afafb694a44c8e96cb8
# good: [9f0a0a381c5db56e7922dbeea6831f27db58372f] mailbox: mediatek: Add check for possible failure of kzalloc
git bisect good 9f0a0a381c5db56e7922dbeea6831f27db58372f
# good: [157b4129ded8ba756ef17c058192e734889673e4] dt-bindings: arm: fsl: Move DCFG and SCFG bindings to their own docs
git bisect good 157b4129ded8ba756ef17c058192e734889673e4
# bad: [bed61948ea6c57bc73fb3ded9421c1bdd8cbe4d9] Merge remote-tracking branch 'devicetree/for-next'
git bisect bad bed61948ea6c57bc73fb3ded9421c1bdd8cbe4d9
# good: [d81cc4a8e47219fbe60d49446f04ed3e9c1657d9] dt-bindings: arm: zte: Move sysctrl bindings to their own doc
git bisect good d81cc4a8e47219fbe60d49446f04ed3e9c1657d9
# first bad commit: [bed61948ea6c57bc73fb3ded9421c1bdd8cbe4d9] Merge remote-tracking branch 'devicetree/for-next'
