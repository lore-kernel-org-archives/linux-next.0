From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 4 Jun 2018 13:09:00 +1000
Message-ID: <20180604130900.07deb177@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/blmek0qS6/Swspi6Zx9D8.A"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Francis <David.Francis@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/blmek0qS6/Swspi6Zx9D8.A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  a9e8d27574f2 ("drm/amd/display: Make atomic-check validate underscan chan=
ges")

from Linus' tree and commit:

  dm_update_crtcs_state ("drm/amd/display: Couple formatting fixes")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 27579443cdc5,1ce10bc2d37b..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -4577,14 -4650,11 +4650,14 @@@ static int dm_update_crtcs_state(struc
  		/* TODO This hack should go away */
  		if (aconnector && enable) {
  			// Make sure fake sink is created in plug-in scenario
 -			new_con_state =3D drm_atomic_get_connector_state(state,
 +			drm_new_conn_state =3D drm_atomic_get_new_connector_state(state,
-  								    &aconnector->base);
+ 								    &aconnector->base);
 +			drm_old_conn_state =3D drm_atomic_get_old_connector_state(state,
 +								    &aconnector->base);
 +
 =20
 -			if (IS_ERR(new_con_state)) {
 -				ret =3D PTR_ERR_OR_ZERO(new_con_state);
 +			if (IS_ERR(drm_new_conn_state)) {
 +				ret =3D PTR_ERR_OR_ZERO(drm_new_conn_state);
  				break;
  			}
 =20

--Sig_/blmek0qS6/Swspi6Zx9D8.A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsUrUwACgkQAVBC80lX
0Gyn2Af+Lpg5Wdv71CFqwaPPxWZ4uIMePiomUygDKAFiJE4X69LCKvZPG6r7L3ww
KsqxwZ86hr70yEllebObtd0CdhypywI9DHEYH/VNMAu+rAVOgk+KNGKiAC94LBMG
vLwHSEEdOybfhRXHyZwh7KWccnmKUqk1lFy+wrHV7B/8m/uoIICqJ5Q1RzKkUdfe
pBkqkrQ7+rnpoYe/W69Nop18QXbllipPnLgMLZVKf4fBhBosItOB5ROCFK1GMixi
s6g9hOC4Pu5kYBYO5Ok8hdSnxjO22GbQMAhnFwwSgGYMhksqTbcBRtCxzLi85zKC
XrdE8frv3w+zxB2ZamP6xVHLtZDTtA==
=7zR4
-----END PGP SIGNATURE-----

--Sig_/blmek0qS6/Swspi6Zx9D8.A--
