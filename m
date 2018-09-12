From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Wed, 12 Sep 2018 10:39:52 +1000
Message-ID: <20180912103952.6f439e71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aZLBaNy0rR/pAyR8cCuc8g/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/aZLBaNy0rR/pAyR8cCuc8g/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.h

between commit:

  dce888798d3e ("drm/i915: remove confusing GPIO vs PCH_GPIO")

from the drm tree and commit:

  d78aa650670d ("drm: Add drm/drm_util.h header file")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_display.h
index e20e6a36a748,809c06ae4c07..000000000000
--- a/drivers/gpu/drm/i915/intel_display.h
+++ b/drivers/gpu/drm/i915/intel_display.h
@@@ -25,22 -25,8 +25,24 @@@
  #ifndef _INTEL_DISPLAY_H_
  #define _INTEL_DISPLAY_H_
 =20
+ #include <drm/drm_util.h>
+=20
 +enum i915_gpio {
 +	GPIOA,
 +	GPIOB,
 +	GPIOC,
 +	GPIOD,
 +	GPIOE,
 +	GPIOF,
 +	GPIOG,
 +	GPIOH,
 +	__GPIOI_UNUSED,
 +	GPIOJ,
 +	GPIOK,
 +	GPIOL,
 +	GPIOM,
 +};
 +
  enum pipe {
  	INVALID_PIPE =3D -1,
 =20

--Sig_/aZLBaNy0rR/pAyR8cCuc8g/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluYYFgACgkQAVBC80lX
0Gx2qAf/bYg4cs1wNRFYgpsUBMqOrJdDH6bKlP872uoMvJ+g2a11x/hcqXjPJ4SM
cPDlZEAqa1k32kg6TZTih2p8R7ShXIRCtCHTNyOdSkuR4KttMHCYgPwod6pxv9ZU
+qUIjKqvh5usL9maRqYRd/fCXjFuUZsgwIfU4d/wY1QnIEzASj4HzqR9VuAr3BcX
TcVXimY+APoKgLWNLQC2f71Vq5fFKCxakfxCClFEaT81xcDYYgUUQunq6JeJqcB5
TE+Eboat+to+hX0SFutZ7d6q1hQLrWxh/SFt6NgzPFSMoJX3G8L5rfIYsOocGHta
sA7u+qyKgp6HUBUKge1rws6RmXMCRA==
=u2C0
-----END PGP SIGNATURE-----

--Sig_/aZLBaNy0rR/pAyR8cCuc8g/--
