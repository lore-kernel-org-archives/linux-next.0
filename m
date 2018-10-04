From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 4
Date: Thu, 4 Oct 2018 06:46:44 -0700
Message-ID: <20181004134644.GA9130@roeck-us.net>
References: <20181004183449.36bcc93b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181004183449.36bcc93b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 04, 2018 at 06:34:49PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181003:
> 
> The bpf-next tree still had its build failure so I used the version
> from next-20181002.
> 
> The kvm-arm tree gained conflicts against the arm64 tree.
> 
> The tty tree gained a build failure so I used the version from
> next-20181003.
> 
> The slave-dma tree gained a build failure so I used the version from
> next-20181003.
> 
> The userns tree gained a conflict against the y2038 tree.
> 
> Non-merge commits (relative to Linus' tree): 8120
>  7864 files changed, 365604 insertions(+), 168933 deletions(-)
> 

Time for a status report.

Build results:
	total: 135 pass: 121 fail: 14
Failed builds: 
	arm:allmodconfig 
	i386:allyesconfig 
	i386:allmodconfig 
	m68k:defconfig 
	m68k:allmodconfig 
	m68k:sun3_defconfig 
	mips:allmodconfig 
	parisc:allmodconfig 
	powerpc:ppc6xx_defconfig 
	s390:defconfig 
	s390:allmodconfig 
	s390:allnoconfig 
	sparc32:allmodconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 318 pass: 249 fail: 69
Failed tests: 
	m68k:q800:m68040:mac_defconfig:initrd 
	m68k:q800:m68040:mac_defconfig:rootfs 
	mips:malta_defconfig:smp:usb-xhci:rootfs 
	mips:malta_defconfig:smp:usb-uas-xhci:rootfs 
	mips:malta_defconfig:smp:scsi[53C810]:rootfs 
	mips:malta_defconfig:smp:scsi[53C895A]:rootfs 
	mips:malta_defconfig:smp:scsi[DC395]:rootfs 
	mips:malta_defconfig:smp:scsi[AM53C974]:rootfs 
	mips:malta_defconfig:smp:scsi[MEGASAS]:rootfs 
	mips:malta_defconfig:smp:scsi[MEGASAS2]:rootfs 
	mips:malta_defconfig:smp:scsi[FUSION]:rootfs 
	mips64:malta_defconfig:smp:usb-xhci:rootfs 
	mips64:malta_defconfig:smp:usb-uas-xhci:rootfs 
	mips64:malta_defconfig:smp:scsi[53C810]:rootfs 
	mips64:malta_defconfig:smp:scsi[DC395]:rootfs 
	mips64:malta_defconfig:smp:scsi[AM53C974]:rootfs 
	mips64:malta_defconfig:smp:scsi[MEGASAS]:rootfs 
	mips64:malta_defconfig:smp:scsi[MEGASAS2]:rootfs 
	mips64:malta_defconfig:smp:scsi[FUSION]:rootfs 
	mipsel:24Kf:malta_defconfig:smp:usb-xhci:rootfs 
	mipsel:24Kc:malta_defconfig:smp:usb-uas-xhci:rootfs 
	mipsel:34Kf:malta_defconfig:smp:scsi[53C810]:rootfs 
	mipsel:74Kf:malta_defconfig:smp:scsi[53C895A]:rootfs 
	mipsel:M14Kc:malta_defconfig:smp:scsi[DC395]:rootfs 
	mipsel:24Kf:malta_defconfig:smp:scsi[AM53C974]:rootfs 
	mipsel:24Kf:malta_defconfig:smp:scsi[MEGASAS]:rootfs 
	mipsel:24Kf:malta_defconfig:smp:scsi[MEGASAS2]:rootfs 
	mipsel:24Kf:malta_defconfig:smp:scsi[FUSION]:rootfs 
	mipsel64:64r6el_defconfig:boston:rootfs 
	parisc:defconfig:smp:nvme:rootfs 
	parisc:defconfig:smp:scsi:rootfs 
	parisc:defconfig:smp:scsi[53C895A]:rootfs 
	parisc:defconfig:smp:scsi[DC395]:rootfs 
	parisc:defconfig:smp:scsi[AM53C974]:rootfs 
	parisc:defconfig:nosmp:usb-xhci:rootfs 
	parisc:defconfig:nosmp:usb-uas-xhci:rootfs 
	parisc:defconfig:nosmp:nvme:rootfs 
	s390:defconfig:initrd 
	s390:defconfig:virtio-blk-ccw:rootfs 
	s390:defconfig:scsi[virtio-ccw]:rootfs 
	sh:rts7751r2dplus_defconfig:nvme:rootfs 
	sh:rts7751r2dplus_defconfig:usb-xhci:rootfs 
	sh:rts7751r2dplus_defconfig:usb-uas-xhci:rootfs 
	sh:rts7751r2dplus_defconfig:scsi[53C810]:rootfs 
	sh:rts7751r2dplus_defconfig:scsi[53C895A]:rootfs 
	sh:rts7751r2dplus_defconfig:scsi[FUSION]:rootfs 
	i386:q35:Broadwell:defconfig:smp:ata:rootfs 
	i386:q35:IvyBridge:defconfig:smp2:efi32:nvme:rootfs 
	i386:q35:Conroe:defconfig:smp4:scsi[DC395]:rootfs 
	i386:q35:Nehalem:defconfig:smp6:scsi[AM53C974]:rootfs 
	i386:q35:Westmere-IBRS:defconfig:smp:efi32:scsi[53C810]:rootfs 
	i386:q35:Skylake-Server:defconfig:smp2:scsi[53C895A]:rootfs 
	i386:pc:EPYC:defconfig:smp:efi32:scsi[MEGASAS]:rootfs 
	i386:q35:EPYC-IBPB:defconfig:smp:scsi[MEGASAS2]:rootfs 
	i386:q35:Opteron_G5:defconfig:smp:efi32:scsi[FUSION]:rootfs 
	i386:q35:Opteron_G4:defconfig:nosmp:efi32:ata:rootfs 
	i386:q35:n270:defconfig:nosmp:ata:rootfs 
	i386:q35:pentium3:defconfig:pae:nosmp:nvme:rootfs 
	x86_64:q35:Broadwell-noTSX:defconfig:smp:mem256:ata:rootfs 
	x86_64:q35:IvyBridge:defconfig:smp2:efi:mem512:nvme:rootfs 
	x86_64:q35:Conroe:defconfig:smp4:efi32:mem256:scsi[DC395]:rootfs 
	x86_64:q35:Nehalem:defconfig:smp:mem512:scsi[AM53C974]:rootfs 
	x86_64:q35:Westmere-IBRS:defconfig:smp2:efi:mem1G:scsi[53C810]:rootfs 
	x86_64:q35:Skylake-Server:defconfig:smp4:efi32:mem2G:scsi[53C895A]:rootfs
	x86_64:pc:EPYC:defconfig:smp:mem4G:scsi[FUSION]:rootfs 
	x86_64:q35:EPYC-IBPB:defconfig:smp2:efi:mem8G:scsi[MEGASAS]:rootfs 
	x86_64:q35:Opteron_G5:defconfig:smp4:efi32:mem256:scsi[MEGASAS2]:rootfs
	x86_64:q35:Opteron_G4:defconfig:nosmp:efi:mem512:ata:rootfs 
	x86_64:q35:Haswell-noTSX-IBRS:defconfig:nosmp:efi32:mem2G:ata:rootfs

Details are available at https://kerneltests.org/builders.

Guenter
