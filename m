From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Fri, 7 Dec 2018 13:31:41 +1100
Message-ID: <20181207133141.523b8417@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+s.zoL+r44rIKQ=uSDVM_Bx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Francis <David.Francis@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+s.zoL+r44rIKQ=uSDVM_Bx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  49f1c44b581b ("rm/amd/display: Fix unintialized max_bpc state values")

from the drm-fixes tree and commits:

  c1ee92f94ce3 ("drm/amd: Add abm level drm property")
  bb47de736661 ("drm/amdgpu: Set FreeSync state using drm VRR properties")

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
index 5a6edf65c9ea,32e791d9b9a8..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -3063,8 -3234,7 +3235,8 @@@ amdgpu_dm_connector_atomic_duplicate_st
  	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->bas=
e);
 =20
  	new_state->freesync_capable =3D state->freesync_capable;
- 	new_state->freesync_enable =3D state->freesync_enable;
 +	new_state->max_bpc =3D state->max_bpc;
+ 	new_state->abm_level =3D state->abm_level;
 =20
  	return &new_state->base;
  }

--Sig_/+s.zoL+r44rIKQ=uSDVM_Bx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJ240ACgkQAVBC80lX
0GxqhQf9HTp1YC9uykaXRQ4bhYvLF33YDBYDB/IFYPsgJmJDeKuvBomLV/f+TsJu
vf+Dwg/a359/6CePohUgK516PiaoDeOpHlreSgG0QrcRh/nMrWfmcEvX1cnu8Zf2
59zr6kVJTB4IJcnt7+0Bv3KYp2Vo6uTC7EUYN3x+lGYkYroV5ZzokDXuFboNGmxo
qZ+HOGKKhVPEXjtcfGbIrTSaaVmRxo4UHsOcGrxnwwxktHNcDMbOzwN3V//3yF1l
Yl98X1GFDV+HLDFFAcJoavWUQwHIaBEjTAljdi8Tov+fQixa4Jb8hXMTIMCJoRzj
qt69FGiEVRn7LL9WsiGexzT92nmvbQ==
=+2Fg
-----END PGP SIGNATURE-----

--Sig_/+s.zoL+r44rIKQ=uSDVM_Bx--
