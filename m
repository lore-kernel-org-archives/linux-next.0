From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Date: Fri, 31 May 2019 16:11:02 +1000
Message-ID: <20190531161102.4d0b2c97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UapcH+QXdAMGnKLiDJYuPms"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/UapcH+QXdAMGnKLiDJYuPms
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  137caa702f23 ("drm/imx: ipuv3-plane: fix atomic update status query for n=
on-plus i.MX6Q")

Fixes tag

  Fixes: 70e8a0c71e9 ("drm/imx: ipuv3-plane: add function to query atomic u=
pdate status")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/UapcH+QXdAMGnKLiDJYuPms
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwxXYACgkQAVBC80lX
0GwAJAf9EZ4F+IIwdZgVNyjEgLVKZbCJaJCYG6klilNRKDn+LpUeAudzXvxr5BnD
OVvt/z3EGsnkEcnbLnMNxNNfl3GBDr5oLMOBWyoJcRmG2dlpYnh2A5OVBezvRLlO
G9/OnmM/b7Az6QKNvTC9GyneIviCOhyLculeOjjskqAZE1N6k8n7n+3Y3hFdxq3V
RaINsrVHP6icyLGb/VzuSqva/WZGETQwRyeizhmdJ66jWbHFi2vUtwp5ePn5X3XV
UGtIucKXbE93oksslaHh7yyPSO7drGQOKG183aJFPyqudle8l0PhT4PDe/LDrGUX
DGsqz0YLYvkpaOCL4nh4bq+r0I8e1A==
=PFWD
-----END PGP SIGNATURE-----

--Sig_/UapcH+QXdAMGnKLiDJYuPms--
