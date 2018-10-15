From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 15
Date: Mon, 15 Oct 2018 15:22:13 -0700
Message-ID: <20181015222213.GA31415@roeck-us.net>
References: <20181015192546.15faf3a1@canb.auug.org.au>
 <20181015193914.GA9881@roeck-us.net>
 <20181016073359.3fa7bb32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181016073359.3fa7bb32@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 16, 2018 at 07:33:59AM +1100, Stephen Rothwell wrote:
> Hi Guenter,
> 
> [Again, just cc'ing the PPC folks]
> 
> On Mon, 15 Oct 2018 12:39:14 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Oct 15, 2018 at 07:25:46PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20181012:
> > > 
> > > My qemu boots of a powerpc pseries_le_defconfig kernel failed today.
> > >   
> > 
> > Bisect log:
> > 

Trying again. Not very useful since some of the steps fail with compile errors.
The problem does seem to be related to the bootmem changes, though.

I might try again tonight if I find the time.

Guenter

# bad: [ca0591d03a2d373e0019ad357fbbee69c8272381] Add linux-next specific files for 20181015
# good: [0238df646e6224016a45505d2c111a24669ebe21] Linux 4.19-rc7
git bisect start 'HEAD' 'v4.19-rc7'
# good: [2fc8fb4c02a0f7b9d5e5b4de80cbcef7c808068b] Merge remote-tracking branch 'spi-nor/spi-nor/next'
git bisect good 2fc8fb4c02a0f7b9d5e5b4de80cbcef7c808068b
# good: [a54eefdf4d208f6904da9e836ff32d7dde0c9516] Merge remote-tracking branch 'tip/auto-latest'
git bisect good a54eefdf4d208f6904da9e836ff32d7dde0c9516
# good: [d71e0d25be750d02a3d04500aeb151bb94465811] Merge remote-tracking branch 'staging/staging-next'
git bisect good d71e0d25be750d02a3d04500aeb151bb94465811
# good: [7961c8ea9d81f927a78e30bb7c194310ed6b7c1d] Merge remote-tracking branch 'pinctrl/for-next'
git bisect good 7961c8ea9d81f927a78e30bb7c194310ed6b7c1d
# good: [c3d392e6aae57d54fdc683f7432c3e248602bebb] Merge remote-tracking branch 'xarray/xarray'
git bisect good c3d392e6aae57d54fdc683f7432c3e248602bebb
# good: [880c1034475c873963d6250eb95ebbbf5604a281] userfaultfd: selftest: cleanup help messages
git bisect good 880c1034475c873963d6250eb95ebbbf5604a281
# good: [9f1fa0ab60f7b09d335bbaf33db9116241059708] reiserfs: propagate errors from fill_with_dentries() properly
git bisect good 9f1fa0ab60f7b09d335bbaf33db9116241059708
# good: [596046ffd571f32fa3d3e7ffdf7861b71a258552] memblock: replace alloc_bootmem_low with memblock_alloc_low (2)
git bisect good 596046ffd571f32fa3d3e7ffdf7861b71a258552
# bad: [ef07e25e5bb02b420cb66004420cea3e0d65d107] dma-direct: fix up for the removal of linux/bootmem.h
git bisect bad ef07e25e5bb02b420cb66004420cea3e0d65d107
# good: [ddaa897c9ab76969a74d67a65b6616895f349644] memblock: replace alloc_bootmem with memblock_alloc
git bisect good ddaa897c9ab76969a74d67a65b6616895f349644
# good: [3b79243c2ef23d829a2f01f8c9526f17b80a7a32] memblock: rename free_all_bootmem to memblock_free_all
git bisect good 3b79243c2ef23d829a2f01f8c9526f17b80a7a32
# good: [d5fa9634892df2bc6bab6101f18df6ba5a2490c5] mm: remove nobootmem
git bisect good d5fa9634892df2bc6bab6101f18df6ba5a2490c5
# bad: [75fd637c22bc9bb5c959b7f93c2c5e5f0495992c] mm: remove include/linux/bootmem.h
git bisect bad 75fd637c22bc9bb5c959b7f93c2c5e5f0495992c
# good: [979961b3058df1a6d24ab423dd6fa6f20982f591] memblock: replace BOOTMEM_ALLOC_* with MEMBLOCK variants
git bisect good 979961b3058df1a6d24ab423dd6fa6f20982f591
# first bad commit: [75fd637c22bc9bb5c959b7f93c2c5e5f0495992c] mm: remove include/linux/bootmem.h
