From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 10
Date: Wed, 10 Oct 2018 06:38:01 -0700
Message-ID: <20181010133801.GA5304@roeck-us.net>
References: <20181010164627.36ba566b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181010164627.36ba566b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 10, 2018 at 04:46:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181009:
> 
> The ext4 tree lost its build failure.
> 
> The kvm-ppc tree gained a conflict against the kvm-arm tree.
> 
> Non-merge commits (relative to Linus' tree): 9423
>  8942 files changed, 420582 insertions(+), 194157 deletions(-)
> 
> ----------------------------------------------------------------------------

Another day, another (different) set of failures.

Build results:
	total: 135 pass: 122 fail: 13
Failed builds: 
	alpha:allmodconfig 
	arm64:allmodconfig 
	m68k:defconfig 
	m68k:allmodconfig 
	mips:allmodconfig 
	parisc:allmodconfig 
	powerpc:allmodconfig 
	powerpc:ppc6xx_defconfig 
	riscv:defconfig 
	s390:allmodconfig 
	s390:allnoconfig 
	sparc64:allmodconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 318 pass: 280 fail: 38
Failed tests: 
	riscv:virt:defconfig:initrd 
	riscv:virt:defconfig:virtio-blk:rootfs 
	sparc32:SPARCClassic:nosmp:sparc32_defconfig 
	sparc32:SPARCbook:nosmp:sparc32_defconfig 
	sparc32:SS-4:nosmp:sparc32_defconfig 
	sparc32:SS-5:nosmp:sparc32_defconfig 
	sparc32:SS-10:nosmp:sparc32_defconfig 
	sparc32:SS-20:nosmp:sparc32_defconfig 
	sparc32:SS-600MP:nosmp:sparc32_defconfig 
	sparc32:LX:nosmp:sparc32_defconfig 
	sparc32:Voyager:nosmp:sparc32_defconfig 
	sparc32:SPARCClassic:smp:sparc32_defconfig 
	sparc32:SPARCbook:smp:sparc32_defconfig 
	sparc32:SS-4:smp:sparc32_defconfig 
	sparc32:SS-5:smp:sparc32_defconfig 
	sparc32:SS-10:smp:sparc32_defconfig 
	sparc32:SS-20:smp:sparc32_defconfig 
	sparc32:SS-600MP:smp:sparc32_defconfig 
	sparc32:LX:smp:sparc32_defconfig 
	sparc32:Voyager:smp:sparc32_defconfig 
	sparc64:sun4u:smp:initrd 
	sparc64:sun4u:smp:ata:rootfs 
	sparc64:sun4u:smp:mmc:rootfs 
	sparc64:sun4u:smp:nvme:rootfs 
	sparc64:sun4u:smp:scsi[DC395]:rootfs 
	sparc64:sun4u:smp:scsi[MEGASAS]:rootfs 
	sparc64:sun4u:smp:scsi[AM53C974]:rootfs 
	sparc64:sun4u:smp:usb-xhci:rootfs 
	sparc64:sun4u:smp:usb-uas-xhci:rootfs 
	sparc64:sun4u:smp:virtio-pci:rootfs 
	sparc64:sun4v:smp:ata:rootfs 
	sparc64:sun4v:smp:nvme:rootfs 
	sparc64:sun4u:nosmp:ata:rootfs 
	sparc64:sun4v:nosmp:ata:rootfs 
	i386:pc:Penryn:defconfig:pae:smp:initrd 
	i386:pc:Westmere:defconfig:pae:smp:efi32:usb:rootfs 
	i386:q35:pentium3:defconfig:pae:nosmp:nvme:rootfs 
	i386:q35:coreduo:defconfig:pae:nosmp:efi32:mmc:rootfs

Details are available at https://kerneltests.org/builders/.

Guenter

---
Compile errors:

alpha, arm64, parisc, powerpc, s390, sparc64, xtensa:

drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c: In function 'cxgb4_thermal_get_trip_type':
drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c:48:11: error: 'struct adapter' has no member named 'ch_thermal'

mips:

net/sunrpc/auth_gss/gss_krb5_seal.c: In function 'gss_seq_send64_fetch_and_inc':
net/sunrpc/auth_gss/gss_krb5_seal.c:144:3: error: implicit declaration of function 'cmpxchg64'

riscv:

Building riscv:defconfig ... failed
--------------
Error log:
cc1: error: -march=c: ISA string must begin with rv32 or rv64
cc1: error: ABI requires -march=rv64

====
Crashes:

sparc32, sparc64:

(log is from sparc32)

Unable to handle kernel NULL pointer dereference
tsk->{mm,active_mm}->context = ffffffff
tsk->{mm,active_mm}->pgd = fc000000
swapper(0): Oops [#1]
CPU: 0 PID: 0 Comm: swapper Not tainted 4.19.0-rc7-next-20181009 #1
PSR: 41801fc2 PC: f03aee08 NPC: f03aee0c Y: 00000000    Not tainted
PC: <strrchr+0x1c/0x48>
%G: f04d2968 f03b23a4  00000000 00000000  00000001 00000066  f0480000 f0481b40
RPC: <device_node_string+0x150/0x4a8>
%L: f044c0a8 0000ffff  00000000 00000020  f0459000 f03afd8c  f0444928 f0481d08
%I: f0481d08 f0481d48  f04f5ba0 f0481ba8  f044e72c f0481b28  f0481b48 f03b3e58
Disabling lock debugging due to kernel taint
Caller[f03b3e58]: pointer+0x338/0x5f8
Caller[f03b4338]: vsnprintf+0x220/0x5d0
Caller[f03b4764]: snprintf+0x20/0x30
Caller[f04abddc]: build_path_component+0x1e8/0x214
Caller[f04bbeb8]: of_pdt_build_tree+0x54/0x138
Caller[f04bc020]: of_pdt_build_devicetree+0x84/0x98
Caller[f04abb40]: prom_build_devicetree+0x10/0x30
Caller[f04ad61c]: paging_init+0xc/0x24
Caller[f04ab570]: setup_arch+0x45c/0x494
Caller[f04a7b40]: start_kernel+0x48/0x458
Caller[f04a743c]: continue_boot+0x324/0x334
Caller[00000000]:   (null)

x86:

[    6.632088] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: pgd_alloc+0x2be/0x2c0
[    6.632088] 
[    6.632712] CPU: 0 PID: 717 Comm: kworker/u2:3 Not tainted 4.19.0-rc7-next-20181009 #1
[    6.632712] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.11.2-0-gf9626ccb91-prebuilt.qemu-project.org 04/01/2014
[    6.632712] Call Trace:
[    6.632712]  dump_stack+0x60/0x96
[    6.632712]  panic+0x8f/0x1c6
[    6.632712]  __stack_chk_fail+0x10/0x10
[    6.632712]  ? pgd_alloc+0x2be/0x2c0
[    6.632712]  pgd_alloc+0x2be/0x2c0
[    6.632712]  mm_init.isra.53+0x20c/0x230
[    6.632712]  mm_alloc+0x2b/0x40
[    6.632712]  __do_execve_file+0x289/0x900
[    6.632712]  ? rcu_read_lock_sched_held+0x47/0x90
[    6.632712]  do_execve+0x16/0x20
[    6.632712]  call_usermodehelper_exec_async+0x127/0x140
[    6.632712]  ? umh_complete+0x40/0x40
[    6.632712]  ret_from_fork+0x2e/0x38
[    6.632712] Kernel Offset: 0x7000000 from 0xc1000000 (relocation range: 0xc0000000-0xd07dffff)
