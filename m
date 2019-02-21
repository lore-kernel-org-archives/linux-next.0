From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the kvm-ppc tree
Date: Thu, 21 Feb 2019 22:17:53 +1100
Message-ID: <20190221221753.74e37ec1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FOre+3j.TkcYo7/KAoI8gyL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/FOre+3j.TkcYo7/KAoI8gyL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

In commit

  a67614cc05a5 ("KVM: PPC: Release all hardware TCE tables attached to a gr=
oup")

Fixes tag

  Fixes: 121f80ba68f ("KVM: PPC: VFIO: Add in-kernel acceleration for VFIO")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/FOre+3j.TkcYo7/KAoI8gyL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxuiOEACgkQAVBC80lX
0Gy+uwgAnPQhQL6Tds9qPrg/xzRDiKoIm2dus8KExAZWW1xp+fQY2VrNKmmG+Jha
/ULaDzgTsGQOR3kjbUTkAEZnKU0Kxi/48RKWEXpit48Vp/hr5LCTYs2R2WNm7xKp
V6xIgAbSylTeplzO3COm5BT3RPr6kbjVCOCsgDKKnvee25tTarG588h/0VzU4AvU
shunmfE8NNrPLyIJZ7PJOjndR58IKTe5XF2Fy4EDUE6Dv50R/bM7x7/NTG/W9981
/uBQkWfgE7+XAQJ1HSSG+IjFXCs8KYfXw25T6W+pTUzxYO1QxG8KXfxtuaQeZDXj
e6ZH5ZP22SgNDb9p9Yl0dXHuSXLn/Q==
=lt0R
-----END PGP SIGNATURE-----

--Sig_/FOre+3j.TkcYo7/KAoI8gyL--
