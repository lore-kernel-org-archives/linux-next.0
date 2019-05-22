From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Thu, 23 May 2019 09:58:16 +1000
Message-ID: <20190523095816.2fd950f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iqoc+GgWuISAZa6f0roKMrT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ramalingam C <ramalingam.c@intel.com>, Uma Shankar <uma.shankar@intel.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iqoc+GgWuISAZa6f0roKMrT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_mode_config.h

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

diff --cc include/drm/drm_mode_config.h
index 5764ee3c7453,c031b5a9d8d1..000000000000
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@@ -836,12 -836,13 +836,19 @@@ struct drm_mode_config=20
  	 */
  	struct drm_property *writeback_out_fence_ptr_property;
 =20
 +	/**
 +	 * @content_protection_property: DRM ENUM property for content
 +	 * protection. See drm_connector_attach_content_protection_property().
 +	 */
 +	struct drm_property *content_protection_property;
 +
+ 	/**
+ 	 * hdr_output_metadata_property: Connector property containing hdr
+ 	 * metatda. This will be provided by userspace compositors based
+ 	 * on HDR content
+ 	 */
+ 	struct drm_property *hdr_output_metadata_property;
+=20
  	/* dumb ioctl parameters */
  	uint32_t preferred_depth, prefer_shadow;
 =20

--Sig_/iqoc+GgWuISAZa6f0roKMrT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzl4hgACgkQAVBC80lX
0GwvNAf/e7CBkRU+Cwrf5MF74yDaDjYq1i+q6cdNZgWm1pjYAHtD+2QarsztG3fI
8Ln3ug+xGjuoWWDSWQ4kkDWRg2L//Viqt5EmUrQFKrvxvOBBWE4936f1kfJg9JGp
neOdvZEGjRgQo8xcKW/5KP7WQvNw+yelYPZ1p3IdQ2oigr7y0SewpICvWnIPEeUa
MAqY9sBmCp+S326XWvjlPoAnMZUbzzsnnUZUYMt3yzUui1k8UaYAG9WGPyx2WNgs
Qxi+1CsuV9GVpoAao+4s1QsLJDUZ9nCjT/GgN56mQR+NBFyfTTtfY/yBxyzAkxu/
kfA2Tk1W5TcIrEbrf3/mX/OifV3dgA==
=xKAU
-----END PGP SIGNATURE-----

--Sig_/iqoc+GgWuISAZa6f0roKMrT--
