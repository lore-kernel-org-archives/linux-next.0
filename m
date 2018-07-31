From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jul 31
Date: Tue, 31 Jul 2018 07:44:04 -0700
Message-ID: <20180731144404.GA27893@roeck-us.net>
References: <20180731182252.17831c15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180731182252.17831c15@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 31, 2018 at 06:22:52PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180730:
> 
> The block tree gained a build failure so I used the version from
> next-20180730.
> 
> The kvms390 tree gained a conflict against the kvm-arm tree.
> 
> The staging tree still had its build failure due to an interaction with
> the vfs tree for which I disabled CONFIG_EROFS_FS.
> 
> The mux tree gained a conflict against the battery tree.
> 
> The pinctrl tree gained a conflict the devicetree tree.
> 
> The kspp tree still had its build failure so I have added a supplied
> patch.
> 
> Non-merge commits (relative to Linus' tree): 9850
>  8993 files changed, 412971 insertions(+), 175848 deletions(-)
> 

In addition to some build failures, I see a large number of boot stalls
with this image. Various architectures are affected (i386, x86_64, mips,
some powerpc). Bisect is inconclusive due to a spurious build failure
in mm code. For those interested, logs are available at
http://kerneltests.org/builders/.

Guenter

---
Build results:
	total: 134 pass: 128 fail: 6
Failed builds: 
	alpha:allmodconfig 
	arm64:allmodconfig 
	parisc:allmodconfig 
	sparc32:allmodconfig 
	unicore32:defconfig 
	unicore32:allnoconfig 
Qemu test results:
	total: 182 pass: 147 fail: 35
Failed tests: 
	mips:malta_defconfig:nosmp 
	mips:malta_defconfig:smp 
	mips64:malta_defconfig:nosmp 
	mips64:malta_defconfig:smp 
	mipsel:24Kf:malta_defconfig:nosmp:initrd 
	mipsel:24Kf:malta_defconfig:smp:initrd 
	mipsel:24Kf:malta_defconfig:smp:rootfs 
	mipsel64:malta_defconfig:nosmp:rootfs 
	mipsel64:malta_defconfig:smp:initrd 
	mipsel64:malta_defconfig:smp:rootfs 
	mipsel64:fuloong2e_defconfig:fulong2e:rootfs 
	powerpc:mac99:pmac32_defconfig:devtmpfs:zilog:initrd 
	powerpc:mac99:pmac32_defconfig:devtmpfs:zilog:rootfs 
	i386:Broadwell:q35:defconfig:smp:rootfs 
	i386:Skylake-Client:q35:defconfig:smp:rootfs 
	i386:SandyBridge:q35:defconfig:smp:rootfs 
	i386:Haswell:pc:defconfig:smp:rootfs 
	i386:Nehalem:q35:defconfig:smp:rootfs 
	i386:phenom:pc:defconfig:smp:rootfs 
	i386:Opteron_G5:q35:defconfig:smp:initrd 
	i386:Westmere:q35:defconfig:smp:initrd 
	i386:core2duo:q35:defconfig:nosmp:rootfs 
	i386:Conroe:pc:defconfig:nosmp:rootfs 
	i386:Opteron_G1:pc:defconfig:nosmp:initrd 
	i386:n270:q35:defconfig:nosmp:rootfs 
	x86_64:q35:Broadwell-noTSX:defconfig:smp:sata:rootfs 
	x86_64:q35:IvyBridge:defconfig:smp:nvme:rootfs 
	x86_64:q35:Nehalem:defconfig:smp:nvme:rootfs 
	x86_64:pc:phenom:defconfig:smp:sata:rootfs 
	x86_64:q35:Opteron_G1:defconfig:smp:scsi[DC395]:rootfs
	x86_64:q35:Opteron_G5:defconfig:smp:initrd 
	x86_64:q35:EPYC-IBPB:defconfig:smp:usbdisk:rootfs 
	x86_64:q35:Skylake-Client:defconfig:smp:initrd 
	x86_64:q35:Skylake-Server:defconfig:smp:usbdisk:rootfs 
	x86_64:q35:Opteron_G3:defconfig:smp:initrd
