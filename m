From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Dec 20
Date: Thu, 20 Dec 2018 10:35:17 -0800
Message-ID: <20181220183517.GA13028@roeck-us.net>
References: <20181220194245.05f9a749@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181220194245.05f9a749@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 20, 2018 at 07:42:45PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181219:
> 
> The rdma tree lost its build failure.
> 
> The net-next tree gained conflicts against the net tree and a build
> failure for which I applied a merge fix patch.
> 
> The tip tree gained a conflict against the kbuild tree.
> 
> The char-misc tree gained a conflict against the net-next tree.
> 
> The akpm-current tree gained a conflict against the asm-generic tree.
> 
> Non-merge commits (relative to Linus' tree): 10141
>  10302 files changed, 483215 insertions(+), 268840 deletions(-)
> 

I won't even try a detailed analysis. Those interested may check
https://kerneltests.org/builders/.

Guenter

---
Build results:
	total: 158 pass: 140 fail: 18
Failed builds: 
	alpha:allmodconfig 
	arm:allmodconfig 
	csky:defconfig 
	csky:allnoconfig 
	csky:tinyconfig 
	ia64:defconfig 
	ia64:allnoconfig 
	ia64:tinyconfig 
	mips:allmodconfig 
	mips:cavium_octeon_defconfig 
	nds32:allmodconfig 
	parisc:defconfig 
	parisc:allnoconfig 
	parisc:tinyconfig 
	parisc:allmodconfig 
	parisc:generic-32bit_defconfig 
	sparc64:allmodconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 328 pass: 239 fail: 89
Failed tests: 
	arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9:rootfs 
	arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1:rootfs 
	arm:vexpress-a15-a7:multi_v7_defconfig:vexpress-v2p-ca15_a7:rootfs 
	arm:beagle:multi_v7_defconfig:omap3-beagle:rootfs 
	arm:beaglexm:multi_v7_defconfig:omap3-beagle-xm:rootfs 
	arm:overo:multi_v7_defconfig:omap3-overo-tobi:rootfs 
	arm:midway:multi_v7_defconfig:ecx-2000:initrd 
	arm:sabrelite:multi_v7_defconfig:imx6dl-sabrelite:initrd 
	arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zc702:rootfs 
	arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zc706:rootfs 
	arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zed:rootfs 
	arm:cubieboard:multi_v7_defconfig:sun4i-a10-cubieboard:initrd 
	arm:raspi2:multi_v7_defconfig:bcm2836-rpi-2-b:rootfs 
	arm:virt:multi_v7_defconfig:rootfs 
	arm:smdkc210:exynos_defconfig:exynos4210-smdkv310:initrd 
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
	parisc:defconfig:smp:initrd 
	parisc:defconfig:smp:mmc:rootfs 
	parisc:defconfig:smp:nvme:rootfs 
	parisc:defconfig:smp:sata-cmd646:rootfs 
	parisc:defconfig:smp:scsi:rootfs 
	parisc:defconfig:smp:scsi[53C895A]:rootfs 
	parisc:defconfig:smp:scsi[DC395]:rootfs 
	parisc:defconfig:smp:scsi[AM53C974]:rootfs 
	parisc:defconfig:nosmp:usb-ohci:rootfs 
	parisc:defconfig:nosmp:usb-ehci:rootfs 
	parisc:defconfig:nosmp:usb-xhci:rootfs 
	parisc:defconfig:nosmp:usb-uas-ehci:rootfs 
	parisc:defconfig:nosmp:usb-uas-xhci:rootfs 
	parisc:defconfig:nosmp:initrd 
	parisc:defconfig:nosmp:mmc:rootfs 
	parisc:defconfig:nosmp:nvme:rootfs 
	ppc:mpc8544ds:mpc85xx_defconfig:initrd 
	ppc:mpc8544ds:mpc85xx_defconfig:scsi[53C895A]:rootfs 
	ppc:mpc8544ds:mpc85xx_defconfig:sata-sii3112:rootfs 
	ppc:mpc8544ds:mpc85xx_defconfig:mmc:rootfs 
	ppc:mpc8544ds:mpc85xx_smp_defconfig:initrd 
	ppc:mpc8544ds:mpc85xx_smp_defconfig:scsi[DC395]:rootfs 
	ppc:mpc8544ds:mpc85xx_smp_defconfig:scsi[53C895A]:rootfs 
	ppc:mpc8544ds:mpc85xx_smp_defconfig:sata-sii3112:rootfs 
	ppc64:mpc8544ds:ppc64_e5500_defconfig:nosmp:initrd 
	ppc64:mpc8544ds:ppc64_e5500_defconfig:smp:initrd 
	ppc64:ppce500:corenet64_smp_defconfig:e5500:initrd 
	ppc64:ppce500:corenet64_smp_defconfig:e5500:nvme:rootfs 
	ppc64:ppce500:corenet64_smp_defconfig:e5500:mmc:rootfs 
	ppc64:ppce500:corenet64_smp_defconfig:e5500:scsi[53C895A]:rootfs
	ppc64:ppce500:corenet64_smp_defconfig:e5500:sata-sii3112:rootfs 
	ppc64:powernv:powernv_defconfig:initrd 
	riscv:virt:defconfig:initrd 
	riscv:virt:defconfig:virtio-blk:rootfs 
	riscv:virt:defconfig:virtio:rootfs 
	riscv:virt:defconfig:virtio-pci:rootfs 
	riscv:virt:defconfig:mmc:rootfs 
	riscv:virt:defconfig:nvme:rootfs 
	riscv:virt:defconfig:usb-ehci:rootfs 
	riscv:virt:defconfig:usb-xhci:rootfs 
	riscv:virt:defconfig:usb-uas-ehci:rootfs 
	riscv:virt:defconfig:usb-uas-xhci:rootfs 
	riscv:virt:defconfig:scsi[53C810]:rootfs 
	riscv:virt:defconfig:scsi[53C895A]:rootfs 
	riscv:virt:defconfig:scsi[MEGASAS]:rootfs 
	riscv:virt:defconfig:scsi[MEGASAS2]:rootfs 
	riscv:virt:defconfig:scsi[FUSION]:rootfs 
	riscv:virt:defconfig:scsi[virtio]:rootfs 
	riscv:virt:defconfig:scsi[virtio-pci]:rootfs 
	i386:pc:Westmere:defconfig:pae:smp:efi32:usb:rootfs
