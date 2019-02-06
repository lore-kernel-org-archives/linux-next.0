From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Wed, 6 Feb 2019 11:42:20 +1100
Message-ID: <20190206114220.5632c187@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XUHT78JYPH91x4gAW9wdL.Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/XUHT78JYPH91x4gAW9wdL.Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_pci.c

between commit:

  fcd70cd36b9b ("drm: Split out drm_probe_helper.h")

from the drm tree and commit:

  5f5c139d6900 ("drm/i915: Allocate active tracking nodes from a slabcache")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_pci.c
index 5d05572c9ff4,36fa6f1905fc..000000000000
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@@ -26,8 -26,7 +26,9 @@@
  #include <linux/vgaarb.h>
  #include <linux/vga_switcheroo.h>
 =20
 +#include <drm/drm_drv.h>
 +
+ #include "i915_active.h"
  #include "i915_drv.h"
  #include "i915_selftest.h"
 =20

--Sig_/XUHT78JYPH91x4gAW9wdL.Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxaLWwACgkQAVBC80lX
0GyQ5Qf/QB6W0fsgclxSn92fdfS1sA2Sirv0GdLVK45gy7YQLuplprQn+g/0F1Mn
cGCpcULL0kVQus/avo5acFxQBffTHpvgXVurhNWZa/N7lsSnrA2w/k4yJF50M2ZU
8niXZu+EPJb5kjmhEfWyTGL3X4eBbgChBXxnrX05yWYbRP4lLm4oi8oNeHwHJ510
CrM/TDrhBfFaehhJNnNc1sCQPTd10W5Y3hcnBuOYn+qYpdVHdInjz4GdsPQZsvdr
V76lTo9n7LOwPbA646DWvRk7ZW191hGXAiTWSn3+ez5gmdyCgC0zOpEfIirJUS6K
YtiNKoAph+LSUnoAsGNQKXewkRDSdg==
=+cpd
-----END PGP SIGNATURE-----

--Sig_/XUHT78JYPH91x4gAW9wdL.Q--
