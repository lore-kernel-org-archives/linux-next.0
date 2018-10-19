From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 19
Date: Fri, 19 Oct 2018 09:41:00 -0700
Message-ID: <20181019164100.GA5319@roeck-us.net>
References: <20181019181653.198552cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181019181653.198552cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 19, 2018 at 06:16:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> News: I will not be doing linux-next releases next week.  Unfortunately
> this will probably be the first week of the merge window. :-(
> 
> Changes since 20181018:
> 
> The net-next tree gained a conflict against the net tree and a build
> failure due to an interaction with the rdma tree for which I applied a
> merge fix patch.
> 
> The kvm tree gained a conflict against the tip tree.
> 
> Non-merge commits (relative to Linus' tree): 11382
>  10233 files changed, 562372 insertions(+), 243395 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Build results:
	total: 135 pass: 125 fail: 10
Failed builds: 
	arm:allmodconfig 
	i386:allyesconfig 
	i386:allmodconfig 
	mips:allmodconfig 
	parisc:allmodconfig 
	powerpc:ppc6xx_defconfig
	s390:allmodconfig 
	sh:dreamcast_defconfig 
	sparc64:allmodconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 318 pass: 318 fail: 0

---
arm:allmodconfig, i386:allmodconfig, i386:allyesconfig, parisc:allmodconfig

ERROR: "__aeabi_uldivmod" [drivers/scsi/myrs.ko] undefined!
(and similar)

mips:allmodconfig, powerpc:ppc6xx_defconfig:

net/sunrpc/auth_gss/gss_krb5_seal.c: In function 'gss_seq_send64_fetch_and_inc':
net/sunrpc/auth_gss/gss_krb5_seal.c:145:3: error: implicit declaration of function 'cmpxchg64'

s390:allmodconfig, sparc64:allmodconfig:

ERROR: "__node_distance" [drivers/nvme/host/nvme-core.ko] undefined!

sh:dreamcast_defconfig:

drivers/cdrom/gdrom.c: In function 'probe_gdrom':
drivers/cdrom/gdrom.c:797:3: error: 'rc' undeclared

xtensa:allmodconfig:

drivers/net/ethernet/amazon/ena/ena_com.h: In function ‘ena_com_get_next_bounce_buffer’:
build/drivers/net/ethernet/amazon/ena/ena_com.h:1104:2: error: implicit declaration of function ‘prefetchw’

Guenter
