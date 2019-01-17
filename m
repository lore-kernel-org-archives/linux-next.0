From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the imx-drm tree
Date: Fri, 18 Jan 2019 07:50:01 +1100
Message-ID: <20190118075001.6ce1d088@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3UE/NSD7f7zVGAmH2yIIzUU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/3UE/NSD7f7zVGAmH2yIIzUU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

Commit

  bb867d219fda ("gpu: ipu-v3: Fix CSI offsets for imx53")

Fixes tag

  Fixes: 2ffd48f2e7 ("gpu: ipu-v3: Add Camera Sensor Interface unit")

has these problems:

  - SHA1 should be at least 12 digits long

Commit

  2c0408dd0d89 ("gpu: ipu-v3: Fix i.MX51 CSI control registers offset")

Fixes tag

  Fixes: 2ffd48f2e7 ("gpu: ipu-v3: Add Camera Sensor Interface unit")

has these problems:

  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_/3UE/NSD7f7zVGAmH2yIIzUU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxA6nkACgkQAVBC80lX
0GxhLgf9FbeiI4wacaLPqUs3dBEH6G7Qc/YN31GkVSy48SsLNVXHTbBYoMCTygmp
vLMqwjyOroNveI7z+0C9MaisdCsqmj3pfsyvLjqLomQr9G8q4obkcMY2FjlxMWBS
/c7AZPWHsFrHM3LFpPk+5s/DBiLATltzmb2uO4rFgFF6eD03ye+PN30+qmz2bogl
BESqVisfohgcwgLIwoS5N+FAfADHwHDuiDBZ3fqf0J7w4UjLmAx6yP93j00AJBOb
c4bQDyg+rUF94CfMSLz+hrwMjnjM8ItZ6Brtt/jMtgnqOPWxvMxmsn2WHRBNHhB8
ospZgvuBH//pJ+lT/NaNCI4pnEXY0A==
=+QMu
-----END PGP SIGNATURE-----

--Sig_/3UE/NSD7f7zVGAmH2yIIzUU--
