From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the cpufreq-arm tree
Date: Fri, 18 Jan 2019 16:33:07 +1100
Message-ID: <20190118163307.03bd6710@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bjEUKAb9lkwEFU/uoNpoNdc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bjEUKAb9lkwEFU/uoNpoNdc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

In commit

  3ca12c96ef5e ("MAINTAINERS: use common indentation")

Fixes tag

  Fixes: 46e2856b8e188949757c9123fd7f9ce36edd1a52

Fixes tags should be in this format:

  Fixes: 46e2856b8e18 ("cpufreq: Add Kryo CPU scaling driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/bjEUKAb9lkwEFU/uoNpoNdc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBZRMACgkQAVBC80lX
0Gw0lgf/WP5OBAbTgWyjx2Es9pKXovjKtzKBU0MFCrVHmnUTOX+BzOn9obH9ginW
gsFOi13oVI+m3SEYZevvnjp4mJ0/2KI3M0rwkrJWNticIu3pzXmIcP1lYRI8bRJY
e5KhvKF1dJ5cFwlY/+FGKCtpF+zie6P82wkVmlKGYrDxQWz4f2eJnLht2w0QQ4e9
OHrjfQmnwiXyy1il7WAjJALPPGiu2xyYQJ4PbtUUcLKGWMWQu+Uk/kC426PXJ2Vg
pmOYucrPEGHsMQBIhRqsoUuhM7DYVkv549uTb0RQx9IjCMaMyo3nHKzEnYSJfYNg
a1uOSTfx8WdD7aC3UnEwP/lD2+p2kw==
=+BBN
-----END PGP SIGNATURE-----

--Sig_/bjEUKAb9lkwEFU/uoNpoNdc--
