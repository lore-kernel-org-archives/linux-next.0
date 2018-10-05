From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 5
Date: Fri, 5 Oct 2018 06:48:54 -0700
Message-ID: <20181005134854.GA17709@roeck-us.net>
References: <20181005163943.3f8d4f32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181005163943.3f8d4f32@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 05, 2018 at 04:39:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181004:
> 
> I added a supplied patch to the dma-mapping tree to fix overnight boot
> problems.
> 
> I added a supplied patch to the nfs tree to fix an overnight build
> problem.
> 
> The nfsd tree gained a build failure due to an interaction with the nfs
> tree for which I applied a merge fix patch. And another build failure
> so I used the version from next-20181004.
> 
> The bpf-next tree lost its build failure.
> 
> The drm-msm tree gained a build failure, so I used the version from
> next-20181004.
> 
> The tty tree lost its build failure.
> 
> The slave-dma tree lost its build failure.
> 
> The akpm-current tree gained a conflict against the btrfs-kdave tree.
> 
> The akpm tree gained a build failure due to an interaction with the
> powerpc tree for which I added a merge fix patch.
> 
> Non-merge commits (relative to Linus' tree): 8415
>  8136 files changed, 377585 insertions(+), 173429 deletions(-)
> 

Build results:
	total: 135 pass: 129 fail: 6
Failed builds: 
	mips:allmodconfig 
	powerpc:ppc6xx_defconfig
	s390:defconfig 
	s390:allmodconfig 
	s390:allnoconfig 
	sparc32:allmodconfig 
Qemu test results:
	total: 318 pass: 315 fail: 3
Failed tests: 
	s390:defconfig:initrd 
	s390:defconfig:virtio-blk-ccw:rootfs 
	s390:defconfig:scsi[virtio-ccw]:rootfs

---
mips:allmodconfig, powerpc:ppc6xx_defconfig;

net/sunrpc/auth_gss/gss_krb5_seal.c: In function 'gss_seq_send64_fetch_and_inc':
net/sunrpc/auth_gss/gss_krb5_seal.c:144:3: error:
	implicit declaration of function 'cmpxchg64'

---
s390:

s390-linux-ld:./arch/s390/kernel/vmlinux.lds:41: syntax error

qemu tests also affected. Fixed with:

https://lore.kernel.org/patchwork/patch/993576/

---
sparc32:allmodconfig:

Various "relocation truncated to fit" errors. Also seen in mainline.
It is probably time to drop the build.

---

Guenter
