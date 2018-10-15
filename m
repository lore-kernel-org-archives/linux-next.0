From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 15
Date: Mon, 15 Oct 2018 12:39:14 -0700
Message-ID: <20181015193914.GA9881@roeck-us.net>
References: <20181015192546.15faf3a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181015192546.15faf3a1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 15, 2018 at 07:25:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181012:
> 
> My qemu boots of a powerpc pseries_le_defconfig kernel failed today.
> 

Bisect log:

# bad: [774ea0551a2966c8fc29a6f675c3e28c5c6fa586] Add linux-next specific files for 20181012
# good: [0238df646e6224016a45505d2c111a24669ebe21] Linux 4.19-rc7
git bisect start 'HEAD' 'v4.19-rc7'
# good: [dfbf78faefa3c26d94208398e62bf25ea798e7f2] Merge remote-tracking branch 'spi-nor/spi-nor/next'
git bisect good dfbf78faefa3c26d94208398e62bf25ea798e7f2
# good: [3f296bb430327676912966c56d2f078f74e6b4ab] Merge remote-tracking branch 'tip/auto-latest'
git bisect good 3f296bb430327676912966c56d2f078f74e6b4ab
# good: [056ff0c45d1780f7bac1b54bd4160647efc500ad] Merge remote-tracking branch 'staging/staging-next'
git bisect good 056ff0c45d1780f7bac1b54bd4160647efc500ad
# good: [d7946b50c21a7d88af6c8e88d976ba3dfca651cc] Merge remote-tracking branch 'pinctrl/for-next'
git bisect good d7946b50c21a7d88af6c8e88d976ba3dfca651cc
# good: [72b5ca3121d5352fbb8fe3e1abaa86748205c0cb] Merge remote-tracking branch 'xarray/xarray'
git bisect good 72b5ca3121d5352fbb8fe3e1abaa86748205c0cb
# good: [e3895cf23a25da6dea2c8e986d4f6c24fafe5448] hugetlb: introduce generic version of prepare_hugepage_range
git bisect good e3895cf23a25da6dea2c8e986d4f6c24fafe5448
# good: [627f8833ac26e66d4b50676a0251499474bb4ee4] reiserfs: propagate errors from fill_with_dentries() properly
git bisect good 627f8833ac26e66d4b50676a0251499474bb4ee4
# good: [e38910adf47ba1d0b5a5a573cc26bde1ec533147] memblock: replace alloc_bootmem_pages_node with memblock_alloc_node
git bisect good e38910adf47ba1d0b5a5a573cc26bde1ec533147
# bad: [f89bdd2c52666d9da4bf4ef3a97a7188586ba0fb] dma-direct: fix up for the removal of linux/bootmem.h
git bisect bad f89bdd2c52666d9da4bf4ef3a97a7188586ba0fb
# good: [3108d998dfc36eb7f6b7f2917fc561258f742094] mm: nobootmem: remove bootmem allocation APIs
git bisect good 3108d998dfc36eb7f6b7f2917fc561258f742094
# good: [1f94dacb1d0ed0d1068b89ad867a198d3eca7bf2] memblock: rename __free_pages_bootmem to memblock_free_pages
git bisect good 1f94dacb1d0ed0d1068b89ad867a198d3eca7bf2
# good: [c3954ade0c1b499ae587f3edb813876216212836] memblock: replace BOOTMEM_ALLOC_* with MEMBLOCK variants
git bisect good c3954ade0c1b499ae587f3edb813876216212836
# bad: [cde1c7f7e92aef241f1c1a09a4d1f1f06fd565b6] mm: remove include/linux/bootmem.h
git bisect bad cde1c7f7e92aef241f1c1a09a4d1f1f06fd565b6
# first bad commit: [cde1c7f7e92aef241f1c1a09a4d1f1f06fd565b6] mm: remove include/linux/bootmem.h

Reverting this patch together with its fix-up "powerpc: fix up for removal of
linux/bootmem.h" fixes the problem. This also fixes the traceback seen with all
other ppc64 images.

Guenter
