From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Fri, 8 Feb 2019 12:27:44 +1100
Message-ID: <20190208122744.4a63bec0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0_T==Z=29r/u++WozInW5UT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/0_T==Z=29r/u++WozInW5UT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  9f58892ea996 ("drm/i915: Pull all the reset functionality together into i=
915_reset.c")

from the drm tree and commit:

  d0e93599d396 ("drm/i915: prepare for drmP.h removal from drm_modeset_help=
er.h")

from the drm-misc tree.

I fixed it up (I think I got the right include files in the right order in
the end - see below and please check the final result) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/0_T==Z=29r/u++WozInW5UT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxc2xAACgkQAVBC80lX
0GylaggAjPC9HHdpNadMV9CvoolOn3OaLbZwNK+ZUmluW48Txp3IvtTWNAUqwK/o
/WdATEJlUw4o3AhJR6CqeuU7hN+U+sajYp83L8bHoUx4P0vu5sq0F+RreB7IeDE0
VF1IPW7Hh6oJrg2UVdjFRL2/YWTLjsgVf3nwX9dtyT9e0ujqYzT3iQfmgDix4V6L
Cb0P80XfTBUu9NHzP59M0eMt9wWcjMiHq/K+gN8BnNOi0kXREEurenOH7R3khQYs
YImrErySL2wbc0dVY7/hNAOdziSEgejfm/Dou+MxDeEOXfXIl8RuxRTK5/Bdo6Rx
JYNEKHlCn5uiBqosdVNx3M4s6S2YTg==
=sAO9
-----END PGP SIGNATURE-----

--Sig_/0_T==Z=29r/u++WozInW5UT--
