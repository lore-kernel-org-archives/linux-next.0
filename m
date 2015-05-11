From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for May 11 (build failures)
Date: Mon, 11 May 2015 06:31:08 -0700
Message-ID: <20150511133108.GA29164@roeck-us.net>
References: <20150511170946.6064c5e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150511170946.6064c5e9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 11, 2015 at 05:09:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150508:
> 
> The ext4 tree lost its build failure.
> 
> The vfs tree gained conflicts against the ext4 and f2fs trees.
> 
> The wireless-drivers-next tree gained conflicts against the net-next tree.
> 
> The drm tree gained a conflict againste Linus' tree.
> 
> The tty tree gained a build failure for which I added a merge fix patch.
> 
> The staging tree gained a conflict against the v4l-dvb tree.
> 
> The akpm tree lost 3 patches that turned up elsewhere.
> 
> Non-merge commits (relative to Linus' tree): 3360
>  3045 files changed, 142573 insertions(+), 64870 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Building arm:allmodconfig ... failed
Building i386:allyesconfig ... failed
Building i386:allmodconfig ... failed
--------------

ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!
ERROR: "__aeabi_ldivmod" [drivers/rtc/rtc-mt6397.ko] undefined!
make[1]: *** [__modpost] Error 1

This is the error message seen when building arm:allmodconfig;
i386 has the same problem but the message is a bit different.

Looks like there are some new 64-bit divide operations.

---

Building arm:keystone_defconfig ... failed
--------------
Error log:
arch/arm/mm/mmu.c: In function 'early_paging_init':
arch/arm/mm/mmu.c:1461:54: error: expected '(' before ')' token
  asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "ttbcr");

Introduced by 'ARM: re-implement physical address space switching'.

---

Guenter
