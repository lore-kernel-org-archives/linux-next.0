From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Thu, 23 May 2019 09:53:41 +1000
Message-ID: <20190523095341.728a79b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XP=lWq5qsA1xog0vpv4kTbS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ramalingam C <ramalingam.c@intel.com>, Uma Shankar <uma.shankar@intel.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XP=lWq5qsA1xog0vpv4kTbS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_atomic_uapi.c

between commit:

  585b000de23b ("drm: move content protection property to mode_config")

from the drm-intel tree and commit:

  fbb5d0353c62 ("drm: Add HDR source metadata property")

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

diff --cc drivers/gpu/drm/drm_atomic_uapi.c
index 4131e669785a,125605ff45af..000000000000
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@@ -814,7 -823,10 +823,10 @@@ drm_atomic_connector_get_property(struc
  		*val =3D state->colorspace;
  	} else if (property =3D=3D connector->scaling_mode_property) {
  		*val =3D state->scaling_mode;
+ 	} else if (property =3D=3D config->hdr_output_metadata_property) {
+ 		*val =3D state->hdr_output_metadata ?
+ 			state->hdr_output_metadata->base.id : 0;
 -	} else if (property =3D=3D connector->content_protection_property) {
 +	} else if (property =3D=3D config->content_protection_property) {
  		*val =3D state->content_protection;
  	} else if (property =3D=3D config->writeback_fb_id_property) {
  		/* Writeback framebuffer is one-shot, write and forget */

--Sig_/XP=lWq5qsA1xog0vpv4kTbS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzl4QUACgkQAVBC80lX
0GxSWwf+MTWafkXTbuoTHRn6ceiKD4K1BQsTENaQOxEaubqh5y9mLJZFPSonoirH
a/7tG2u3KTKKMI4fqHLWvnyHVUn7piAf7IU+rTFYHc1Mrfj8wYJzc8CbrS0AbQ14
840CxOiUewJJtziqeL4KGIrkQXD7KmQYtc/CgYN1OImZc9L344VS919941yEz8ad
MEEBPraKYvn4eYAVBhNmRGJR2H8/DSoprmJ26bCC/usFBLOI+Ux8yjIie1AF+Ev9
AKxufmlfLF22L7tIXnPLbAm6xe2SpjerAYK8hCHAp1Uv5swqsXj1TxFuIa0Bo87w
PmCWifWI4YNoD2JqY57vP2pS9eEWFQ==
=bwN4
-----END PGP SIGNATURE-----

--Sig_/XP=lWq5qsA1xog0vpv4kTbS--
