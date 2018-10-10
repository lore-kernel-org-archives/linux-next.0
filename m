From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 9
Date: Tue, 9 Oct 2018 17:50:54 -0700
Message-ID: <20181010005054.GA22348@roeck-us.net>
References: <20181009190234.7ee02dc0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181009190234.7ee02dc0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 09, 2018 at 07:02:34PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181008:
> 
> The s390 tree gained a conflict against the compiler-attributes tree.
> 
> The ext4 tree gained a build failure for which I reverted a commit.
> 
> The nfsd tree lost its build failure.
> 
> The crypto tree lost its build failure.
> 
> The net-next tree gained a conflict against the net tree.
> 
> The drm-msm tree lost its build failure.
> 
> The tip tree gained a conflict against the s290 tree.
> 
> The irqchip tree lost its build failure.
> 
> The staging tree gained a conflict against the vfs tree.
> 
> The akpm tree gained conflicts against the s390 tree.
> 
> Non-merge commits (relative to Linus' tree): 9232
>  8813 files changed, 408912 insertions(+), 188393 deletions(-)
> 

Build results:
	total: 135 pass: 125 fail: 10
Failed builds: 
	arm:allmodconfig 
	arm64:defconfig 
	ia64:defconfig 
	ia64:allnoconfig 
	m68k:defconfig 
	m68k:allmodconfig 
	mips:allmodconfig 
	powerpc:ppc6xx_defconfig 
	riscv:defconfig 
	s390:allnoconfig 
Qemu test results:
	total: 318 pass: 287 fail: 31
Failed tests: 
	arm64:virt:defconfig:smp:mem512:initrd 
	arm64:virt:defconfig:smp2:mem512:usb-xhci:rootfs 
	arm64:virt:defconfig:smp4:mem512:usb-uas-xhci:rootfs 
	arm64:virt:defconfig:smp6:mem512:virtio:rootfs 
	arm64:virt:defconfig:smp8:mem512:virtio-pci:rootfs 
	arm64:virt:defconfig:smp:mem512:virtio-blk:rootfs 
	arm64:virt:defconfig:smp2:mem512:nvme:rootfs 
	arm64:virt:defconfig:smp4:mem512:mmc:rootfs 
	arm64:virt:defconfig:smp6:mem512:scsi[DC395]:rootfs 
	arm64:virt:defconfig:smp8:mem512:scsi[AM53C974]:rootfs 
	arm64:virt:defconfig:smp2:mem512:scsi[MEGASAS]:rootfs 
	arm64:virt:defconfig:smp4:mem512:scsi[MEGASAS2]:rootfs 
	arm64:virt:defconfig:smp6:mem512:scsi[53C810]:rootfs 
	arm64:virt:defconfig:smp8:mem512:scsi[53C895A]:rootfs 
	arm64:virt:defconfig:smp:mem512:scsi[FUSION]:rootfs 
	arm64:virt:defconfig:smp2:mem512:scsi[virtio]:rootfs 
	arm64:xlnx-zcu102:defconfig:smp:mem2G:initrd:xilinx/zynqmp-zcu102-rev1.0 
	arm64:xlnx-zcu102:defconfig:smp2:mem2G:sd1:rootfs:xilinx/zynqmp-zcu102-rev1.0 
	arm64:xlnx-zcu102:defconfig:smp4:mem2G:sata:rootfs:xilinx/zynqmp-zcu102-rev1.0 
	arm64:raspi3:defconfig:smp:mem1G:initrd:broadcom/bcm2837-rpi-3-b 
	arm64:raspi3:defconfig:smp4:mem1G:sd:rootfs:broadcom/bcm2837-rpi-3-b 
	arm64:virt:defconfig:nosmp:mem512:initrd 
	arm64:xlnx-zcu102:defconfig:nosmp:mem2G:initrd:xilinx/zynqmp-zcu102-rev1.0 
	arm64:xlnx-zcu102:defconfig:nosmp:mem2G:sd1:rootfs:xilinx/zynqmp-zcu102-rev1.0 
	riscv:virt:defconfig:initrd 
	riscv:virt:defconfig:virtio-blk:rootfs 
	i386:q35:Conroe:defconfig:smp4:scsi[DC395]:rootfs 
	i386:pc:Penryn:defconfig:pae:smp:initrd 
	i386:pc:Westmere:defconfig:pae:smp:efi32:usb:rootfs 
	i386:q35:pentium3:defconfig:pae:nosmp:nvme:rootfs 
	i386:q35:coreduo:defconfig:pae:nosmp:efi32:mmc:rootfs

Details are available at https://kerneltests.org/builders/.

Guenter
---

Build failures:

arm:

drivers/pci/pcie/aer_inject.c: In function 'aer_inject_ftrace_thunk':
drivers/pci/pcie/aer_inject.c:444:6: error: 'struct pt_regs' has no member named 'ip'

arm64, ia64:

drivers/acpi/numa.c:34:10: fatal error: asm/kaslr.h

m68k:

drivers/tty/amiserial.c:1076:3: error: 'retval' undeclared

mips, powerpc:

net/sunrpc/auth_gss/gss_krb5_seal.c:144:3: error:
	implicit declaration of function 'cmpxchg64'

riscv:

Building riscv:defconfig ... failed
--------------
Error log:
cc1: error: -march=c: ISA string must begin with rv32 or rv64
cc1: error: ABI requires -march=rv64

s390:

arch/s390/boot/mem_detect.c:122:12: error: 'EFAULT' undeclared 

Crash:

x86:

[    3.760333] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: pgd_alloc+0x2be/0x2c0
[    3.760333] 
[    3.761002] CPU: 0 PID: 717 Comm: kworker/u2:3 Not tainted 4.19.0-rc7-next-20181008 #1
[    3.761002] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.11.2-0-gf9626ccb91-prebuilt.qemu-project.org 04/01/2014
[    3.761002] Call Trace:
[    3.761002]  dump_stack+0x60/0x96
[    3.761002]  panic+0x8f/0x1c6
[    3.761002]  __stack_chk_fail+0x10/0x10
[    3.761002]  ? pgd_alloc+0x2be/0x2c0
[    3.761002]  pgd_alloc+0x2be/0x2c0
[    3.761002]  mm_init.isra.53+0x20c/0x230
[    3.761002]  mm_alloc+0x2b/0x40
[    3.761002]  __do_execve_file+0x289/0x900
[    3.761002]  ? rcu_read_lock_sched_held+0x47/0x90
[    3.761002]  ? azx_pcm_open+0x3b9/0x3c0
[    3.761002]  do_execve+0x16/0x20
[    3.761002]  call_usermodehelper_exec_async+0x127/0x140
[    3.761002]  ? umh_complete+0x40/0x40
[    3.761002]  ret_from_fork+0x2e/0x38
[    3.761002] Kernel Offset: 0xb800000 from 0xc1000000 (relocation range: 0xc0000000-0xd07dffff)
