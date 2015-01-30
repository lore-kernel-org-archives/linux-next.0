From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 30 (build failures)
Date: Fri, 30 Jan 2015 06:25:20 -0800
Message-ID: <20150130142520.GA6872@roeck-us.net>
References: <20150130180209.2bd86cc4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150130180209.2bd86cc4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <matthew.r.wilcox@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Oleksij Rempel <linux@rempel-privat.de>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 30, 2015 at 06:02:09PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20150129:
>=20
> The arm-soc gained conflicts against the arm-current and arm trees.
>=20
> The spi tree gained a build failure for which I reverted a commit.
>=20
> Non-merge commits (relative to Linus' tree): 6300
>  6348 files changed, 255117 insertions(+), 131620 deletions(-)
>=20
> ---------------------------------------------------------------------=
-------

Build failures below. I copied the culprits (including Linus ;-).

Guenter

=3D=3D=3D
Building arc:defconfig ... failed
Building arc:tb10x_defconfig ... failed
--------------
Error log:
arch/arc/mm/fault.c: In function 'do_page_fault':
arch/arc/mm/fault.c:164: error: 'VM_FAULT_SIGSEV' undeclared

Typo. Caused by 33692f27597f ("vm: add VM_FAULT_SIGSEGV handling suppor=
t"),
from mainline. I submitted a patch.

=3D=3D=3D
Building mips:allmodconfig ... failed
--------------
Error log:

fs/built-in.o: In function `dax_fault':
(.text+0x5e284): undefined reference to `copy_user_page'

Caused by 4927b7d77c001 ("dax,ext2: replace the XIP page fault handler =
with the
DAX page fault handler"). Looks like copy_user_page does not exist in m=
ips.

=3D=3D=3D
Building sparc64:allmodconfig ... failed
--------------
Error log:
drivers/built-in.o: In function `asm9260_timer_init':
asm9260_timer.c:(.init.text+0x60d4): undefined reference to `of_io_requ=
est_and_map'

Caused by e4940cd76934 ("ARM: clocksource: add asm9260_timer driver").
of_io_request_and_map does not exist for the sparc architecture.
Maybe that driver should depend on ARM  or at least on !SPARC ?

=3D=3D=3D
Building xtensa:allmodconfig ... failed
--------------
Error log:
drivers/gpu/drm/drm_gem_cma_helper.c: In function =E2=80=98drm_gem_cma_=
create=E2=80=99:
drivers/gpu/drm/drm_gem_cma_helper.c:110:2: error: implicit declaration=
 of function =E2=80=98dma_alloc_writecombine=E2=80=99
drivers/gpu/drm/drm_gem_cma_helper.c: In function =E2=80=98drm_gem_cma_=
free_object=E2=80=99:
drivers/gpu/drm/drm_gem_cma_helper.c:193:3: error: implicit declaration=
 of function =E2=80=98dma_free_writecombine=E2=80=99
drivers/gpu/drm/drm_gem_cma_helper.c: In function =E2=80=98drm_gem_cma_=
mmap_obj=E2=80=99:
drivers/gpu/drm/drm_gem_cma_helper.c:330:2: error: implicit declaration=
 of function =E2=80=98dma_mmap_writecombine=E2=80=99

Caused by 1a396789f65a2 ("drm: add Atmel HLCDC Display Controller suppo=
rt").
It selects DRM_KMS_CMA_HELPER which selects DRM_GEM_CMA_HELPER which ne=
eds
the missing dma functions. Those are not supported on xtensa (HAVE_DMA_=
ATTRS
is not set for xtensa). Maybe the controller should depend on HAVE_DMA_=
ATTRS.
