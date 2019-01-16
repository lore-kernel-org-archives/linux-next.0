From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm-misc tree
Date: Thu, 17 Jan 2019 08:13:51 +1100
Message-ID: <20190117081351.661539c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d6ZA1OcL.iAiJtEIBDxPVQ."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/d6ZA1OcL.iAiJtEIBDxPVQ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi all,

Commit

  94520db52fc0 ("drm: fix alpha build after drm_util.h change")

has a malformed Fixes tag:

  Fixes: 733748ac37b45 ("drm: move drm_can_sleep() to drm_util.h")

The SHA1 does not reference a commit currently in the tree.  Maybe it
was meant to be e9eafcb58921.

--=20
Cheers,
Stephen Rothwell

--Sig_/d6ZA1OcL.iAiJtEIBDxPVQ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw/no8ACgkQAVBC80lX
0Gwmqgf+NL4U8JStAX92XZgjZQw7/hFo5KY57biiSGgVj41hvBd8eeaflmBNf7R6
FvlLouSJ1EVggH2MDriUCchPzrpymJuVyESeGhk9vyT4oerf/2aRsRgQ/1QL27VO
Nya6AhYTNudr8RMjLSkwV/lMKqiDa6+e7BI9tFTukFTpN1xXAQdx3n+RoOdzDHVL
Zf1zauC289c1PD+erRtXP2xsM+uWl+OJ2H60DicrC02tMttgvVzk0RCFkwftApIg
M2IaOpMUsJjtaeh/Be/H2TOWL/ep0bQoiFkM6HbzcB79ri847+nFs3GX6q5Y00Fs
nqFKj9LA8kvDdh5wC/8RXPCqwrV5ZQ==
=E49g
-----END PGP SIGNATURE-----

--Sig_/d6ZA1OcL.iAiJtEIBDxPVQ.--
