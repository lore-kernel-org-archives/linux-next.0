From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 24 Jul 2017 12:09:55 +1000
Message-ID: <20170724120955.681f790e@canb.auug.org.au>
References: <20170724120605.1044d6b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48131 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752519AbdGXCJ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Jul 2017 22:09:57 -0400
In-Reply-To: <20170724120605.1044d6b2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Noralf =?UTF-8?B?VHLDuG5u?= =?UTF-8?B?ZXM=?= <noralf@tronnes.org>, Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi all,

On Mon, 24 Jul 2017 12:06:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   82abbea734d6 ("MAINTAINERS: fix alphabetical ordering")
>=20
> from Linus' tree and commit:
>=20
>   3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I did the resolution again after running Linus' script ...

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 55859cdde82a,9387e6aed3b8..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -4306,130 -4349,68 +4306,136 @@@ T:	git git://anongit.freedesktop.org/dr
  S:	Maintained
  F:	drivers/gpu/drm/bochs/
 =20
 -DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 +DRM DRIVER FOR INTEL I810 VIDEO CARDS
 +S:	Orphan / Obsolete
 +F:	drivers/gpu/drm/i810/
 +F:	include/uapi/drm/i810_drm.h
 +
 +DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
 +S:	Orphan / Obsolete
 +F:	drivers/gpu/drm/mga/
 +F:	include/uapi/drm/mga_drm.h
 +
 +DRM DRIVER FOR MGA G200 SERVER GRAPHICS CHIPS
  M:	Dave Airlie <airlied@redhat.com>
 -M:	Gerd Hoffmann <kraxel@redhat.com>
 -L:	virtualization@lists.linux-foundation.org
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
 -S:	Obsolete
 -W:	https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmf=
ul/
 -F:	drivers/gpu/drm/cirrus/
 +S:	Odd Fixes
 +F:	drivers/gpu/drm/mgag200/
 =20
 -RADEON and AMDGPU DRM DRIVERS
 -M:	Alex Deucher <alexander.deucher@amd.com>
 -M:	Christian K=C3=B6nig <christian.koenig@amd.com>
 -L:	amd-gfx@lists.freedesktop.org
 -T:	git git://people.freedesktop.org/~agd5f/linux
 -S:	Supported
 -F:	drivers/gpu/drm/radeon/
 -F:	include/uapi/drm/radeon_drm.h
 -F:	drivers/gpu/drm/amd/
 -F:	include/uapi/drm/amdgpu_drm.h
 +DRM DRIVER FOR MI0283QT
 +M:	Noralf Tr=C3=B8nnes <noralf@tronnes.org>
 +S:	Maintained
 +F:	drivers/gpu/drm/tinydrm/mi0283qt.c
 +F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
 =20
 -DRM PANEL DRIVERS
 -M:	Thierry Reding <thierry.reding@gmail.com>
 +DRM DRIVER FOR MSM ADRENO GPU
 +M:	Rob Clark <robdclark@gmail.com>
 +L:	linux-arm-msm@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
 -T:	git git://anongit.freedesktop.org/tegra/linux.git
 +L:	freedreno@lists.freedesktop.org
 +T:	git git://people.freedesktop.org/~robclark/linux
  S:	Maintained
 -F:	drivers/gpu/drm/drm_panel.c
 -F:	drivers/gpu/drm/panel/
 -F:	include/drm/drm_panel.h
 -F:	Documentation/devicetree/bindings/display/panel/
 +F:	drivers/gpu/drm/msm/
 +F:	include/uapi/drm/msm_drm.h
 +F:	Documentation/devicetree/bindings/display/msm/
 =20
 -INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
 -M:	Daniel Vetter <daniel.vetter@intel.com>
 -M:	Jani Nikula <jani.nikula@linux.intel.com>
 -L:	intel-gfx@lists.freedesktop.org
 -W:	https://01.org/linuxgraphics/
 -B:	https://01.org/linuxgraphics/documentation/how-report-bugs
 -C:	irc://chat.freenode.net/intel-gfx
 -Q:	http://patchwork.freedesktop.org/project/intel-gfx/
 -T:	git git://anongit.freedesktop.org/drm-intel
 +DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 +M:	Ben Skeggs <bskeggs@redhat.com>
 +L:	dri-devel@lists.freedesktop.org
 +L:	nouveau@lists.freedesktop.org
 +T:	git git://github.com/skeggsb/linux
  S:	Supported
 -F:	drivers/gpu/drm/i915/
 -F:	include/drm/i915*
 -F:	include/uapi/drm/i915_drm.h
 -F:	Documentation/gpu/i915.rst
 +F:	drivers/gpu/drm/nouveau/
 +F:	include/uapi/drm/nouveau_drm.h
 =20
 -INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 -M:      Zhenyu Wang <zhenyuw@linux.intel.com>
 -M:      Zhi Wang <zhi.a.wang@intel.com>
 -L:      intel-gvt-dev@lists.freedesktop.org
 -L:      intel-gfx@lists.freedesktop.org
 -W:      https://01.org/igvt-g
 -T:      git https://github.com/01org/gvt-linux.git
 -S:      Supported
 -F:      drivers/gpu/drm/i915/gvt/
++DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
++M:	Noralf Tr=C3=B8nnes <noralf@tronnes.org>
++S:	Maintained
++F:	drivers/gpu/drm/tinydrm/repaper.c
++F:	Documentation/devicetree/bindings/display/repaper.txt
+=20
 -DRM DRIVERS FOR ATMEL HLCDC
 -M:	Boris Brezillon <boris.brezillon@free-electrons.com>
 +DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 +M:	Dave Airlie <airlied@redhat.com>
 +M:	Gerd Hoffmann <kraxel@redhat.com>
 +L:	virtualization@lists.linux-foundation.org
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
 +S:	Obsolete
 +W:	https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmf=
ul/
 +F:	drivers/gpu/drm/cirrus/
 +
 +DRM DRIVER FOR QXL VIRTUAL GPU
 +M:	Dave Airlie <airlied@redhat.com>
 +M:	Gerd Hoffmann <kraxel@redhat.com>
 +L:	virtualization@lists.linux-foundation.org
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
 +S:	Maintained
 +F:	drivers/gpu/drm/qxl/
 +F:	include/uapi/drm/qxl_drm.h
 +
 +DRM DRIVER FOR RAGE 128 VIDEO CARDS
 +S:	Orphan / Obsolete
 +F:	drivers/gpu/drm/r128/
 +F:	include/uapi/drm/r128_drm.h
 +
 +DRM DRIVER FOR SAVAGE VIDEO CARDS
 +S:	Orphan / Obsolete
 +F:	drivers/gpu/drm/savage/
 +F:	include/uapi/drm/savage_drm.h
 +
 +DRM DRIVER FOR SIS VIDEO CARDS
 +S:	Orphan / Obsolete
 +F:	drivers/gpu/drm/sis/
 +F:	include/uapi/drm/sis_drm.h
 +
 +DRM DRIVER FOR TDFX VIDEO CARDS
 +S:	Orphan / Obsolete
 +F:	drivers/gpu/drm/tdfx/
 +
 +DRM DRIVER FOR USB DISPLAYLINK VIDEO ADAPTERS
 +M:	Dave Airlie <airlied@redhat.com>
 +S:	Odd Fixes
 +F:	drivers/gpu/drm/udl/
 +
 +DRM DRIVER FOR VMWARE VIRTUAL GPU
 +M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 +M:	Sinclair Yeh <syeh@vmware.com>
 +M:	Thomas Hellstrom <thellstrom@vmware.com>
  L:	dri-devel@lists.freedesktop.org
 +T:	git git://people.freedesktop.org/~syeh/repos_linux
 +T:	git git://people.freedesktop.org/~thomash/linux
  S:	Supported
 -F:	drivers/gpu/drm/atmel-hlcdc/
 -F:	Documentation/devicetree/bindings/drm/atmel/
 +F:	drivers/gpu/drm/vmwgfx/
 +F:	include/uapi/drm/vmwgfx_drm.h
 +
 +DRM DRIVERS
 +M:	David Airlie <airlied@linux.ie>
 +L:	dri-devel@lists.freedesktop.org
 +T:	git git://people.freedesktop.org/~airlied/linux
 +B:	https://bugs.freedesktop.org/
 +C:	irc://chat.freenode.net/dri-devel
 +S:	Maintained
 +F:	drivers/gpu/drm/
 +F:	drivers/gpu/vga/
 +F:	Documentation/devicetree/bindings/display/
 +F:	Documentation/devicetree/bindings/gpu/
 +F:	Documentation/devicetree/bindings/video/
 +F:	Documentation/gpu/
 +F:	include/drm/
 +F:	include/uapi/drm/
 +F:	include/linux/vga*
 +
 +DRM DRIVERS AND MISC GPU PATCHES
 +M:	Daniel Vetter <daniel.vetter@intel.com>
 +M:	Jani Nikula <jani.nikula@linux.intel.com>
 +M:	Sean Paul <seanpaul@chromium.org>
 +W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
 +S:	Maintained
  T:	git git://anongit.freedesktop.org/drm/drm-misc
 +F:	Documentation/gpu/
 +F:	drivers/gpu/vga/
 +F:	drivers/gpu/drm/*
 +F:	include/drm/drm*
 +F:	include/uapi/drm/drm*
 +F:	include/linux/vga*
 =20
  DRM DRIVERS FOR ALLWINNER A10
  M:	Maxime Ripard  <maxime.ripard@free-electrons.com>
