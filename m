From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 24 Jul 2017 12:06:05 +1000
Message-ID: <20170724120605.1044d6b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55943 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751782AbdGXCGI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Jul 2017 22:06:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Noralf =?UTF-8?B?VHLDuG5u?= =?UTF-8?B?ZXM=?= <noralf@tronnes.org>, Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  MAINTAINERS

between commit:

  82abbea734d6 ("MAINTAINERS: fix alphabetical ordering")

from Linus' tree and commit:

  3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 55859cdde82a,9387e6aed3b8..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -4535,6 -4531,27 +4535,12 @@@ F:	include/linux/host1x.
  F:	include/uapi/drm/tegra_drm.h
  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.=
txt
 =20
 -DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
 -S:	Orphan / Obsolete
 -F:	drivers/gpu/drm/mga/
 -F:	include/uapi/drm/mga_drm.h
 -
 -DRM DRIVER FOR MGA G200 SERVER GRAPHICS CHIPS
 -M:	Dave Airlie <airlied@redhat.com>
 -S:	Odd Fixes
 -F:	drivers/gpu/drm/mgag200/
 -
+ DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
+ M:	Noralf Tr=C3=B8nnes <noralf@tronnes.org>
+ S:	Maintained
+ F:	drivers/gpu/drm/tinydrm/repaper.c
+ F:	Documentation/devicetree/bindings/display/repaper.txt
+=20
 -DRM DRIVER FOR RAGE 128 VIDEO CARDS
 -S:	Orphan / Obsolete
 -F:	drivers/gpu/drm/r128/
 -F:	include/uapi/drm/r128_drm.h
 -
  DRM DRIVERS FOR RENESAS
  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  L:	dri-devel@lists.freedesktop.org
