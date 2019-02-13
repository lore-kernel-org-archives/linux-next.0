From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the drm-fixes tree
Date: Wed, 13 Feb 2019 21:36:42 +1100
Message-ID: <20190213213642.2d980994@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F7mdYu/8dbNmNNZxbk8NiyX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/F7mdYu/8dbNmNNZxbk8NiyX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bb867d219fda ("gpu: ipu-v3: Fix CSI offsets for imx53")

Fixes tag

  Fixes: 2ffd48f2e7 ("gpu: ipu-v3: Add Camera Sensor Interface unit")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  2c0408dd0d89 ("gpu: ipu-v3: Fix i.MX51 CSI control registers offset")

Fixes tag

  Fixes: 2ffd48f2e7 ("gpu: ipu-v3: Add Camera Sensor Interface unit")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/F7mdYu/8dbNmNNZxbk8NiyX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxj8zoACgkQAVBC80lX
0GzRVAf7Bs+SIUV1xY2TI78/YhLT38xA+p4+nm8tSDcNnsjAI80+J8PkcRaSUktR
pe8Och0obcwgc5JZL4/JGCSkuD4fNk1ap0mUfaRTjHeDJQQ9ODe0AbDI7HeZvZsE
x+hAT3J+DWlue6/23Oo/fAPGpBq7b7STNv8dedpxWJXnuu6kzMX4zh8bH/BvnwSa
efvPZH3FfaDwzumH4DUhJjqcmfPY3mFjlG+0R8KzT0QjjGn2FjruAo4MBP52BSKm
97Mw+Ne1P0RODX9zxnkzF+aaSNo6AGEAacSTHvihLMyCNoKxVBndTvg5/hIz+bMs
CZUlauU3M5X2+1TMPveBGOw9XRX9TQ==
=9MM2
-----END PGP SIGNATURE-----

--Sig_/F7mdYu/8dbNmNNZxbk8NiyX--
