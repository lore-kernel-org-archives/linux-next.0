From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Date: Fri, 8 Feb 2019 22:01:37 +1100
Message-ID: <20190208220137.3b72799a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/C3feybT0Xi3BFuawYg3fEx6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
List-Id: linux-next.vger.kernel.org

--Sig_/C3feybT0Xi3BFuawYg3fEx6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  053ff09f1a8f ("drm/rockchip: rgb: update SPDX license identifier")

Fixes tag

  Fixes: 1f0f01515172 ("Add support for Rockchip Soc RGB output interface")

has these problem(s):

  - Subject does not match target commit subject

--=20
Cheers,
Stephen Rothwell

--Sig_/C3feybT0Xi3BFuawYg3fEx6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxdYZEACgkQAVBC80lX
0Gw0QAf8C046C8xPcADPgFxNqDSejsvRmKF/t9scVN+qKCPHg+kXidE9dVulT8bV
tC5HCFGinJE98OJ+3V5SUN6Y5Dc39iSfTUbRjgOH7p7/Z1WIMNwquwPVez6oJVUk
M2zRAOJdPYGfPEttQOa1KhRK3p2fsoPLKYHmtUPnucAJFaHizhZZNg1iB+zIUDF/
xx4Mf85c5Q+zosgT3aGdfeTdrwfnLC2wUIzzBnrSgTFp4c3ubXmVEIMDvdeY8N3s
1XAKRgOSxvAOuTjaNHYZfK0F2I2hL6i1ApuDGvxOHtS3lx29aNbFGFpajhx+9PjV
+kfslUgn5/HeT4m4Hz7H05R67fnI2g==
=M+UJ
-----END PGP SIGNATURE-----

--Sig_/C3feybT0Xi3BFuawYg3fEx6--
