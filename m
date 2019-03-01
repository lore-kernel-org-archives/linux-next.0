From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Fri, 1 Mar 2019 13:23:51 +1100
Message-ID: <20190301132351.6f4e815f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UfcNgO3NRzprj7em811gPnl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Kleiner <mario.kleiner.de@gmail.com>, David Francis <David.Francis@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UfcNgO3NRzprj7em811gPnl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  d63716658ac1 ("drm/amd/display: Use vrr friendly pageflip throttling in D=
C.")

from the drm-fixes tree and commits:

  8a48b44cd00f ("drm/amd/display: Call into DC once per multiplane flip")
  bc7f670ee04c ("drm/amd/display: Perform plane updates only when needed")

from the drm tree.

I had no idea how to resolve this, so I just effectively reverted the
drm-fixes commit.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/UfcNgO3NRzprj7em811gPnl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx4l7cACgkQAVBC80lX
0Gwk2gf/db06P2eC151aw7EZr+PzAu18jkqbNDEMzeVWYd+7oMjcmlY2BEnQA040
Z+uL90Lu24M0ar8lCwRpvq6A7KJG0IzhgudHYG0K6JzWwP+MmJsUYZT1rzTpLcuy
EsNRI00+UQTK51LsSTYdToQsMNX2maasDtlZzYtkXoooRB8oRsytyiDaGBAVA/pb
C4IvTeYqtDGC/viJ+0oqHaUUEVf9uuipXaThUlt8XO/l7RSs2ytQfqPfXExmpEoL
PMEgSBG26etYrNTpZoR6ksmR728W3cozR5jl20eLGsRT8lgMIPyIivu5v5xUo0Oo
xT0MmQdddaFU0oDPBz5NkW6zoDM4Tg==
=NNfy
-----END PGP SIGNATURE-----

--Sig_/UfcNgO3NRzprj7em811gPnl--
