From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 23
Date: Fri, 23 Jan 2015 10:34:44 -0800
Message-ID: <20150123183444.GA337@roeck-us.net>
References: <20150123181029.35e688d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53603 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183AbbAWSeu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jan 2015 13:34:50 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YEj4E-002aKF-Rz
	for linux-next@vger.kernel.org; Fri, 23 Jan 2015 18:34:51 +0000
Content-Disposition: inline
In-Reply-To: <20150123181029.35e688d1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>

On Fri, Jan 23, 2015 at 06:10:29PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> There will be no linux-next release on Monday (next-20150126).
>=20
> Changes since 20150122:
>=20
> Added tree:	kvms390
> Removed tree:	documentation (at maintainers request)
>=20
> The vfs tree gained a conflict against Linus' tree.
>=20
> The akpm tree lost a patch that turned up elsewhere.
>=20
> Non-merge commits (relative to Linus' tree): 4500
>  4390 files changed, 174556 insertions(+), 78123 deletions(-)
>=20
> ---------------------------------------------------------------------=
-------
>=20
xtensa:allmodconfig fails with:

drivers/gpu/drm/drm_gem_cma_helper.c: In function =E2=80=98drm_gem_cma_=
create=E2=80=99:
drivers/gpu/drm/drm_gem_cma_helper.c:110:2: error: implicit declaration=
 of
function =E2=80=98dma_alloc_writecombine=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
drivers/gpu/drm/drm_gem_cma_helper.c:110:17: warning: assignment makes =
pointer
from integer without a cast [enabled by default]
drivers/gpu/drm/drm_gem_cma_helper.c: In function =E2=80=98drm_gem_cma_=
free_object=E2=80=99:
drivers/gpu/drm/drm_gem_cma_helper.c:193:3: error: implicit declaration=
 of
function =E2=80=98dma_free_writecombine=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
drivers/gpu/drm/drm_gem_cma_helper.c: In function =E2=80=98drm_gem_cma_=
mmap_obj=E2=80=99:
drivers/gpu/drm/drm_gem_cma_helper.c:330:2: error: implicit declaration=
 of
function =E2=80=98dma_mmap_writecombine=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
cc1: some warnings being treated as errors
make[3]: *** [drivers/gpu/drm/drm_gem_cma_helper.o] Error 1

Ultimately caused by 'drm: add Atmel HLCDC Display Controller support',
which selects DRM_GEM_CMA_HELPER.
DRM_ATMEL_HLCDC seems to be missing some dependencies, or possibly
DRM_GEM_CMA_HELPER (and/or every driver selecting it) needs to depend
on HAVE_DMA_ATTRS.

Ultimately this may result in allmodconfig/allyesconfig build failures
on all architectures which don't define HAVE_DMA_ATTRS.

Guenter
